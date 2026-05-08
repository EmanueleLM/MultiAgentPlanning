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
    (is-wall c_49_0) (is-wall c_49_2) (is-50_0) (is-wall c_50_2) (is-wall c_51_0) (is-wall c_51_2) ; Correcting typo: (is-50_0) -> (is-wall c_50_0)
    (is-wall c_50_0) (is-wall c_50_2) (is-wall c_51_0) (is-wall c_51_2)
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

    ;; Connections (vertical only in column 1)
    (connected c_1_1 c_2_1) (connected c_2_1 c_1_1)
    (connected c_2_1 c_3_1) (connected c_3_1 c_2_1)
    (connected c_3_1 c_4_1) (connected c_4_1 c_3_1)
    (connected c_4_1 c_5_1) (connected c_5_1 c_4_1)
    (connected c_5_1 c_6_1) (connected c_6_1 c_5_1)
    (connected c_6_1 c_7_1) (connected c_7_1 c_6_1)
    (connected c_7_1 c_8_1) (connected c_8_1 c_7_1)
    (connected c_8_1 c_9_1) (connected c_9_1 c_8_1)
    (connected c_9_1 c_10_1) (connected c_10_1 c_9_1)
    (connected c_10_1 c_11_1) (connected c_11_1 c_10_1)
    (connected c_11_1 c_12_1) (connected c_12_1 c_11_1)
    (connected c_12_1 c_13_1) (connected c_13_1 c_12_1)
    (connected c_13_1 c_14_1) (connected c_14_1 c_13_1)
    (connected c_14_1 c_15_1) (connected c_15_1 c_14_1)
    (connected c_15_1 c_16_1) (connected c_16_1 c_15_1)
    (connected c_16_1 c_17_1) (connected c_17_1 c_16_1)
    (connected c_17_1 c_18_1) (connected c_18_1 c_17_1)
    (connected c_18_1 c_19_1) (connected c_19_1 c_18_1)
    (connected c_19_1 c_20_1) (connected c_20_1 c_19_1)
    (connected c_20_1 c_21_1) (connected c_21_1 c_20_1)
    (connected c_21_1 c_22_1) (connected c_22_1 c_21_1)
    (connected c_22_1 c_23_1) (connected c_23_1 c_22_1)
    (connected c_23_1 c_24_1) (connected c_24_1 c_23_1)
    (connected c_24_1 c_25_1) (connected c_25_1 c_24_1)
    (connected c_25_1 c_26_1) (connected c_26_1 c_25_1)
    (connected c_26_1 c_27_1) (connected c_27_1 c_26_1)
    (connected c_27_1 c_28_1) (connected c_28_1 c_27_1)
    (connected c_28_1 c_29_1) (connected c_29_1 c_28_1)
    (connected c_29_1 c_30_1) (connected c_30_1 c_29_1)
    (connected c_30_1 c_31_1) (connected c_31_1 c_30_1)
    (connected c_31_1 c_32_1) (connected c_32_1 c_31_1)
    (connected c_32_1 c_33_1) (connected c_33_1 c_32_1)
    (connected c_33_1 c_34_1) (connected c_34_1 c_33_1)
    (connected c_34_1 c_35_1) (connected c_35_1 c_34_1)
    (connected c_35_1 c_36_1) (connected c_36_1 c_35_1)
    (connected c_36_1 c_37_1) (connected c_37_1 c_36_1)
    (connected c_37_1 c_38_1) (connected c_38_1 c_37_1)
    (connected c_38_1 c_39_1) (connected c_39_1 c_38_1)
    (connected c_39_1 c_40_1) (connected c_40_1 c_39_1)
    (connected c_40_1 c_41_1) (connected c_41_1 c_40_1)
    (connected c_41_1 c_42_1) (connected c_42_1 c_41_1)
    (connected c_42_1 c_43_1) (connected c_43_1 c_42_1)
    (connected c_43_1 c_44_1) (connected c_44_1 c_43_1)
    (connected c_44_1 c_45_1) (connected c_45_1 c_44_1)
    (connected c_45_1 c_46_1) (connected c_46_1 c_45_1)
    (connected c_46_1 c_47_1) (connected c_47_1 c_46_1)
    (connected c_47_1 c_48_1) (connected c_48_1 c_47_1)
    (connected c_48_1 c_49_1) (connected c_49_1 c_48_1)
    (connected c_49_1 c_50_1) (connected c_50_1 c_49_1)
    (connected c_50_1 c_51_1) (connected c_51_1 c_50_1)
    (connected c_51_1 c_52_1) (connected c_52_1 c_51_1)
    (connected c_52_1 c_53_1) (connected c_53_1 c_52_1)
    (connected c_53_1 c_54_1) (connected c_54_1 c_53_1)
    (connected c_54_1 c_55_1) (connected c_55_1 c_54_1)
    (connected c_55_1 c_56_1) (connected c_56_1 c_55_1)
    (connected c_56_1 c_57_1) (connected c_57_1 c_56_1)
    (connected c_57_1 c_58_1) (connected c_58_1 c_57_1)
    (connected c_58_1 c_59_1) (connected c_59_1 c_58_1)
    (connected c_59_1 c_60_1) (connected c_60_1 c_59_1)
    (connected c_60_1 c_61_1) (connected c_61_1 c_60_1)
    (connected c_61_1 c_62_1) (connected c_62_1 c_61_1)
    (connected c_62_1 c_63_1) (connected c_63_1 c_62_1)
    (connected c_63_1 c_64_1) (connected c_64_1 c_63_1)
    (connected c_64_1 c_65_1) (connected c_65_1 c_64_1)
    (connected c_65_1 c_66_1) (connected c_66_1 c_65_1)
    (connected c_66_1 c_67_1) (connected c_67_1 c_66_1)
    (connected c_67_1 c_68_1) (connected c_68_1 c_67_1)
    (connected c_68_1 c_69_1) (connected c_69_1 c_68_1)
    (connected c_69_1 c_70_1) (connected c_70_1 c_69_1)
  )
  (:goal (and
    (box-on-goal box1)
  ))
  (:metric minimize (total-cost))
)