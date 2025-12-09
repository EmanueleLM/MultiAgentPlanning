(define (problem ObfuscatedDeceptiveLogistics7-problem)
  (:domain ObfuscatedDeceptiveLogistics7)
  (:objects
    object_2 object_4 object_5 object_7 object_8 object_9 object_10 - obj
  )
  (:init
    ;; Facts trimmed to the minimum required to make the goal reachable:
    (hand object_9)
    (sneeze object_4)
    (texture object_8)
    (texture object_7)
    (next object_9 object_8)
    (next object_4 object_8)
    (collect object_8 object_2)
    (collect object_7 object_2)
    (stupendous object_2)
    ;; The goal atom already true initially and should be preserved:
    (next object_10 object_5)
  )
  (:goal (and
    (next object_10 object_5)
    (next object_9 object_7)
  ))
)