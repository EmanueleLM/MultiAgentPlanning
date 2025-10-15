(define (problem multiagent-problem)
  (:domain multiagent-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8
  )
  (:init
    ; cats
    (cats object_0)
    (cats object_1)

    ; hand
    (hand object_7)
    (hand object_8)

    ; texture
    (texture object_5)
    (texture object_6)
    (texture object_7)

    ; vase
    ; (none initially)

    ; next relations (combined)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_7 object_6)
    (next object_8 object_5)

    ; collect relations (combined)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (collect object_5 object_1)

    ; sneeze
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ; spring
    (spring object_5)
    (spring object_6)
    (spring object_7)

    ; stupendous
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)
  )
  (:goal (and
    (next object_7 object_6)
    (next object_8 object_6)
  ))
)