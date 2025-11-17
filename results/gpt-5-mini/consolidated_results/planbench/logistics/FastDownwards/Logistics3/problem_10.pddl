(define (problem multiagent-instance-staged)
  (:domain multiagent-staged)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    p0 p1 p2 p3 p4 p5 - phase
  )

  (:init
    (cats object_0)

    (collect object_5 object_1)
    (collect object_6 object_2)

    (hand object_7)
    (hand object_8)

    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_6)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_5)
    (texture object_6)

    (phase-next p0 p1)
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)
    (phase-next p4 p5)
    (current-phase p0)
  )

  (:goal
    (and
      (next object_7 object_5)
      (next object_8 object_5)
    )
  )
)