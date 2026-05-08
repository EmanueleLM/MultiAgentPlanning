(define (problem obfuscated_deceptive_logistics_15_problem)
  (:domain obfuscated_deceptive_logistics_15)
  (:objects
    object_0 - cats
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_7 - spring
    object_6 object_8 - texture
    object_9 object_10 object_11 object_12 - hand
  )

  (:init
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (next object_0 object_5)
    (next object_10 object_7)
    (next object_11 object_8)
    (next object_12 object_5)
    (next object_3 object_6)
    (next object_4 object_8)
    (next object_9 object_8)
  )

  (:goal
    (and
      (next object_10 object_8)
      (next object_11 object_6)
      (next object_12 object_8)
      (next object_9 object_5)
    )
  )
)