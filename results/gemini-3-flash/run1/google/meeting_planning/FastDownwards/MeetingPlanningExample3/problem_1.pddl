(define (problem meeting_planning_example_3)
  (:domain meeting_planning)

  (:objects
    me barbara - person
    bayview golden_gate_park - location
    t0900 t0922 t1052 t1115 t1130 - time
  )

  (:init
    ;; Starting state
    (at me bayview)
    (at barbara golden_gate_park)
    (time_at t0900)

    ;; Temporal/Spatial Transitions
    ;; Travel from Bayview to GGP (22 minutes): 9:00 -> 9:22
    (can_travel bayview golden_gate_park t0900 t0922)
    
    ;; Meeting Barbara at GGP (90 minutes): 9:22 -> 10:52
    ;; Note: 10:52 is before Barbara leaves at 11:30.
    (can_meet barbara golden_gate_park t0922 t1052)

    ;; Optional return travel: GGP to Bayview (23 minutes): 10:52 -> 11:15
    (can_travel golden_gate_park bayview t1052 t1115)
  )

  (:goal
    (and
      (met barbara)
    )
  )
)