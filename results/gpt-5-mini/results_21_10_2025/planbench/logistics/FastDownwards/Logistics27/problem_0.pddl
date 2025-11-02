(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect edges
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; hand
    (hand object_12)
    (hand object_13)
    (hand object_14)

    ;; next edges (observer variant chosen)
    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; sneeze
    (sneeze object_4)
    (sneeze object_5)

    ;; spring
    (spring object_6)
    (spring object_9)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; texture
    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  ;; Goal: produce a vase for hand object_13 with cat object_0
  ;; This is reachable immediately by sip(object_13,object_0,object_6) under the chosen initial facts.
  (:goal (vase object_13 object_0))
)