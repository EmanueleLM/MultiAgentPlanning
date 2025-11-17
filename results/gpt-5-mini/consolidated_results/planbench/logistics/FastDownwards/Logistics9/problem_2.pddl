(define (problem logistics9-unified-problem)
  (:domain logistics9)
  (:objects
    object_1 object_3 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    s0 s1 s2 s3 s4 s5 - step
  )
  (:init
    ;; minimal stage succession for sequencing (enough for the longest plan)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (enabled-at s0)

    ;; Trimmed, necessary initial facts (union of statement facts reduced to objects used
    ;; by the provided plans and goals; duplicates and unrelated facts removed)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_9)
    (hand object_10)
    (hand object_11)

    (next object_10 object_5)
    (next object_3 object_5)
    (next object_9 object_5)
    (next object_10 object_6)
    (next object_1 object_6)
    (next object_11 object_9)
    (next object_5 object_8)

    (sneeze object_3)
    (sneeze object_5)

    (spring object_5)
    (spring object_6)
    (spring object_7)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_3)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    (cats object_1)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)