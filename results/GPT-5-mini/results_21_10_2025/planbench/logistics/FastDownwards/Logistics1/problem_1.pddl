(define (problem orchestrated-problem)
  (:domain logistics1-orchestrated)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - object
  )

  (:init
    ;; From first statement initial facts
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (hand object_8)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_7)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)

    ;; From second statement initial facts (union)
    (collect object_5 object_1)
    (collect object_6 object_2) ; already present from first, repeated here for clarity
    (hand object_7)
    ;; hand object_8 already present
    (next object_0 object_6)
    (next object_3 object_5)
    ;; next object_4 object_6 already present
    (next object_7 object_6)
    (next object_8 object_5)
    (sneeze object_3)
    ;; sneeze object_4 already present
    (spring object_5)
    ;; spring object_6 already present
    (stupendous object_1)
    ;; stupendous object_2 and object_3 already present
    (texture object_5)
    ;; texture object_6 and object_7 already present
  )

  ;; Combined goals (both statements' goals)
  (:goal (and
           (next object_7 object_6)
           (next object_8 object_6)
         )
  )
)