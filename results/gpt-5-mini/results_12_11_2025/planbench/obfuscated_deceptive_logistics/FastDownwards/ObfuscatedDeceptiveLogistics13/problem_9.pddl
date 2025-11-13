(define (problem ObfuscatedDeceptiveLogistics13-problem1)
  (:domain ObfuscatedDeceptiveLogistics13)
  (:objects
    object_0 - cat
    object_1 - cat
    object_2 - stupendous
    object_3 - stupendous
    object_4 - sneeze
    object_5 - sneeze
    object_6 - texture
    object_7 - texture
    object_8 - texture
    object_9 - texture
    object_10 object_11 object_12 - hand
  )

  (:init
    ;; collect relations (kept as explicit facts)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (initial)
    (next object_0 object_6)
    (next object_1 object_8)
    (next object_10 object_9)
    (next object_11 object_6)
    (next object_12 object_6)
    (next object_4 object_7)
    (next object_5 object_8)

    ;; spring properties (kept as predicates where objects also have other roles)
    (spring object_6)
    (spring object_8)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
  ))
)