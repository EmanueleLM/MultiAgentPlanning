(define (problem ObfuscatedDeceptiveLogistics15-problem)
  (:domain ObfuscatedDeceptiveLogistics15)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
  )
  (:init
    (hand object_0)
    (cats object_1)
    (texture object_2)
    (vase object_0 object_1)
    (next object_1 object_2)

    (sneeze object_3)
    (collect object_1 object_8)
    (collect object_2 object_8)
    (spring object_6)
    (spring object_7)
    (stupendous object_8)

    (hand object_9)
    (sneeze object_10)
    (texture object_11)
    (cats object_12)
  )
  (:goal (and
    (next object_0 object_2)
  ))
)