(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    object_12 object_13 object_14 - hand
    object_0 object_1            - cat
    object_4 object_5            - sneeze
    object_2 object_3            - stupendous
    object_6 object_7 object_8 object_9 object_10 object_11 - texture

    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 - stage
  )

  (:init
    ;; collect facts
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; spring facts
    (spring object_6)
    (spring object_9)

    ;; initial next relations
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; initial stage and successor chain to enforce sequential action ordering
    (current stage_0)
    (succ stage_0 stage_1) (succ stage_1 stage_2) (succ stage_2 stage_3)
    (succ stage_3 stage_4) (succ stage_4 stage_5) (succ stage_5 stage_6)
    (succ stage_6 stage_7) (succ stage_7 stage_8) (succ stage_8 stage_9)
    (succ stage_9 stage_10) (succ stage_10 stage_11) (succ stage_11 stage_12)
    (succ stage_12 stage_13) (succ stage_13 stage_14) (succ stage_14 stage_15)
    (succ stage_15 stage_16) (succ stage_16 stage_17) (succ stage_17 stage_18)
    (succ stage_18 stage_19) (succ stage_19 stage_20) (succ stage_20 stage_21)
    (succ stage_21 stage_22) (succ stage_22 stage_23) (succ stage_23 stage_24)
    (succ stage_24 stage_25)
  )

  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)