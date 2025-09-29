(define (problem meet-margaret-problem)
  (:domain multiagent-meet)
  (:objects
    planner margaret - agent
    union-square north-beach - location
  )

  ; Time origin: 9:00 AM = time 0 (minutes). All timed initial literals are in minutes since 9:00 AM.
  ; Margaret presence window: 9:45 PM - 10:30 PM => 21:45 - 22:30
  ; Minutes from 9:00 AM:
  ; 9:45 PM = 21:45 => 12h45m after 9:00 AM = 765 minutes
  ; 10:30 PM = 22:30 => 13h30m after 9:00 AM = 810 minutes

  (:init
    ; Planner arrival at Union Square at 9:00AM (time 0)
    (at planner union-square)

    ; Initialize met-count to 0
    (= (met-count) 0)

    ; Margaret will be at North Beach from 765 .. 810 (TILs)
    (at 765 (at margaret north-beach))
    (at 810 (not (at margaret north-beach)))

    ; Margret-present predicate is true during her window (useful for over-all conditions)
    (at 765 (margaret-present))
    (at 810 (not (margaret-present)))
  )

  ; Hard goal: meet Margaret for at least 45 minutes at North Beach.
  ; The meeting action has duration 45 and requires margaret-present over all its duration,
  ; therefore this enforces the meeting to be scheduled starting at 765 and ending at 810
  ; (the only feasible placement that fits Margaret's window).
  (:goal
    (and
      (met margaret)
    )
  )

  ; Objective: maximize the number of friends met (met-count). With only Margaret modeled,
  ; this drives the planner to perform the meet action; kept as a maximize metric for extensibility.
  (:metric maximize (met-count))
)