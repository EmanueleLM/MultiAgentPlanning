(define (problem orchestrator-problem)
  (:domain orchestrator)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; from planner_a parsed facts (first scenario)
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_2)
    (hand object_11)
    (hand object_12)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; from planner_b parsed facts (second scenario) - merged in
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_13)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_3)
    (texture object_11)
    ;; texture/object facts already included where duplicates occurred; duplicates are harmless
  )

  ;; Goals: both scenario goals are required (conjoined)
  (:goal
    (and
      ;; first scenario goals
      (next object_11 object_7)
      (next object_12 object_8)
      ;; second scenario goals
      (next object_12 object_10)
      (next object_13 object_9)
    )
  )
)