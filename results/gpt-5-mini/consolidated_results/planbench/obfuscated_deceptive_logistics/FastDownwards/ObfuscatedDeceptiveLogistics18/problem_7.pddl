(define (problem odl18-problem1)
  (:domain ObfuscatedDeceptiveLogistics18)
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 - stage
  )
  (:init
    ;; object-level initial facts (from the provided initial statement used to produce the plan)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (next object_5 object_9)
    (next object_11 object_9)
    (next object_10 object_7)
    (next object_4 object_7)
    (next object_12 object_8)
    (next object_1 object_8)
    (next object_13 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stage definitions and explicit successor chain for 12-step plan
    (stage stage_0) (stage stage_1) (stage stage_2) (stage stage_3) (stage stage_4) (stage stage_5)
    (stage stage_6) (stage stage_7) (stage stage_8) (stage stage_9) (stage stage_10) (stage stage_11) (stage stage_12)

    (succ stage_0 stage_1) (succ stage_1 stage_2) (succ stage_2 stage_3) (succ stage_3 stage_4)
    (succ stage_4 stage_5) (succ stage_5 stage_6) (succ stage_6 stage_7) (succ stage_7 stage_8)
    (succ stage_8 stage_9) (succ stage_9 stage_10) (succ stage_10 stage_11) (succ stage_11 stage_12)

    ;; start with free-stage at stage_0; actions will move it strictly forward via succ
    (free-stage stage_0)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)