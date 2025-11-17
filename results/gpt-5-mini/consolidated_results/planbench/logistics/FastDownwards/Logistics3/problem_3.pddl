(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ; stage order and initial stage marker
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)

    (now s0)

    ; static/unary facts (from the first initial statement integrated)
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

    ; initial 'next' relations (global, persistence enforced by actions that do not remove them)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)

    ; no vase facts initially
  )

  (:goal
    (and
      (now s5)
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)