(define (problem ObfuscatedDeceptiveLogistics2-prob1)
  (:domain ObfuscatedDeceptiveLogistics2)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - object
  )

  (:init
    ;; From the first statement (variant 1 initial conditions)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
  )

  ;; Goal DOES NOT explicitly state the plan; it only requires the target facts
  (:goal
    (and
      (next object_7 object_6)
      (next object_8 object_6)
    )
  )
)