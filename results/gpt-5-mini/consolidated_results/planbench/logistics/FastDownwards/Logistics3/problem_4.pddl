(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    ; only objects actually used by the integrated plan/goals are declared
    object_0 object_5 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ; stage order and initial stage marker (needed for 5 actions)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (now s0)

    ; minimal static/unary facts required by the plan:
    (cats object_0)

    (hand object_7)
    (hand object_8)

    (texture object_5)
    (texture object_6)

    (spring object_5)
    (spring object_6)

    ; only the next relations actually required initially for the provided plan
    (next object_0 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      (now s5)
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)