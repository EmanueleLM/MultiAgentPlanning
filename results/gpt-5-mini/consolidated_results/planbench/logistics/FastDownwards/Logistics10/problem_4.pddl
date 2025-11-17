(define (problem logistics10-problem1)
  (:domain logistics10)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    s0 s1 s2 s3 s4 s5 s6 s7 - stage
  )

  (:init
    ;; static/object properties from the first scenario
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; dynamic relations placed at initial stage s0 (explicit time indexing)
    (next_at object_0 object_8 s0)
    (next_at object_1 object_6 s0)
    (next_at object_10 object_6 s0)
    (next_at object_11 object_9 s0)
    (next_at object_4 object_6 s0)
    (next_at object_5 object_8 s0)

    ;; explicit successor chain to enforce contiguous stage progression
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
  )

  ;; Terminal conditions must hold exactly at final stage s7
  (:goal (and
    (next_at object_10 object_7 s7)
    (next_at object_11 object_8 s7)
  ))
)