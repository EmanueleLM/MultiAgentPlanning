(define (problem ObfuscatedDeceptiveLogistics19-problem)
  (:domain ObfuscatedDeceptiveLogistics19)
  (:objects
    object_2 object_4 object_8 object_9 object_10 object_11 - obj
  )
  (:init
    (hand object_11)
    (next object_11 object_8)
    (next object_4 object_10)
    (sneeze object_4)
    (stupendous object_2)
    (texture object_10)
    (texture object_8)
    (texture object_9)
    (collect object_10 object_2)
    (collect object_8 object_2)
    (collect object_9 object_2)
  )
  (:goal (and
    (next object_11 object_9)
  ))
)