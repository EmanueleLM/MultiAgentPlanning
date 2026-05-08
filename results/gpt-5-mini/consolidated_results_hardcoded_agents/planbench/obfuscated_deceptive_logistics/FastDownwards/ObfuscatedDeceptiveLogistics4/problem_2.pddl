(define (problem obfuscated-deceptive-logistics4-problem)
  (:domain obfuscated-deceptive-logistics)
  (:objects
    object_2 object_4 object_7 object_8 object_9 - object
  )

  (:init
    ;; minimal facts needed to reach the goal next object_9 object_8
    (hand object_9)
    (sneeze object_4)

    (texture object_7)
    (texture object_8)

    (next object_4 object_7)
    (next object_9 object_7)

    (collect object_7 object_2)
    (collect object_8 object_2)

    (stupendous object_2)
  )

  (:goal
    (next object_9 object_8)
  )
)