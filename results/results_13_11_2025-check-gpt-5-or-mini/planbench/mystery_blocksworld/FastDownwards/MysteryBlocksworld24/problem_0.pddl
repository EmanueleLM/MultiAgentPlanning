(define (problem scenario_1)
  (:domain audited_compilation)
  (:objects
    object_0 object_1 - item
    step_0 step_1 step_2 step_3 step_4 step_5 step_6 - step
  )
  (:init
    (cats object_0)
    (spring step_0)
    (next step_0 step_1)
    (next step_1 step_2)
    (next step_2 step_3)
    (next step_3 step_4)
    (next step_4 step_5)
    (next step_5 step_6)
  )
  (:goal
    (and
      (hand object_0)
      (texture object_0)
      (sneeze object_0)
      (stupendous object_0)
      (vase object_0)
      (collect object_0)
      (spring step_6)
    )
  )
)