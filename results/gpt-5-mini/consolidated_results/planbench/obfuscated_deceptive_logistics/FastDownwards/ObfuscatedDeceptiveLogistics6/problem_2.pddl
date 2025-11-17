(define (problem ObfuscatedDeceptiveLogistics6-problem1)
  (:domain ObfuscatedDeceptiveLogistics6)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 - stage
  )

  (:init
    ;; initial facts (first statement)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_9)
    (next object_0 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_6)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; explicit stage ordering for discrete-time progression
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)

    ;; start at stage_0
    (current stage_0)
  )

  (:goal (and
    (next object_9 object_7)
  ))
)