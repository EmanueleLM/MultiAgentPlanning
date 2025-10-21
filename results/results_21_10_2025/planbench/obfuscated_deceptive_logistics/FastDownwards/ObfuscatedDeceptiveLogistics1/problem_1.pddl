(define (problem ObfuscatedDeceptiveLogistics1-problem)
  (:domain ObfuscatedDeceptiveLogistics1)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; Union of initial facts from both scenarios

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect facts
    (collect object_6 object_2)
    (collect object_7 object_3)
    (collect object_5 object_1)

    ;; hands
    (hand object_8)
    (hand object_7)

    ;; next relations (union)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)

    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)

    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)
    (sneeze object_3)

    ;; spring
    (spring object_6)
    (spring object_7)
    (spring object_5)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)
    (stupendous object_1)

    ;; texture
    (texture object_6)
    (texture object_7)
    (texture object_5)
  )

  ;; Goal: achieve next object_7 object_6 and next object_8 object_6
  (:goal (and
    (next object_7 object_6)
    (next object_8 object_6)
  ))
)