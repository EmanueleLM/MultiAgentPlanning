(define (problem objects-manipulation-problem)
  (:domain objects-manipulation)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
    step_0 step_1 step_2 step_3 step_4 step_5 - time
  )

  (:init
    ; time initialization: actions must advance step by step
    (time-now step_0)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)
    (succ step_3 step_4)
    (succ step_4 step_5)

    ; initial domain facts (first scenario from specification)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_9)
    (next object_0 object_7)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )

  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)