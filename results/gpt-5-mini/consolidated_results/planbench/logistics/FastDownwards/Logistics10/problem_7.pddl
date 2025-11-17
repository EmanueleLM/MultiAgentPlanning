(define (problem logistics10-problem1)
  (:domain logistics10)
  (:objects
    ;; objects typed to encode unary properties instead of listing them in :init
    object_0 object_1 - cat
    object_2 object_3 - stupendous
    object_4 object_5 - sneeze
    object_6 object_8 - spring
    object_7 object_9 - texture
    object_10 object_11 - hand

    s0 s1 s2 s3 s4 s5 s6 s7 - stage
  )

  (:init
    ;; collect relations (keep only those explicitly required)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; dynamic relations at initial stage s0 (only the necessary next_at facts)
    (next_at object_0 object_8 s0)
    (next_at object_1 object_6 s0)
    (next_at object_10 object_6 s0)
    (next_at object_11 object_9 s0)
    (next_at object_4 object_6 s0)
    (next_at object_5 object_8 s0)

    ;; explicit successor chain enforces contiguous stage progression
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
  )

  ;; Terminal conditions must hold exactly at final stage s7.
  (:goal (and
    (next_at object_10 object_7 s7)
    (next_at object_11 object_8 s7)

    (not (next_at object_10 object_7 s0))
    (not (next_at object_10 object_7 s1))
    (not (next_at object_10 object_7 s2))
    (not (next_at object_10 object_7 s3))
    (not (next_at object_10 object_7 s4))
    (not (next_at object_10 object_7 s5))
    (not (next_at object_10 object_7 s6))

    (not (next_at object_11 object_8 s0))
    (not (next_at object_11 object_8 s1))
    (not (next_at object_11 object_8 s2))
    (not (next_at object_11 object_8 s3))
    (not (next_at object_11 object_8 s4))
    (not (next_at object_11 object_8 s5))
    (not (next_at object_11 object_8 s6))
  ))