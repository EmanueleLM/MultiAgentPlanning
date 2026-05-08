(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)

  (:init
    ;; start location and time
    (at golden_gate_park)
    (time_at t0900)

    ;; John's availability: he is available beginning at 19:45 and until 20:45.
    ;; Represented by availability at the relevant discrete time points used by the model.
    (john_available t1946)
    (john_available t2045)
  )

  ;; Hard goal: meet John at least once
  (:goal (met_john))
)