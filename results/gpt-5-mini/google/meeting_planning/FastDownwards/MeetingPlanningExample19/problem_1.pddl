(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)

  (:objects
    golden_gate_park pacific_heights - location
    t0900 t1930 t1946 t2045 - time
  )

  (:init
    ;; Start location and time
    (at golden_gate_park)
    (time_at t0900)

    ;; John's availability: he is present at Pacific Heights starting
    ;; at/after t1946 up through t2045 (modeled by allowing meeting to start at t1946
    ;; and end at t2045). This captures the window 19:45-20:45 with a feasible 45+ minute meeting.
    (john_available t1946)
  )

  ;; Goal: meet John for the required minimum duration within his availability window.
  (:goal (met_john))
)