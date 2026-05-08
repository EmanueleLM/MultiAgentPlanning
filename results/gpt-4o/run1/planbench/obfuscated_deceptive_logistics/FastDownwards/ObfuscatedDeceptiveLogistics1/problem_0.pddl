(define (problem manipulate_objects)
  (:domain object_manipulation)
  (:objects
    object_0 object_1 object_2 object_3 object_4 
    object_5 object_6 object_7 object_8 - object
  )
  (:init
    (is_cats object_0)
    (is_collect object_5 object_1)
    (is_collect object_6 object_2)
    (hold_hand object_7)
    (hold_hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)
    (is_sneeze object_3)
    (is_sneeze object_4)
    (is_spring object_5)
    (is_spring object_6)
    (is_stupendous object_1)
    (is_stupendous object_2)
    (is_texture object_5)
    (is_texture object_6)
  )
  (:goal
    (and 
      (next object_7 object_6)
      (next object_8 object_6)
    )
  )
)