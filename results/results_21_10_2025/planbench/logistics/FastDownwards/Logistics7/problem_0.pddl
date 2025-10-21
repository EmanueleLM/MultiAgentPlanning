(define (problem agent_a_scenario)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10
  )
  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect facts
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hand
    (hand object_10)

    ;; next relations
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)

    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)

    ;; spring
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; texture
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )
  (:goal (and
    (next object_10 object_6)
  ))
)