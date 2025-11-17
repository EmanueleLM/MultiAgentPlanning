(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    object_0 object_5 object_6 object_7 object_8 - obj
  )

  (:init
    ; minimal unary facts needed by the provided plan
    (cats object_0)

    (hand object_7)
    (hand object_8)

    ; merged texture+spring facts (object_5 and object_6 serve both roles)
    (texspr object_5)
    (texspr object_6)

    ; initial next relations required by the plan (only those actually used)
    (next object_0 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
  )

  (:goal
    (and
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)