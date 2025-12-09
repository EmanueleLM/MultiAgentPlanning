(define (problem obfuscated-deceptive-logistics-prob)
  (:domain obfuscated-deceptive-logistics)

  ;; declare all objects and their precise types (no placeholders)
  (:objects
    object_11 object_12 object_13 - hand
    object_0 - cat
    object_3 object_4 - sneeze
    object_1 object_2 - stupendous
    object_5 object_6 object_7 object_8 object_9 object_10 - object
  )

  (:init
    ;; texture facts
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; spring facts
    (spring object_5)
    (spring object_8)

    ;; collect relations (as given in the original initial state)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (explicit adjacency/order facts from the initial state)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)
  )

  ;; goal: exact target adjacency relations (must all hold)
  (:goal (and
           (next object_11 object_8)
           (next object_12 object_8)
           (next object_13 object_10)
         )
  )
)