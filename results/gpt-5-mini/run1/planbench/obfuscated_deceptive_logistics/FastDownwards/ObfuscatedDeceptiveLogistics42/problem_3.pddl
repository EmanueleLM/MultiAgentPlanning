(define (problem obfuscated_deceptive_logistics_instance)
  (:domain obfuscated_deceptive_logistics)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - entity
  )
  (:init
    ;; unary facts
    (cats object_0)
    (hand object_10)
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

    ;; collect relations (as given)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; next relations (as given)
    (next object_0 object_9)
    (next object_10 object_7)
    (next object_4 object_7)
    (next object_5 object_8)
    (next object_6 object_9)
  )
  (:goal (and
    (next object_10 object_8)
  ))
)