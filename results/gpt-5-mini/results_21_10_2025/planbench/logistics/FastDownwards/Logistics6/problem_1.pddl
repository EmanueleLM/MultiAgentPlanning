(define (problem orchestrator-problem-goal-9-7)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
  )
  (:init
    ;; Scenario A initial facts (planner_a)
    ;; hand
    (hand object_9)

    ;; cats
    (cats object_0)

    ;; texture
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; next facts
    (next object_0 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_6)

    ;; sneeze
    (sneeze object_3)
    (sneeze object_4)

    ;; spring
    (spring object_5)
    (spring object_7)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; collect
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
  )

  (:goal (and
    (next object_9 object_7)
  ))
)