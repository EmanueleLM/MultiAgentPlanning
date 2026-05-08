(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)

  (:objects
    golden_gate_park pacific_heights - location
    t0900 t1930 t1946 t2045 - time
  )

  (:init
    (at golden_gate_park)
    (time_at t0900)
    (john_available t1946)
  )

  (:goal (met_john))
)