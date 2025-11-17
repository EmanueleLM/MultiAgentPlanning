(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    ; only objects required by the integrated plan/goal are declared
    object_0 object_5 object_6 object_7 object_8 - obj

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

    ; minimal unary/static facts required by the plan
    (cats object_0)

    (hand object_7)
    (hand object_8)

    (texture object_5)
    (texture object_6)

    (spring object_5)
    (spring object_6)

    ; only the next relations present initially that are used by the plan
    (next object_0 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      ;; require terminal stage to ensure all actions were applied
      (now s5)

      ;; target relations specified by the instance
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)