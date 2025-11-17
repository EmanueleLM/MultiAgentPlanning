(define (problem ObfuscatedDeceptiveLogistics6-problem1)
  (:domain ObfuscatedDeceptiveLogistics6)

  (:objects
    object_0 object_1 object_3 object_5 object_6 object_7 object_9 - object
  )

  (:init
    ;; Minimal initial facts required by the provided plan (redundant/unused facts removed)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (hand object_9)
    (next object_0 object_5)
    (next object_3 object_5)
    (next object_9 object_6)
    (sneeze object_3)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (texture object_5)
    (texture object_6)
    (texture object_7)
  )

  (:goal (and
    (next object_9 object_7)
  ))
)