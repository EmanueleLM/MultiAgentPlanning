(define (problem MysteryBlocksworld0-problem)
  (:domain MysteryBlocksworld0)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - object
  )
  (:init
    ;; cats
    (cats object_0)
    (cats object_1)
    ;; collect
    (collect object_6 object_2)
    (collect object_7 object_3)
    ;; hand
    (hand object_8)
    ;; next facts (second initial statement variant)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)
    ;; spring
    (spring object_6)
    (spring object_7)
    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)
    ;; texture
    (texture object_6)
    (texture object_7)
  )
  (:goal (next object_8 object_6))
)