(define (problem logistics28-problem)
  (:domain logistics28)
  (:objects
    object_0 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )
  (:init
    ;; reduced, task-relevant initial facts (only those required by the plan/goals)
    (cats object_0)

    (hand object_12) (hand object_13) (hand object_14)

    (texture object_5) (texture object_6) (texture object_7) (texture object_8) (texture object_9) (texture object_10) (texture object_11)

    (sneeze object_4) (sneeze object_5)

    (spring object_6) (spring object_9)

    (stupendous object_2) (stupendous object_3)

    ;; collect relations used by wretched steps in the plan
    (collect object_7 object_2) (collect object_8 object_2) (collect object_6 object_2)
    (collect object_10 object_3) (collect object_11 object_3) (collect object_9 object_3)

    ;; only the next links required as starting points for the planned sequence
    (next object_4 object_7) (next object_14 object_8) (next object_0 object_6)
    (next object_13 object_6) (next object_5 object_10) (next object_12 object_11)
  )
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_5)
    (next object_14 object_7)
  ))
)