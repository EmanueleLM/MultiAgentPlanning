(define (problem ObfuscatedDeceptiveLogistics23-instance)
  (:domain ObfuscatedDeceptiveLogistics23)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj

    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 - stage
  )

  (:init
    ;; stage ordering
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9)

    (current t0)

    ;; cats (union of statements)
    (cats object_0)
    (cats object_1)

    ;; collect relations (union of statements)
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
    (collect object_9 object_3)

    ;; hands (union)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; sneeze (union)
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring (union)
    (spring object_5)
    (spring object_8)
    (spring object_6)
    (spring object_9)

    ;; stupendous (union)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; texture (union)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_11)

    ;; next relations from both statements, all at initial stage t0
    (next_at object_0 object_8 t0)
    (next_at object_11 object_6 t0)
    (next_at object_12 object_10 t0)
    (next_at object_3 object_7 t0)
    (next_at object_4 object_10 t0)

    (next_at object_0 object_9 t0)
    (next_at object_1 object_9 t0)
    (next_at object_12 object_11 t0)
    (next_at object_13 object_7 t0)
    (next_at object_4 object_8 t0)
    (next_at object_5 object_11 t0)
  )

  (:goal
    (and
      (next_at object_11 object_7 t9)
      (next_at object_12 object_8 t9)
      (next_at object_12 object_10 t9)
      (next_at object_13 object_9 t9)
    )
  )
)