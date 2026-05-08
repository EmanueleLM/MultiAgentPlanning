(define (problem sokoban_map25_problem)
  (:domain sokoban_map25)
  (:objects
    c_0_0 c_0_1 c_0_2 c_1_0 c_1_1 c_1_2 c_2_0 c_2_1 c_2_2 c_3_0 c_3_1 c_3_2
    c_4_0 c_4_1 c_4_2 c_5_0 c_5_1 c_5_2 c_6_0 c_6_1 c_6_2 c_7_0 c_7_1 c_7_2
    c_8_0 c_8_1 c_8_2 c_9_0 c_9_1 c_9_2 c_10_0 c_10_1 c_10_2 c_11_0 c_11_1 c_11_2
    c_12_0 c_12_1 c_12_2 c_13_0 c_13_1 c_13_2 c_14_0 c_14_1 c_14_2 c_15_0 c_15_1 c_15_2
    c_16_0 c_16_1 c_16_2 c_17_0 c_17_1 c_17_2 c_18_0 c_18_1 c_18_2 c_19_0 c_19_1 c_19_2
    c_20_0 c_20_1 c_20_2 c_21_0 c_21_1 c_21_2 c_22_0 c_22_1 c_22_2 c_23_0 c_23_1 c_23_2
    c_24_0 c_24_1 c_24_2 c_25_0 c_25_1 c_25_2 c_26_0 c_26_1 c_26_2 c_27_0 c_27_1 c_27_2
    c_28_0 c_28_1 c_28_2 c_29_0 c_29_1 c_29_2 c_30_0 c_30_1 c_30_2 c_31_0 c_31_1 c_31_2
    c_32_0 c_32_1 c_32_2 c_33_0 c_33_1 c_33_2 c_34_0 c_34_1 c_34_2 c_35_0 c_35_1 c_35_2
    c_36_0 c_36_1 c_36_2 c_37_0 c_37_1 c_37_2 c_38_0 c_38_1 c_38_2 c_39_0 c_39_1 c_39_2
    c_40_0 c_40_1 c_40_2 c_41_0 c_41_1 c_41_2 c_42_0 c_42_1 c_42_2 c_43_0 c_43_1 c_43_2
    c_44_0 c_44_1 c_44_2 c_45_0 c_45_1 c_45_2 c_46_0 c_46_1 c_46_2 c_47_0 c_47_1 c_47_2
    c_48_0 c_48_1 c_48_2 c_49_0 c_49_1 c_49_2 c_50_0 c_50_1 c_50_2 c_51_0 c_51_1 c_51_2
    c_52_0 c_52_1 c_52_2 c_53_0 c_53_1 c_53_2 c_54_0 c_54_1 c_54_2 c_55_0 c_55_1 c_55_2
    c_56_0 c_56_1 c_56_2 c_57_0 c_57_1 c_57_2 c_58_0 c_58_1 c_58_2 c_59_0 c_59_1 c_59_2
    c_60_0 c_60_1 c_60_2 c_61_0 c_61_1 c_61_2 c_62_0 c_62_1 c_62_2 c_63_0 c_63_1 c_63_2
    c_64_0 c_64_1 c_64_2 c_65_0 c_65_1 c_65_2 c_66_0 c_66_1 c_66_2 c_67_0 c_67_1 c_67_2
    c_68_0 c_68_1 c_68_2 c_69_0 c_69_1 c_69_2 c_70_0 c_70_1 c_70_2 c_71_0 c_71_1 c_71_2 - cell
  )
  (:init
    (= (total-cost) 0)
    ;; Walls
    (is-wall c_0_0) (is-wall c_0_1) (is-wall c_0_2)
    (is-wall c_71_0) (is-wall c_71_1) (is-wall c_71_2)
    (is-wall c_1_0) (is-wall c_1_2) (is-wall c_2_0) (is-wall c_2_2) (is-wall c_3_0) (is-wall c_3_2)
    (is-wall c_4_0) (is-wall c_4_2) (is-wall c_5_0) (is-wall c_5_2) (is-wall c_6_0) (is-wall c_6_2)
    (is-wall c_7_0) (is-wall c_7_2) (is-wall c_8_0) (is-wall c_8_2) (is-wall c_9_0) (is-wall c_9_2)
    (is-wall c_10_0) (is-wall c_10_2) (is-wall c_11_0) (is-wall c_11_2) (is-wall c_12_0) (is-wall c_12_2)
    (is-wall c_13_0) (is-wall c_13_2) (is-wall c_14_0) (is-wall c_14_2) (is-wall c_15_0) (is-wall c_15_2)
    (is-wall c_16_0) (is-wall c_16_2) (is-wall c_17_0) (is-wall c_17_2) (is-wall c_18_0) (is-wall c_18_2)
    (is-wall c_19_0) (is-wall c_19_2) (is-wall c_20_0) (is-wall c_20_2) (is-wall c_21_0) (is-wall c_21_2)
    (is-wall c_22_0) (is-wall c_22_2) (is-wall c_23_0) (is-wall c_23_2) (is-wall c_24_0) (is-wall c_24_2)
    (is-wall c_25_0) (is-wall c_25_2) (is-wall c_26_0) (is-wall c_26_2) (is-wall c_27_0) (is-wall c_27_2)
    (is-wall c_28_0) (is-wall c_28_2) (is-wall c_29_0) (is-wall c_29_2) (is-wall c_30_0) (is-wall c_30_2)
    (is-wall c_31_0) (is-wall c_31_2) (is-wall c_32_0) (is-wall c_32_2) (is-wall c_33_0) (is-wall c_33_2)
    (is-wall c_34_0) (is-wall c_34_2) (is-wall c_35_0) (is-wall c_35_2) (is-wall c_36_0) (is-wall c_36_2)
    (is-wall c_37_0) (is-wall c_37_2) (is-wall c_38_0) (is-wall c_38_2) (is-wall c_39_0) (is-wall c_39_2)
    (is-wall c_40_0) (is-wall c_40_2) (is-wall c_41_0) (is-wall c_41_2) (is-wall c_42_0) (is-wall c_42_2)
    (is-wall c_43_0) (is-wall c_43_2) (is-wall c_44_0) (is-wall c_44_2) (is-wall c_45_0) (is-wall c_45_2)
    (is-wall c_46_0) (is-wall c_46_2) (is-wall c_47_0) (is-wall c_47_2) (is-wall c_48_0) (is-wall c_48_2)
    (is-wall c_49_0) (is-wall c_49_2) (is-wall c_50_0) (is-wall c_50_2) (is-wall c_51_0) (is-wall c_51_2)
    (is-wall c_52_0) (is-wall c_52_2) (is-wall c_53_0) (is-wall c_53_2) (is-wall c_54_0) (is-wall c_54_2)
    (is-wall c_55_0) (is-wall c_55_2) (is-wall c_56_0) (is-wall c_56_2) (is-wall c_57_0) (is-wall c_57_2)
    (is-wall c_58_0) (is-wall c_58_2) (is-wall c_59_0) (is-wall c_59_2) (is-wall c_60_0) (is-wall c_60_2)
    (is-wall c_61_0) (is-wall c_61_2) (is-wall c_62_0) (is-wall c_62_2) (is-wall c_63_0) (is-wall c_63_2)
    (is-wall c_64_0) (is-wall c_64_2) (is-wall c_65_0) (is-wall c_65_2) (is-wall c_66_0) (is-wall c_66_2)
    (is-wall c_67_0) (is-wall c_67_2) (is-wall c_68_0) (is-wall c_68_2) (is-wall c_69_0) (is-wall c_69_2)
    (is-wall c_70_0) (is-wall c_70_2)

    ;; Player and Box initial positions
    (at-player c_1_1)
    (at-box box1 c_51_1)

    ;; Goal position
    (is-goal c_70_1)

    ;; Box on goal status initially
    (not (box-on-goal box1))

    ;; Adjacencies for column 1
    ;; (adj_up ?from ?to) means ?to is directly above ?from
    ;; (adj_down ?from ?to) means ?to is directly below ?from
    
    ; c_r_1 adj_up c_{r-1}_1 (for r from 1 to 71)
    (adj_up c_1_1 c_0_1)
    (adj_up c_2_1 c_1_1) (adj_up c_3_1 c_2_1) (adj_up c_4_1 c_3_1) (adj_up c_5_1 c_4_1) (adj_up c_6_1 c_5_1)
    (adj_up c_7_1 c_6_1) (adj_up c_8_1 c_7_1) (adj_up c_9_1 c_8_1) (adj_up c_10_1 c_9_1) (adj_up c_11_1 c_10_1)
    (adj_up c_12_1 c_11_1) (adj_up c_13_1 c_12_1) (adj_up c_14_1 c_13_1) (adj_up c_15_1 c_14_1) (adj_up c_16_1 c_15_1)
    (adj_up c_17_1 c_16_1) (adj_up c_18_1 c_17_1) (adj_up c_19_1 c_18_1) (adj_up c_20_1 c_19_1) (adj_up c_21_1 c_20_1)
    (adj_up c_22_1 c_21_1) (adj_up c_23_1 c_22_1) (adj_up c_24_1 c_23_1) (adj_up c_25_1 c_24_1) (adj_up c_26_1 c_25_1)
    (adj_up c_27_1 c_26_1) (adj_up c_28_1 c_27_1) (adj_up c_29_1 c_28_1) (adj_up c_30_1 c_29_1) (adj_up c_31_1 c_30_1)
    (adj_up c_32_1 c_31_1) (adj_up c_33_1 c_32_1) (adj_up c_34_1 c_33_1) (adj_up c_35_1 c_34_1) (adj_up c_36_1 c_35_1)
    (adj_up c_37_1 c_36_1) (adj_up c_38_1 c_37_1) (adj_up c_39_1 c_38_1) (adj_up c_40_1 c_39_1) (adj_up c_41_1 c_40_1)
    (adj_up c_42_1 c_41_1) (adj_up c_43_1 c_42_1) (adj_up c_44_1 c_43_1) (adj_up c_45_1 c_44_1) (adj_up c_46_1 c_45_1)
    (adj_up c_47_1 c_46_1) (adj_up c_48_1 c_47_1) (adj_up c_49_1 c_48_1) (adj_up c_50_1 c_49_1) (adj_up c_51_1 c_50_1)
    (adj_up c_52_1 c_51_1) (adj_up c_53_1 c_52_1) (adj_up c_54_1 c_53_1) (adj_up c_55_1 c_54_1) (adj_up c_56_1 c_55_1)
    (adj_up c_57_1 c_56_1) (adj_up c_58_1 c_57_1) (adj_up c_59_1 c_58_1) (adj_up c_60_1 c_59_1) (adj_up c_61_1 c_60_1)
    (adj_up c_62_1 c_61_1) (adj_up c_63_1 c_62_1) (adj_up c_64_1 c_63_1) (adj_up c_65_1 c_64_1) (adj_up c_66_1 c_65_1)
    (adj_up c_67_1 c_66_1) (adj_up c_68_1 c_67_1) (adj_up c_69_1 c_68_1) (adj_up c_70_1 c_69_1)
    (adj_up c_71_1 c_70_1)

    ; c_r_1 adj_down c_{r+1}_1 (for r from 0 to 70)
    (adj_down c_0_1 c_1_1)
    (adj_down c_1_1 c_2_1) (adj_down c_2_1 c_3_1) (adj_down c_3_1 c_4_1) (adj_down c_4_1 c_5_1) (adj_down c_5_1 c_6_1)
    (adj_down c_6_1 c_7_1) (adj_down c_7_1 c_8_1) (adj_down c_8_1 c_9_1) (adj_down c_9_1 c_10_1) (adj_down c_10_1 c_11_1)
    (adj_down c_11_1 c_12_1) (adj_down c_12_1 c_13_1) (adj_down c_13_1 c_14_1) (adj_down c_14_1 c_15_1) (adj_down c_15_1 c_16_1)
    (adj_down c_16_1 c_17_1) (adj_down c_17_1 c_18_1) (adj_down c_18_1 c_19_1) (adj_down c_19_1 c_20_1) (adj_down c_20_1 c_21_1)
    (adj_down c_21_1 c_22_1) (adj_down c_22_1 c_23_1) (adj_down c_23_1 c_24_1) (adj_down c_24_1 c_25_1) (adj_down c_25_1 c_26_1)
    (adj_down c_26_1 c_27_1) (adj_down c_27_1 c_28_1) (adj_down c_28_1 c_29_1) (adj_down c_29_1 c_30_1) (adj_down c_30_1 c_31_1)
    (adj_down c_31_1 c_32_1) (adj_down c_32_1 c_33_1) (adj_down c_33_1 c_34_1) (adj_down c_34_1 c_35_1) (adj_down c_35_1 c_36_1)
    (adj_down c_36_1 c_37_1) (adj_down c_37_1 c_38_1) (adj_down c_38_1 c_39_1) (adj_down c_39_1 c_40_1) (adj_down c_40_1 c_41_1)
    (adj_down c_41_1 c_42_1) (adj_down c_42_1 c_43_1) (adj_down c_43_1 c_44_1) (adj_down c_44_1 c_45_1) (adj_down c_45_1 c_46_1)
    (adj_down c_46_1 c_47_1) (adj_down c_47_1 c_48_1) (adj_down c_48_1 c_49_1) (adj_down c_49_1 c_50_1) (adj_down c_50_1 c_51_1)
    (adj_down c_51_1 c_52_1) (adj_down c_52_1 c_53_1) (adj_down c_53_1 c_54_1) (adj_down c_54_1 c_55_1) (adj_down c_55_1 c_56_1)
    (adj_down c_56_1 c_57_1) (adj_down c_57_1 c_58_1) (adj_down c_58_1 c_59_1) (adj_down c_59_1 c_60_1) (adj_down c_60_1 c_61_1)
    (adj_down c_61_1 c_62_1) (adj_down c_62_1 c_63_1) (adj_down c_63_1 c_64_1) (adj_down c_64_1 c_65_1) (adj_down c_65_1 c_66_1)
    (adj_down c_66_1 c_67_1) (adj_down c_67_1 c_68_1) (adj_down c_68_1 c_69_1) (adj_down c_69_1 c_70_1)
    (adj_down c_70_1 c_71_1)
  )
  (:goal (and
    (box-on-goal box1)
  ))
  (:metric minimize (total-cost))
)