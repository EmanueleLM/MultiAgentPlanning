(define (problem multi-agent-problem)
  (:domain multi-agent-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
  )

  (:init
    ;; hand facts
    (hand object_8)
    (hand object_9)

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; texture facts (union from analyses)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; sneeze facts (union)
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring facts (union)
    (spring object_5)
    (spring object_6)
    (spring object_7)

    ;; stupendous facts (union)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; collect relations (union of reported collects)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next relations (union of reported next facts)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)
    (next object_0 object_7)
    (next object_3 object_5)
    (next object_4 object_7)
  )

  (:goal (and
    ;; Goals derived from agent analyses:
    ;; - next object_8 object_7 is already true and must remain true (hard constraint)
    ;; - next object_9 object_6 should be achieved
    (next object_8 object_7)
    (next object_9 object_6)
  ))