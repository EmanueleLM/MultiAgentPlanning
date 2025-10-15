(define (problem meet-joshua-problem)
  (:domain meeting-schedule)

  (:objects
    you - agent
    joshua - person
    union-square chinatown - location
  )

  ; Start at the earliest time consistent with constraints (prioritise earliest feasible)
  ; Start location is Union Square (planner begins there).
  (:init
    (at union-square)
    (not (met joshua))
    (= (clock) 1080)             ; 18:00 in minutes since midnight — earliest availability start
    (= (total-meetings) 0)
  )

  ; Hard constraint: Joshua must be met for at least 75 minutes within 18:00-21:30.
  ; We make meeting with Joshua a goal so it is enforced; meeting action itself
  ; enforces the 75-minute duration and Chinatown/time-window constraints.
  (:goal (met joshua))

  ; Objective: maximize number of meetings performed (total-meetings).
  ; FastDownward uses the metric in the problem file.
  (:metric maximize (total-meetings))
)