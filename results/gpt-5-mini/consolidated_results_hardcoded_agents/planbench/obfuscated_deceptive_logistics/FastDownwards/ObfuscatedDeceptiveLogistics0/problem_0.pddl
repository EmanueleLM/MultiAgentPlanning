(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; hand
    (hand object_8)

    ;; texture
    (texture object_6)
    (texture object_7)

    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)

    ;; spring
    (spring object_6)
    (spring object_7)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; collect pairs
    (collect object_6 object_2)
    (collect object_7 object_3)

    ;; next relations (initial)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
  )

  ;; Goal: explicitly require the final adjacency to be present
  (:goal (and
    (next object_8 object_6)
  ))
)