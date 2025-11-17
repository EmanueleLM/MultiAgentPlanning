(define (problem logistics_objects-problem)
  (:domain logistics_objects)
  (:objects
    ;; Scenario 1 objects
    object_0_s1 object_1_s1 object_2_s1 object_3_s1 object_4_s1 object_5_s1 object_6_s1 object_7_s1 object_8_s1 object_9_s1 object_10_s1 object_11_s1 - object
    ;; Scenario 2 objects
    object_0_s2 object_1_s2 object_2_s2 object_3_s2 object_4_s2 object_5_s2 object_6_s2 object_7_s2 object_8_s2 object_9_s2 object_10_s2 object_11_s2 object_12_s2 - object
    ;; discrete stages to enforce explicit sequential progression (sufficiently many for planned steps)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 stage_26 stage_27 stage_28 stage_29 stage_30 stage_31 stage_32 stage_33 stage_34 stage_35 stage_36 stage_37 stage_38 stage_39 stage_40 - stage
  )

  (:init
    ;; Stage chain and initial now
    (now stage_0)
    (succ stage_0 stage_1) (succ stage_1 stage_2) (succ stage_2 stage_3) (succ stage_3 stage_4)
    (succ stage_4 stage_5) (succ stage_5 stage_6) (succ stage_6 stage_7) (succ stage_7 stage_8)
    (succ stage_8 stage_9) (succ stage_9 stage_10) (succ stage_10 stage_11) (succ stage_11 stage_12)
    (succ stage_12 stage_13) (succ stage_13 stage_14) (succ stage_14 stage_15) (succ stage_15 stage_16)
    (succ stage_16 stage_17) (succ stage_17 stage_18) (succ stage_18 stage_19) (succ stage_19 stage_20)
    (succ stage_20 stage_21) (succ stage_21 stage_22) (succ stage_22 stage_23) (succ stage_23 stage_24)
    (succ stage_24 stage_25) (succ stage_25 stage_26) (succ stage_26 stage_27) (succ stage_27 stage_28)
    (succ stage_28 stage_29) (succ stage_29 stage_30) (succ stage_30 stage_31) (succ stage_31 stage_32)
    (succ stage_32 stage_33) (succ stage_33 stage_34) (succ stage_34 stage_35) (succ stage_35 stage_36)
    (succ stage_36 stage_37) (succ stage_37 stage_38) (succ stage_38 stage_39) (succ stage_39 stage_40)

    ;; -------- Scenario 1 initial facts --------
    (cats object_0_s1)
    (collect object_5_s1 object_1_s1)
    (collect object_6_s1 object_1_s1)
    (collect object_7_s1 object_2_s1)
    (collect object_8_s1 object_2_s1)
    (hand object_10_s1)
    (hand object_11_s1)
    (hand object_9_s1)
    (next object_0_s1 object_5_s1)
    (next object_10_s1 object_5_s1)
    (next object_11_s1 object_5_s1)
    (next object_3_s1 object_6_s1)
    (next object_4_s1 object_7_s1)
    (next object_9_s1 object_8_s1)
    (sneeze object_3_s1)
    (sneeze object_4_s1)
    (spring object_5_s1)
    (spring object_7_s1)
    (stupendous object_1_s1)
    (stupendous object_2_s1)
    (texture object_5_s1)
    (texture object_6_s1)
    (texture object_7_s1)
    (texture object_8_s1)

    ;; -------- Scenario 2 initial facts --------
    (cats object_0_s2)
    (cats object_1_s2)
    (collect object_6_s2 object_2_s2)
    (collect object_7_s2 object_2_s2)
    (collect object_8_s2 object_3_s2)
    (collect object_9_s2 object_3_s2)
    (hand object_10_s2)
    (hand object_11_s2)
    (hand object_12_s2)
    (next object_0_s2 object_6_s2)
    (next object_1_s2 object_8_s2)
    (next object_10_s2 object_9_s2)
    (next object_11_s2 object_6_s2)
    (next object_12_s2 object_6_s2)
    (next object_4_s2 object_7_s2)
    (next object_5_s2 object_8_s2)
    (sneeze object_4_s2)
    (sneeze object_5_s2)
    (spring object_6_s2)
    (spring object_8_s2)
    (stupendous object_2_s2)
    (stupendous object_3_s2)
    (texture object_6_s2)
    (texture object_7_s2)
    (texture object_8_s2)
    (texture object_9_s2)
  )

  (:goal
    (and
      ;; Goals for scenario 1
      (next object_10_s1 object_8_s1)
      (next object_11_s1 object_7_s1)
      (next object_9_s1 object_6_s1)

      ;; Goals for scenario 2
      (next object_10_s2 object_7_s2)
      (next object_11_s2 object_9_s2)
      (next object_12_s2 object_8_s2)
    )
  )
)