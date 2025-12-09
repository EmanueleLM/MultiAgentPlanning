(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    step_0 step_1 step_2 step_3 step_4 - step
  )

  (:init
    ;; explicit succ chain for discrete time progression (acyclic)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)
    (succ step_3 step_4)
    (now step_0)

    ;; initial facts as provided (unchanged from the human specification)
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_3)

    (hand object_8)

    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_7)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
  )

  (:goal (and
    (next object_8 object_6)
  ))
)