(define (problem objects-manipulation-problem)
  (:domain objects-manipulation)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
    step_0 step_1 step_2 step_3 - time
  )

  (:init
    ;; discrete time progression for exactly three actions
    (time-now step_0)
    (succ step_0 step_1)
    (succ step_1 step_2)
    (succ step_2 step_3)

    ;; static initial facts for this scenario (consistent with the plan)
    (hand object_9)
    (hand object_10)
    (sneeze object_4)

    (texture object_7)
    (texture object_8)

    (next object_4 object_8)
    (next object_9 object_8)
    (next object_10 object_5)

    ;; occupancy flags reflecting initial next facts
    (occupied-next object_4)
    (occupied-next object_9)
    (occupied-next object_10)

    (collect object_7 object_2)
    (collect object_8 object_2)
    (stupendous object_2)
  )

  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)