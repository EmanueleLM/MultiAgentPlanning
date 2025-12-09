(define (problem ObfuscatedDeceptiveLogistics26-prob)
  (:domain ObfuscatedDeceptiveLogistics26)

  (:objects
    object_0 - cat
    object_1 - cat
    object_2 - stupendous
    object_3 - stupendous
    object_4 - sneeze
    object_5 - sneeze
    object_6 - textured
    object_7 - textured
    object_8 - textured
    object_9 - textured
    object_10 - textured
    object_11 - textured
    object_12 - hand
    object_13 - hand
    object_14 - hand

    s0 s1 s2 s3 - stage
  )

  (:init
    ;; minimal stage chain sufficient for sequencing actions
    (succ s0 s1) (succ s1 s2) (succ s2 s3)
    (stage-available s0)

    ;; binary relations as given in the original specification
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; preserved multi-attribute facts that could not be encoded via types
    (spring object_6)
    (spring object_9)
  )

  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)