(define (problem hanoi6-problem)
  (:domain hanoi6)
  (:objects
    disk_a disk_b disk_c disk_d disk_e disk_f - disk
    peg_left peg_mid peg_right - peg
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 stage_26 stage_27 stage_28 stage_29
    stage_30 stage_31 stage_32 stage_33 stage_34 stage_35 stage_36 stage_37 stage_38 stage_39
    stage_40 stage_41 stage_42 stage_43 stage_44 stage_45 stage_46 stage_47 stage_48 stage_49
    stage_50 stage_51 stage_52 stage_53 stage_54 stage_55 stage_56 stage_57 stage_58 stage_59
    stage_60 stage_61 stage_62 stage_63 - stage
  )

  (:init
    ;; initial stack on peg_right (top-to-bottom: disk_a, disk_b, disk_c, disk_d, disk_e, disk_f)
    (on disk_a disk_b)
    (on disk_b disk_c)
    (on disk_c disk_d)
    (on disk_d disk_e)
    (on disk_e disk_f)
    (on-peg disk_f peg_right)

    ;; clear facts: only the top disk and empty pegs are clear initially
    (clear-disk disk_a)
    (clear-peg peg_left)
    (clear-peg peg_mid)

    ;; static size ordering (pairwise smaller relations)
    (smaller disk_a disk_b) (smaller disk_a disk_c) (smaller disk_a disk_d) (smaller disk_a disk_e) (smaller disk_a disk_f)
    (smaller disk_b disk_c) (smaller disk_b disk_d) (smaller disk_b disk_e) (smaller disk_b disk_f)
    (smaller disk_c disk_d) (smaller disk_c disk_e) (smaller disk_c disk_f)
    (smaller disk_d disk_e) (smaller disk_d disk_f)
    (smaller disk_e disk_f)

    ;; stage successor chain for 64 stages (0..63) to permit exactly 63 moves
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
    (succ stage_40 stage_41) (succ stage_41 stage_42) (succ stage_42 stage_43) (succ stage_43 stage_44)
    (succ stage_44 stage_45) (succ stage_45 stage_46) (succ stage_46 stage_47) (succ stage_47 stage_48)
    (succ stage_48 stage_49) (succ stage_49 stage_50) (succ stage_50 stage_51) (succ stage_51 stage_52)
    (succ stage_52 stage_53) (succ stage_53 stage_54) (succ stage_54 stage_55) (succ stage_55 stage_56)
    (succ stage_56 stage_57) (succ stage_57 stage_58) (succ stage_58 stage_59) (succ stage_59 stage_60)
    (succ stage_60 stage_61) (succ stage_61 stage_62) (succ stage_62 stage_63)

    ;; initial current stage
    (current stage_0)
  )

  (:goal (and
    ;; final full stack on peg_mid (top-to-bottom: disk_a, disk_b, disk_c, disk_d, disk_e, disk_f)
    (on disk_a disk_b)
    (on disk_b disk_c)
    (on disk_c disk_d)
    (on disk_d disk_e)
    (on disk_e disk_f)
    (on-peg disk_f peg_mid)

    ;; final emptiness of the other pegs
    (clear-peg peg_left)
    (clear-peg peg_right)

    ;; final stage after 63 moves
    (current stage_63)
  ))