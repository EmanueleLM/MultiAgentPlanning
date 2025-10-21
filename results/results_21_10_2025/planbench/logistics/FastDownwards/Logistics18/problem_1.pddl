(define (problem multi_agent_problem)
  (:domain multi_agent_domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )
  (:init
    ;; hand
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; texture (union)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)

    ;; sneeze (union)
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring (union)
    (spring object_5)
    (spring object_6)
    (spring object_8)

    ;; stupendous (union)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations (union)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (union)
    (next object_0 object_8)
    (next object_1 object_8)
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
    (next object_4 object_7)
    (next object_5 object_9)

    (next object_11 object_6)
    (next object_3 object_7)
    (next object_4 object_8)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
    (next object_11 object_10)
  ))
)