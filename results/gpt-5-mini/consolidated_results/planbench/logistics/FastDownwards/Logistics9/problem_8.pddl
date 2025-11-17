(define (problem logistics9-combined)
  (:domain logistics9)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - step
  )
  (:init
    ;; contiguous stage succession for execution (enforces temporal ordering)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (enabled-at s0)

    ;; Union of initial facts from both scenario statements (duplicates removed)

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_6 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hand facts
    (hand object_10)
    (hand object_9)
    (hand object_11)

    ;; next relations (initial)
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

    ;; sneeze facts
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring facts
    (spring object_5)
    (spring object_7)
    (spring object_6)
    (spring object_8)

    ;; stupendous facts
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; texture facts (union)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )
  (:goal (and
    ;; goals from both players must hold simultaneously
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)