(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - thing
  )

  (:init
    (cats object_0)
    (cats object_1)
    (cats object_2)

    (collect object_10 object_4)
    (collect object_11 object_5)
    (collect object_9 object_3)

    (hand object_12)

    (sneeze object_6)
    (sneeze object_7)
    (sneeze object_8)

    (spring object_10)
    (spring object_11)
    (spring object_9)

    (stupendous object_3)
    (stupendous object_4)
    (stupendous object_5)

    (texture object_10)
    (texture object_11)
    (texture object_9)

    (next object_0 object_11)
    (next object_1 object_10)
    (next object_12 object_10)
    (next object_2 object_9)
    (next object_6 object_9)
    (next object_7 object_10)
    (next object_8 object_11)
  )

  (:goal
    (and
      (next object_12 object_11)
    )
  )
)