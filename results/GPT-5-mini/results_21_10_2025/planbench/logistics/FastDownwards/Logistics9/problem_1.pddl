(define (problem logistics9-problem)
  (:domain logistics9-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; hand
    (hand object_9)
    (hand object_10)
    (hand object_11)

    ;; sneeze
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; texture
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; spring
    (spring object_5)
    (spring object_7)
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations (union of provided statements)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_6 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; next relations (union of provided initial facts)
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_5)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)
  )

  ;; Global goal: include both workers' desired next facts. A planner will
  ;; attempt to satisfy all four; if some are impossible given the initial
  ;; facts and action schemas, the planner will report unsolvable.
  (:goal (and
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)