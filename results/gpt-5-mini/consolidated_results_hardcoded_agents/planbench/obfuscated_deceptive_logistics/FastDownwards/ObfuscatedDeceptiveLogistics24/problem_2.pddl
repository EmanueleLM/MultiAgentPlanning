(define (problem obfuscated-deceptive-logistics-prob)
  (:domain obfuscated-deceptive-logistics)

  (:objects
    ;; typed role objects (encoded as object types to remove many unary init facts)
    object_11 object_12 object_13 - hand
    object_0 - cat
    object_3 object_4 - sneeze
    object_1 object_2 - stupendous

    ;; remaining objects (some serve as texture/spring/collect/next targets)
    object_5 object_6 object_7 object_8 object_9 object_10 - obj
  )

  (:init
    ;; texture and spring facts remain as predicates because some objects have both roles
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    (spring object_5)
    (spring object_8)

    ;; collect relations (kept minimal, only the pairs given originally)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (explicit adjacency/order facts)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)
  )

  (:goal (and
           (next object_11 object_8)
           (next object_12 object_8)
           (next object_13 object_10)
         )
  )
)