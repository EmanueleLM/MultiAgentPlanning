(define (problem obfuscated_deceptive_logistics_17_problem)
  (:domain obfuscated_deceptive_logistics_17)
  (:objects
    object_10 object_11 object_12 object_13 - hand
    object_0 object_1 - cats
    object_4 object_5 - sneeze
    object_6 object_8 - spring
    object_7 object_9 - texture
    object_2 object_3 - stupendous
  )

  (:init
    ;; Mapping textures to stupendous cities
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    
    ;; Initial positions of cats objects
    (next object_0 object_8)
    (next object_1 object_8)
    
    ;; Initial positions of hand (vehicle) objects
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
    
    ;; Initial positions of sneeze objects
    (next object_4 object_7)
    (next object_5 object_9)
  )

  (:goal
    (and
      (next object_10 object_6)
      (next object_11 object_8)
      (next object_12 object_7)
      (next object_13 object_9)
    )
  )
)