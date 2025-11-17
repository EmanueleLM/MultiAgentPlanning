(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    ;; objects taken from the human specification (explicit names kept)
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj

    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ;; stage ordering and initial stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)

    (now s0)

    ;; unary/static facts from the human specification (first statement)
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

    ;; time-indexed 'next' relations present at initial stage s0
    (next object_0 object_6 s0)
    (next object_3 object_5 s0)
    (next object_4 object_6 s0)
    (next object_7 object_6 s0)
    (next object_8 object_6 s0)

    ;; No vase facts are true initially (vase is absent at s0).
  )

  (:goal
    (and
      ;; require the desired next relations to hold at final stage s5
      (next object_7 object_5 s5)
      (next object_8 object_5 s5)
    )
  )
)