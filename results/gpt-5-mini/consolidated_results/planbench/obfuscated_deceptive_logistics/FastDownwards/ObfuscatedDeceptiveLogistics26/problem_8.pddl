(define (problem Scenario_A)
  (:domain obfuscated_deceptive_logistics26)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 stage_26 stage_27 stage_28 stage_29 stage_30 - stage
  )

  (:init
    ;; Scenario A initial facts
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)
    (hand object_12)
    (hand object_13)

    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stages and successor chain enforce contiguous time progression
    (stage stage_0) (stage stage_1) (stage stage_2) (stage stage_3) (stage stage_4) (stage stage_5)
    (stage stage_6) (stage stage_7) (stage stage_8) (stage stage_9) (stage stage_10) (stage stage_11)
    (stage stage_12) (stage stage_13) (stage stage_14) (stage stage_15) (stage stage_16) (stage stage_17)
    (stage stage_18) (stage stage_19) (stage stage_20) (stage stage_21) (stage stage_22) (stage stage_23)
    (stage stage_24) (stage stage_25) (stage stage_26) (stage stage_27) (stage stage_28) (stage stage_29) (stage stage_30)

    (succ stage_0 stage_1) (succ stage_1 stage_2) (succ stage_2 stage_3) (succ stage_3 stage_4) (succ stage_4 stage_5)
    (succ stage_5 stage_6) (succ stage_6 stage_7) (succ stage_7 stage_8) (succ stage_8 stage_9) (succ stage_9 stage_10)
    (succ stage_10 stage_11) (succ stage_11 stage_12) (succ stage_12 stage_13) (succ stage_13 stage_14) (succ stage_14 stage_15)
    (succ stage_15 stage_16) (succ stage_16 stage_17) (succ stage_17 stage_18) (succ stage_18 stage_19) (succ stage_19 stage_20)
    (succ stage_20 stage_21) (succ stage_21 stage_22) (succ stage_22 stage_23) (succ stage_23 stage_24) (succ stage_24 stage_25)
    (succ stage_25 stage_26) (succ stage_26 stage_27) (succ stage_27 stage_28) (succ stage_28 stage_29) (succ stage_29 stage_30)

    (current stage_0)
  )

  (:goal (and
    (next object_11 object_5)
    (next object_12 object_9)
    (next object_13 object_10)
  ))
)