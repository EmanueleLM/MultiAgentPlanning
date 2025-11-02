(define (problem scenario-b)
  (:domain integrated-model)
  (:requirements :strips :typing)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6
    object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )
  (:init
    (hand object_0)
    (hand object_1)

    (cats object_2)
    (cats object_3)

    (texture object_4)
    (texture object_5)
    (texture object_6)

    (sneeze object_7)
    (sneeze object_8)

    (stupendous object_9)

    (spring object_10)
    (spring object_11)
    (spring object_12)

    (collect object_4 object_9)
    (collect object_5 object_9)
    (collect object_6 object_9)

    (next object_0 object_4)
    (next object_1 object_5)

    (next object_2 object_5)
    (next object_2 object_6)

    (next object_3 object_10)

    (next object_7 object_4)
    (next object_8 object_4)
  )
  (:goal
    (and
      (vase object_0 object_8)
      (next object_1 object_6)
      (next object_7 object_5)
      (next object_3 object_11)
    )
  )
)