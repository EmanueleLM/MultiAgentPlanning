(define (problem obfuscated_deceptive_logistics_47_problem)
  (:domain obfuscated_deceptive_logistics_47)
  (:objects
    object_0 - cat_obj
    object_10 object_11 - hand_obj
    object_4 object_5 object_6 - sneeze_obj
    object_7 object_8 object_9 - st_obj
    object_1 object_2 object_3 - stupendous_obj
  )
  (:init
    (cats object_0)
    (hand object_10)
    (hand object_11)
    (sneeze object_4)
    (sneeze object_5)
    (sneeze object_6)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (spring object_7)
    (spring object_8)
    (spring object_9)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (next object_0 object_8)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_4 object_7)
    (next object_5 object_8)
    (next object_6 object_9)
  )
  (:goal
    (and
      (next object_10 object_9)
      (next object_11 object_7)
    )
  )
)