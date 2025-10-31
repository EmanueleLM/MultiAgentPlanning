(define (problem orchestrated_problem)
  (:domain orchestrated_domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
  )

  (:init
    ;; cats
    (cats object_0)

    ;; hand
    (hand object_10)
    (hand object_11)
    (hand object_9)

    ;; sneeze
    (sneeze object_3)
    (sneeze object_4)

    ;; texture
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; spring
    (spring object_5)
    (spring object_7)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; Combined initial next facts (union of variant A and B)
    (next object_0 object_5)

    (next object_10 object_8)
    (next object_10 object_5)

    (next object_11 object_6)
    (next object_11 object_5)

    (next object_3 object_5)
    (next object_3 object_6)

    (next object_4 object_7)

    (next object_9 object_5)
    (next object_9 object_8)
  )

  ;; Goal: union of the requested next relations (variants A and B).
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
    (next object_10 object_8)
    (next object_9 object_6)
  ))
)