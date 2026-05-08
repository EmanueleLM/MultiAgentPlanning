(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    object_0 - obj
    object_1 - obj
    object_2 - obj
    object_3 - obj
    object_4 - obj
    object_5 - obj
    object_6 - obj
    object_7 - obj
    object_8 - obj
    object_9 - obj
    object_10 - obj
  )

  (:init
    (cats object_0)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_10)
    (next object_0 object_9)
    (next object_10 object_7)
    (next object_4 object_7)
    (next object_5 object_8)
    (next object_6 object_9)
    (sneeze object_4)
    (sneeze object_5)
    (sneeze object_6)
    (spring object_7)
    (spring object_8)
    (spring object_9)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal
    (and
      (next object_10 object_8)
    )
  )
)