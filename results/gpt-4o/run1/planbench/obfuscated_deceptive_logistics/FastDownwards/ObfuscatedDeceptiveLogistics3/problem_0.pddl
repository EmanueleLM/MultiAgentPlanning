(define (problem object_manipulation_instance)
    (:domain object_manipulation)
    (:objects
      object_0 - generic_object
      object_1 - generic_object
      object_2 - generic_object
      object_3 - generic_object
      object_4 - generic_object
      object_5 - generic_object
      object_6 - generic_object
      object_7 - generic_object
      object_8 - generic_object
      object_9 - generic_object
    )
    (:init
      (cats object_0)
      (cats object_1)
      (collect object_6 object_2)
      (collect object_7 object_3)
      (hand object_8)
      (hand object_9)
      (next object_0 object_6)
      (next object_1 object_6)
      (next object_4 object_6)
      (next object_5 object_7)
      (next object_8 object_7)
      (next object_9 object_7)
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
      (next object_8 object_7)
      (next object_9 object_6)
    ))
  )