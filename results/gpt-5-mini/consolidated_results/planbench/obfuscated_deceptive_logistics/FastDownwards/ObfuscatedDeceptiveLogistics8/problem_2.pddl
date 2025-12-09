(define (problem obfuscated_deceptive_logistics_problem)
  (:domain obfuscated_deceptive_logistics)
  (:objects
    object_1 object_3 object_5 object_6 object_9 object_10 - obj
  )
  (:init
    (hand object_10)
    (hand object_9)
    (next object_10 object_5)
    (next object_9 object_5)
    (next object_3 object_5)
    (sneeze object_3)
    (texture object_5)
    (texture object_6)
    (stupendous object_1)
    (collect object_5 object_1)
    (collect object_6 object_1)
  )
  (:goal
    (and
      (next object_10 object_6)
      (next object_9 object_6)
    )
  )
)