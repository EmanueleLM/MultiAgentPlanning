(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    object_0 object_5 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ; stage ordering and initial active stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (now s0)

    ; static/unary facts required by the plan
    (cats object_0)

    (hand object_7)
    (hand object_8)

    (texture object_5)
    (texture object_6)

    (spring object_5)
    (spring object_6)

    ; initial next relations required by the plan
    (next object_0 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      ; terminal stage enforces that all steps progressed the stage marker
      (now s5)

      ; required target relations
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)