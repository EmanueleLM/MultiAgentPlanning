(define (problem obfuscated_deceptive_logistics_40_problem)
  (:domain obfuscated_deceptive_logistics_40)
  (:objects
    object_0 object_1 - cats
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 object_9 - spring
    object_7 object_8 object_10 object_11 - texture
    object_12 object_13 object_14 object_15 object_16 object_17 - hand
  )
  (:init
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_6)
    (next object_13 object_8)
    (next object_14 object_9)
    (next object_15 object_6)
    (next object_16 object_11)
    (next object_17 object_10)
    (next object_4 object_8)
    (next object_5 object_11)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (collect object_10 object_3)
    (collect object_11 object_3)
  )
  (:goal
    (and
      (next object_12 object_8)
      (next object_13 object_9)
      (next object_14 object_11)
      (next object_15 object_10)
      (next object_16 object_9)
      (next object_17 object_11)
    )
  )
)