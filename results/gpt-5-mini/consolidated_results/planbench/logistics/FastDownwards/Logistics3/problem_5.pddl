(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    ; world objects referenced in the integrated initial state and plan
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj

    ; explicit stages: number of stages equals number of actions to be executed (5 actions -> 6 stages)
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ; explicit stage order and initial active stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (now s0)

    ; unary/static facts from the supplied initial statement
    (cats object_0)

    (hand object_7)
    (hand object_8)

    (texture object_5)
    (texture object_6)

    (spring object_5)
    (spring object_6)

    (sneeze object_3)
    (sneeze object_4)

    (stupendous object_1)
    (stupendous object_2)

    (collect object_5 object_1)
    (collect object_6 object_2)

    ; mutable binary relations present initially
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      ;; require terminal occupancy at the final stage to enforce completion
      (now s5)

      ;; goal relations specified by the instance
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)