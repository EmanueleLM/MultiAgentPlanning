(define (problem logistics9-unified-problem)
  (:domain logistics9)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; Stage succession and initial enabled stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (enabled-at s0)

    ;; Combined initial facts from both scenario statements
    ;; From first statement
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_5)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; From second statement
    (cats object_1)
    (collect object_6 object_2)
    ;; (collect object_7 object_2) already added
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_11)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)
    ;; sneeze object_4 already added; add object_5
    (sneeze object_5)
    (spring object_6)
    (spring object_8)
    (stupendous object_3)
    (texture object_9)
    ;; texture object_6,7,8 already added

    ;; Note: vase relations start absent and may be created by actions
  )
  (:goal (and
    (next object_10 object_6)
    (next object_9 object_6)
    (next object_10 object_7)
    (next object_11 object_8)
  ))
)