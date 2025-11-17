(define (problem scenario1_obfuscated_temporal)
  (:domain obfuscated-deceptive-logistics3-temporal)
  (:objects
    ;; objects used in scenario 1
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    ;; time steps (allow up to 5 actions -> 6 time points t0..t5)
    t0 t1 t2 t3 t4 t5 - time
  )
  (:init
    ;; successor chain (explicit discrete stages)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)

    ;; static facts (do not change)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)

    ;; time-indexed initial fluents at t0
    (next_at object_0 object_6 t0)
    (next_at object_3 object_5 t0)
    (next_at object_4 object_6 t0)
    (next_at object_7 object_6 t0)
    (next_at object_8 object_6 t0)
  )
  (:goal (and
    ;; require goal facts to hold at final stage t5
    (next_at object_7 object_5 t5)
    (next_at object_8 object_5 t5)
  ))
)