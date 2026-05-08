(define (problem object_sequence)
  (:domain object_manipulation)
  (:objects
    object_0 - cat_holder
    object_1 - cat_holder
    object_2 - stupendous_object
    object_3 - stupendous_object
    object_4 - sneeze_holder
    object_5 - sneeze_holder
    object_6 - texture_holder
    object_7 - texture_holder
    object_8 - texture_holder
    object_9 - texture_holder
    object_10 - hand_holder
    object_11 - hand_holder
    object_12 - hand_holder
    object_13 - hand_holder
  )
  (:init
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_11 object_8)
    (next object_12 object_9)
    (next object_13 object_6)
    (next object_4 object_7)
    (next object_5 object_9)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_8)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)