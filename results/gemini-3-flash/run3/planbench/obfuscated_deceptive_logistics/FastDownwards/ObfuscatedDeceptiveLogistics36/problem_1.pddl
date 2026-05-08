(define (problem obfuscated_deceptive_logistics_36_prob)
  (:domain obfuscated_deceptive_logistics_36)
  (:objects
    object_0 - cats
    object_1 object_2 - stupendous
    object_3 object_4 - sneeze
    object_5 object_6 object_7 object_8 object_9 object_10 - texture
    object_11 object_12 object_13 object_14 object_15 object_16 - hand
  )

  (:init
    (spring object_5)
    (spring object_8)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (next object_0 object_8)
    (next object_11 object_9)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_14 object_7)
    (next object_15 object_10)
    (next object_16 object_9)
    (next object_3 object_7)
    (next object_4 object_8)
  )

  (:goal
    (and
      (next object_11 object_5)
      (next object_12 object_8)
      (next object_13 object_8)
      (next object_14 object_7)
      (next object_15 object_10)
      (next object_16 object_8)
    )
  )
)