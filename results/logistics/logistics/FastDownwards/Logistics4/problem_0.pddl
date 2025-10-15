(define (problem multiagent-problem)
  (:domain multiagent)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
  )
  (:init
    ;; From agent1 initial facts
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (hand object_8)
    (hand object_9)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_7)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)
    ;; From agent2 initial facts (merged)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    ;; hand object_9 already present
    (next object_0 object_7)
    (next object_3 object_5)
    (next object_4 object_7)
    ;; next object_9 object_7 already present
    (sneeze object_3)
    ;; sneeze object_4 already present
    (spring object_5)
    ;; spring object_7 already present
    (stupendous object_1)
    ;; stupendous object_2 already present
    (texture object_5)
    ;; texture object_6, object_7 already present
    (texture object_8)
  )
  (:goal (and
    ;; Agent1 goal: next object_8 object_7 and next object_9 object_6
    (next object_8 object_7)
    (next object_9 object_6)
    ;; Agent2 goal: next object_9 object_8
    (next object_9 object_8)
  ))
)