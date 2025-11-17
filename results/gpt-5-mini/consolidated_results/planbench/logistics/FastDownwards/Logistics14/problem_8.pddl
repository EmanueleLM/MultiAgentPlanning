(define (problem repoint-problem)
  (:domain repoint-domain)

  (:objects
    object_0 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - item
  )

  (:init
    ;; minimal, plan-relevant initial facts (redundant/unused facts removed)
    (cats object_0)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (next object_0 object_8)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)