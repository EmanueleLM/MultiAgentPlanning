(define (problem sokoban_problem)
  (:domain sokoban_domain)
  (:objects
    pos_2_2 pos_3_2 pos_4_2 pos_5_2 pos_6_2 pos_7_2 pos_8_2 pos_9_2 pos_10_2
    pos_11_2 pos_12_2 pos_13_2 pos_14_2 pos_15_2 pos_16_2 pos_17_2 pos_18_2 pos_19_2 pos_20_2
    pos_21_2 pos_22_2 pos_23_2 pos_24_2 pos_25_2 pos_26_2 pos_27_2 pos_28_2 pos_29_2 pos_30_2
    pos_31_2 pos_32_2 pos_33_2 pos_34_2 pos_35_2 pos_36_2 pos_37_2 pos_38_2 pos_39_2 pos_40_2
    pos_41_2 pos_42_2 pos_43_2 pos_44_2 pos_45_2 pos_46_2 pos_47_2 pos_48_2 pos_49_2 pos_50_2
    pos_51_2 pos_52_2 pos_53_2 pos_54_2 pos_55_2 pos_56_2 pos_57_2 pos_58_2 pos_59_2 pos_60_2
    pos_61_2 pos_62_2 pos_63_2 pos_64_2 pos_65_2 pos_66_2 pos_67_2 pos_68_2 pos_69_2 pos_70_2
    pos_71_2 pos_72_2 pos_73_2 pos_74_2 pos_75_2 pos_76_2 pos_77_2 pos_78_2 pos_79_2 pos_80_2
    pos_81_2 pos_82_2 pos_83_2 pos_84_2 pos_85_2 pos_86_2 pos_87_2 pos_88_2 pos_89_2 pos_90_2
    pos_91_2 pos_92_2 - location
  )
  (:init
    (at_player pos_92_2)
    (at_box pos_47_2)

    (next pos_2_2 pos_3_2) (next pos_3_2 pos_4_2) (next pos_4_2 pos_5_2) (next pos_5_2 pos_6_2) (next pos_6_2 pos_7_2)
    (next pos_7_2 pos_8_2) (next pos_8_2 pos_9_2) (next pos_9_2 pos_10_2) (next pos_10_2 pos_11_2) (next pos_11_2 pos_12_2)
    (next pos_12_2 pos_13_2) (next pos_13_2 pos_14_2) (next pos_14_2 pos_15_2) (next pos_15_2 pos_16_2) (next pos_16_2 pos_17_2)
    (next pos_17_2 pos_18_2) (next pos_18_2 pos_19_2) (next pos_19_2 pos_20_2) (next pos_20_2 pos_21_2) (next pos_21_2 pos_22_2)
    (next pos_22_2 pos_23_2) (next pos_23_2 pos_24_2) (next pos_24_2 pos_25_2) (next pos_25_2 pos_26_2) (next pos_26_2 pos_27_2)
    (next pos_27_2 pos_28_2) (next pos_28_2 pos_29_2) (next pos_29_2 pos_30_2) (next pos_30_2 pos_31_2) (next pos_31_2 pos_32_2)
    (next pos_32_2 pos_33_2) (next pos_33_2 pos_34_2) (next pos_34_2 pos_35_2) (next pos_35_2 pos_36_2) (next pos_36_2 pos_37_2)
    (next pos_37_2 pos_38_2) (next pos_38_2 pos_39_2) (next pos_39_2 pos_40_2) (next pos_40_2 pos_41_2) (next pos_41_2 pos_42_2)
    (next pos_42_2 pos_43_2) (next pos_43_2 pos_44_2) (next pos_44_2 pos_45_2) (next pos_45_2 pos_46_2) (next pos_46_2 pos_47_2)
    (next pos_47_2 pos_48_2) (next pos_48_2 pos_49_2) (next pos_49_2 pos_50_2) (next pos_50_2 pos_51_2) (next pos_51_2 pos_52_2)
    (next pos_52_2 pos_53_2) (next pos_53_2 pos_54_2) (next pos_54_2 pos_55_2) (next pos_55_2 pos_56_2) (next pos_56_2 pos_57_2)
    (next pos_57_2 pos_58_2) (next pos_58_2 pos_59_2) (next pos_59_2 pos_60_2) (next pos_60_2 pos_61_2) (next pos_61_2 pos_62_2)
    (next pos_62_2 pos_63_2) (next pos_63_2 pos_64_2) (next pos_64_2 pos_65_2) (next pos_65_2 pos_66_2) (next pos_66_2 pos_67_2)
    (next pos_67_2 pos_68_2) (next pos_68_2 pos_69_2) (next pos_69_2 pos_70_2) (next pos_70_2 pos_71_2) (next pos_71_2 pos_72_2)
    (next pos_72_2 pos_73_2) (next pos_73_2 pos_74_2) (next pos_74_2 pos_75_2) (next pos_75_2 pos_76_2) (next pos_76_2 pos_77_2)
    (next pos_77_2 pos_78_2) (next pos_78_2 pos_79_2) (next pos_79_2 pos_80_2) (next pos_80_2 pos_81_2) (next pos_81_2 pos_82_2)
    (next pos_82_2 pos_83_2) (next pos_83_2 pos_84_2) (next pos_84_2 pos_85_2) (next pos_85_2 pos_86_2) (next pos_86_2 pos_87_2)
    (next pos_87_2 pos_88_2) (next pos_88_2 pos_89_2) (next pos_89_2 pos_90_2) (next pos_90_2 pos_91_2) (next pos_91_2 pos_92_2)

    (is_clear pos_2_2) (is_clear pos_3_2) (is_clear pos_4_2) (is_clear pos_5_2) (is_clear pos_6_2) (is_clear pos_7_2) (is_clear pos_8_2) (is_clear pos_9_2) (is_clear pos_10_2)
    (is_clear pos_11_2) (is_clear pos_12_2) (is_clear pos_13_2) (is_clear pos_14_2) (is_clear pos_15_2) (is_clear pos_16_2) (is_clear pos_17_2) (is_clear pos_18_2) (is_clear pos_19_2) (is_clear pos_20_2)
    (is_clear pos_21_2) (is_clear pos_22_2) (is_clear pos_23_2) (is_clear pos_24_2) (is_clear pos_25_2) (is_clear pos_26_2) (is_clear pos_27_2) (is_clear pos_28_2) (is_clear pos_29_2) (is_clear pos_30_2)
    (is_clear pos_31_2) (is_clear pos_32_2) (is_clear pos_33_2) (is_clear pos_34_2) (is_clear pos_35_2) (is_clear pos_36_2) (is_clear pos_37_2) (is_clear pos_38_2) (is_clear pos_39_2) (is_clear pos_40_2)
    (is_clear pos_41_2) (is_clear pos_42_2) (is_clear pos_43_2) (is_clear pos_44_2) (is_clear pos_45_2) (is_clear pos_46_2)
    (is_clear pos_48_2) (is_clear pos_49_2) (is_clear pos_50_2)
    (is_clear pos_51_2) (is_clear pos_52_2) (is_clear pos_53_2) (is_clear pos_54_2) (is_clear pos_55_2) (is_clear pos_56_2) (is_clear pos_57_2) (is_clear pos_58_2) (is_clear pos_59_2) (is_clear pos_60_2)
    (is_clear pos_61_2) (is_clear pos_62_2) (is_clear pos_63_2) (is_clear pos_64_2) (is_clear pos_65_2) (is_clear pos_66_2) (is_clear pos_67_2) (is_clear pos_68_2) (is_clear pos_69_2) (is_clear pos_70_2)
    (is_clear pos_71_2) (is_clear pos_72_2) (is_clear pos_73_2) (is_clear pos_74_2) (is_clear pos_75_2) (is_clear pos_76_2) (is_clear pos_77_2) (is_clear pos_78_2) (is_clear pos_79_2) (is_clear pos_80_2)
    (is_clear pos_81_2) (is_clear pos_82_2) (is_clear pos_83_2) (is_clear pos_84_2) (is_clear pos_85_2) (is_clear pos_86_2) (is_clear pos_87_2) (is_clear pos_88_2) (is_clear pos_89_2) (is_clear pos_90_2)
    (is_clear pos_91_2) (is_clear pos_92_2)
  )
  (:goal (at_box pos_2_2))
)