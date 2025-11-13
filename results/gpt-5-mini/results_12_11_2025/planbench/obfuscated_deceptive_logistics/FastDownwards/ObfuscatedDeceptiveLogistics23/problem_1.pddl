(define (problem ObfuscatedDeceptiveLogistics23-instance)
  (:domain ObfuscatedDeceptiveLogistics23)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  ; Initial facts: union of the two statements' initial facts (as given in the specification)
  (:init
    ; cats
    (cats object_0)
    (cats object_1)

    ; collect facts (union)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ; hand facts
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ; next facts (union)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ; sneeze
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ; spring
    (spring object_5)
    (spring object_8)
    (spring object_6)
    (spring object_9)

    ; stupendous
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ; texture
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_11)
  )

  ; Goals: union of required next relations from both statements
  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
      (next object_12 object_10)
      (next object_13 object_9)
    )
  )
)