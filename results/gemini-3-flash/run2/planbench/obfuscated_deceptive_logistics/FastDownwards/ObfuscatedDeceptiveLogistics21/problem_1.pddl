(define (problem logistics_instance_21)
  (:domain obfuscated_deceptive_logistics_21)
  (:objects
    object_0 - cat
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_8 - spring
    object_6 object_7 object_9 object_10 - texture
    object_11 object_12 - hand
  )

  (:init
    (cats object_0)
    (stupendous object_1)
    (stupendous object_2)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    (hand object_11)
    (hand object_12)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_2)
    (next object_0 object_5)
    (next object_11 object_9)
    (next object_12 object_10)
    (next object_3 object_6)
    (next object_4 object_8)
  )

  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_5)
    )
  )
)