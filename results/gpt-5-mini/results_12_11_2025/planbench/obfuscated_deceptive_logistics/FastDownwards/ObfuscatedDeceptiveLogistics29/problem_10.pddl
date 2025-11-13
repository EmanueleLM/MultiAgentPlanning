(define (problem odl29-instance)
  (:domain ObfuscatedDeceptiveLogistics29)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; unary role/property facts (only those required by the plan / reachable goal)
    (cats object_0)

    (hand object_11) (hand object_12) (hand object_13) (hand object_14)

    (sneeze object_3) (sneeze object_4)

    (spring object_5) (spring object_8)

    (stupendous object_1) (stupendous object_2)

    (texture object_10) (texture object_5) (texture object_6) (texture object_7) (texture object_8) (texture object_9)

    ;; collect relations needed by wretched instances in the plan
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; initial ordering (next) facts necessary to seed the plan
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_5)
    (next object_13 object_7)
    (next object_14 object_9)
    (next object_3 object_6)
    (next object_4 object_9)
  )

  (:goal (and
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_5)
    (next object_14 object_7)
  ))
)