(define (problem ObfuscatedDeceptiveLogistics1-statementA)
  (:domain ObfuscatedDeceptiveLogistics1)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - object
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (hand object_8)
    (next object_0 object_7)
    (next object_1 object_7)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_7)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)

    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (available stage_0)
  )

  (:goal (and
    (next object_8 object_6)
  ))
)