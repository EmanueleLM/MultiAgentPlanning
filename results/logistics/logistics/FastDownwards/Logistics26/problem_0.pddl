(define (problem multiagent-unified-problem)
  (:domain multiagent-unified)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 object_14
  )
  (:init
    ;; From scenario 1
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (hand object_11)
    (hand object_12)
    (hand object_13)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)
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

    ;; From scenario 2 (union; duplicates omitted where identical)
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_12)  ;; duplicate of scenario 1 hand object_12; kept once
    (hand object_13)  ;; duplicate
    (hand object_14)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_3)
    (texture object_11)
    ;; note: texture object_6,7,8,9,10 already present above in scenario 1 union
  )

  (:goal (and
    ;; Goals from scenario 1
    (next object_11 object_5)
    (next object_12 object_9)
    (next object_13 object_10)
    ;; Goals from scenario 2
    (next object_12 object_6)
    (next object_13 object_10)  ;; duplicate goal clause; harmless duplicate
    (next object_14 object_11)
  ))
)