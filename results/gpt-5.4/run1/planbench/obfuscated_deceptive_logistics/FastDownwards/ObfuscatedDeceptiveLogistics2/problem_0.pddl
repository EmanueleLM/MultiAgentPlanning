(define (problem jackofalltrades_instance_problem)
  (:domain jackofalltrades_instance)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - thing
  )

  (:init
    (cats object_0)
    (stupendous object_1)
    (stupendous object_2)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (texture object_5)
    (texture object_6)
    (hand object_7)
    (hand object_8)

    (collect object_5 object_1)
    (collect object_6 object_2)

    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)