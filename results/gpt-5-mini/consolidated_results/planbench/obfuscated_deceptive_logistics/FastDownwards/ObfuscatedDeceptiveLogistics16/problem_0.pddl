(define (problem scenario_reconciled)
  (:domain orchestrated-multiagent)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  ;; Initial facts reflect the reconciled S0 local view from planner_alpha plus the global object universe.
  ;; Bookkeeping shortcuts removed; order enforced by explicit at-stage facts and stage transitions in actions.
  (:init
    (hand object_3)
    (next object_5 object_7)
    (vase object_2)
    (cats object_4)
    (texture object_11)
    (collect object_0)
    (at-stage s0)
  )

  ;; Goal: enforce the terminal conditions implied by the integrated scenario and observed plan sequence.
  ;; Each required final fact is included as a hard constraint.
  (:goal (and
    (at-stage s6)
    (next object_5 object_10)
    (next object_9 object_1)
    (spring object_0)
    (stupendous object_11)
    (sneeze object_2)
    (collect object_3)
  ))
)