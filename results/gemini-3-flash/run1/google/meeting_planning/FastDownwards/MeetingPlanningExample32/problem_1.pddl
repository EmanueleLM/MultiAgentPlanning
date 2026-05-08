(define (problem meeting_planning_problem)
  (:domain meeting_planning)

  (:objects
    the_castro golden_gate_park - location
    t0900 t0911 t1056 - time
    jeffrey - person
  )

  (:init
    ;; Starting conditions
    (at the_castro)
    (time_at t0900)

    ;; Movement constraints: Castro to GGP takes 11 minutes
    ;; 9:00AM (t0900) + 11 mins = 9:11AM (t0911)
    (travel_info the_castro golden_gate_park t0900 t0911)

    ;; Meeting constraints: Jeffrey at GGP (7:00AM - 5:30PM)
    ;; Meeting duration requirement: 105 minutes
    ;; Meeting starts at 9:11AM (t0911) and ends at 10:56AM (t1056)
    ;; 9:11AM + 105 mins = 10:56AM.
    ;; Both 9:11AM and 10:56AM are within Jeffrey's window (7:00AM to 5:30PM).
    (meeting_info jeffrey golden_gate_park t0911 t1056)
  )

  (:goal
    (has_met jeffrey)
  )
)