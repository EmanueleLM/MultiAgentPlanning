(define (problem obfuscated_deceptive_logistics20_problem)
  (:domain ObfuscatedDeceptiveLogistics20)
  (:objects
    object_3 object_10 object_11 object_12 - object
  )
  (:init
    ;; facts trimmed to the minimal set that supports achieving (next object_12 object_11)
    (sneeze object_12)
    (texture object_10)
    (texture object_11)
    (stupendous object_3)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (next object_12 object_10)
  )
  (:goal (and
    (next object_12 object_11)
  ))
)