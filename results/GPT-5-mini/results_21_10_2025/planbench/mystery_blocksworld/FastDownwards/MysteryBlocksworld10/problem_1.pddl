(define (problem MysteryBlocksworld10-problem)
  (:domain MysteryBlocksworld10)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )
  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; hand
    (hand object_10)
    (hand object_11)
    (hand object_9)

    ;; texture (union of both agents' textures)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; sneeze (union)
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring (union)
    (spring object_5)
    (spring object_6)
    (spring object_7)
    (spring object_8)

    ;; stupendous (union)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations (union of agent statements)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_8 object_2)

    ;; next relations (union)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)

    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_8)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)