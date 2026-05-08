(define (problem meeting_planning_example_3_problem)
  (:domain meeting_planning_example_3)
  (:objects
    bayview golden_gate_park - location
    t0900 t0922 t1052 - time_point
    barbara - person
  )
  (:init
    ;; Starting location and time
    (at bayview)
    (time_at t0900)

    ;; Travel distance from Bayview to Golden Gate Park (22 minutes)
    (travel_time bayview golden_gate_park t0900 t0922)

    ;; Meeting duration requirement (90 minutes)
    (meeting_duration_min_90 t0922 t1052)

    ;; Barbara's availability at Golden Gate Park (8:00 AM to 11:30 AM)
    ;; Discretized to the relevant time points of the plan
    (available_at barbara golden_gate_park t0922)
    (available_at barbara golden_gate_park t1052)
  )
  (:goal 
    (met barbara)
  )
)