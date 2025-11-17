(define (problem obfuscated-instance-1)
  (:domain obfuscated-deceptive-logistics9)
  (:objects
    object_1 object_3 object_5 object_6 object_9 object_10 - object
  )

  (:init
    ;; Minimal facts required to support the provided plan
    (hand object_9)
    (hand object_10)
    (sneeze object_3)
    (texture object_5)
    (texture object_6)

    (next object_3 object_5)
    (next object_9 object_5)
    (next object_10 object_5)

    (collect object_5 object_1)
    (collect object_6 object_1)
    (stupendous object_1)
  )

  (:goal
    (and
      (next object_10 object_6)
      (next object_9 object_6)
    )
  )
)