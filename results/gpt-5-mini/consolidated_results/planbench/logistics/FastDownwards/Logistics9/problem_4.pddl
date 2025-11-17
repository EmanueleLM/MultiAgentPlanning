(define (problem logistics9-unified-problem)
  (:domain logistics9)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    s0 s1 s2 s3 s4 s5 - step
  )
  (:init
    ;; discrete stage succession enforcing contiguous single-step execution
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (enabled-at s0)

    ;; Union of initial facts from both scenario statements (duplicates removed)
    (cats object_0)
    (cats object_1)

    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (collect object_6 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_9)
    (hand object_11)

    (next object_0 object_5)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_5)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)

    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    (spring object_5)
    (spring object_7)
    (spring object_6)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )
  (:goal (and
    ;; Goals requested by the two agents (both required by this unified problem)
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)