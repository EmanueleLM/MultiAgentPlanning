(define (problem obfuscated-deceptive-logistics-17-prob)
  (:domain obfuscated-deceptive-logistics-17)
  (:objects
    object_0 object_1 - cat
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 object_8 - spring
    object_7 object_9 - texture
    object_10 object_11 object_12 object_13 - hand
  )
  (:init
    ;; minimal relation facts required to enable the available operators
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (next object_0 object_8)
    (next object_1 object_8)

    (next object_4 object_7)
    (next object_5 object_9)

    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)