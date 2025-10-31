(define (problem multi_move_problem)
  (:domain multi_move)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11
    object_12 object_13 object_14 - object
  )

  (:init
    ;; Unary predicates (union of analysts' facts)
    (cats object_0)
    (cats object_1)

    (hand object_11)
    (hand object_12)
    (hand object_13)
    (hand object_14)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    (texture object_11)

    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    (spring object_5)
    (spring object_6)
    (spring object_8)
    (spring object_9)

    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; Binary collect relations (union from both analysts)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; next relations (union from both analysts' scenarios)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)

    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)
    (next object_6 object_2)
    (next object_7 object_2)
    (next object_8 object_2)
    (next object_9 object_3)
  )

  ;; Combined goal: include the next relations required by both analysts' scenarios.
  ;; Note: next object_13 object_10 appears in both; included once.
  (:goal (and
    (next object_11 object_5)   ;; analyst_A goal
    (next object_12 object_9)   ;; analyst_A goal
    (next object_13 object_10)  ;; analyst_A & analyst_B overlap
    (next object_12 object_6)   ;; analyst_B goal
    (next object_14 object_11)  ;; analyst_B goal
  ))
)