(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)

  (:init
    ;; start location and time
    (at golden_gate_park)
    (time_at t0900)

    ;; John's availability expressed at the discrete timepoints used by this instance:
    ;; John is available during 19:45-20:45; t2000 (20:00) and t2045 (20:45) lie within that window.
    (john_available t2000)
    (john_available t2045)
  )

  ;; Hard goal: meet John at least once for the required duration encoded by the temporal points above.
  (:goal (met_john))
)