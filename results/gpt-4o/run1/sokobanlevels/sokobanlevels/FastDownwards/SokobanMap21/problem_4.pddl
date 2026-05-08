(define (problem sokoban_problem)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        l_0_0 l_0_1 l_0_2
        l_1_0 l_1_1 l_1_2
        l_2_0 l_2_1 l_2_2
        l_3_0 l_3_1 l_3_2
        l_4_0 l_4_1 l_4_2
        l_5_0 l_5_1 l_5_2
        l_6_0 l_6_1 l_6_2
        l_7_0 l_7_1 l_7_2
        l_8_0 l_8_1 l_8_2
        l_9_0 l_9_1 l_9_2
        l_10_0 l_10_1 l_10_2
        l_11_0 l_11_1 l_11_2
        l_12_0 l_12_1 l_12_2
        l_13_0 l_13_1 l_13_2
        l_14_0 l_14_1 l_14_2
        l_15_0 l_15_1 l_15_2
        l_16_0 l_16_1 l_16_2
        l_17_0 l_17_1 l_17_2
        l_18_0 l_18_1 l_18_2
        l_19_0 l_19_1 l_19_2
        l_20_0 l_20_1 l_20_2
        l_21_0 l_21_1 l_21_2
        l_22_0 l_22_1 l_22_2
        l_23_0 l_23_1 l_23_2
        l_24_0 l_24_1 l_24_2
        l_25_0 l_25_1 l_25_2
        l_26_0 l_26_1 l_26_2
        l_27_0 l_27_1 l_27_2
        l_28_0 l_28_1 l_28_2
        l_29_0 l_29_1 l_29_2
        l_30_0 l_30_1 l_30_2
        l_31_0 l_31_1 l_31_2
        l_32_0 l_32_1 l_32_2
        l_33_0 l_33_1 l_33_2
        l_34_0 l_34_1 l_34_2
        l_35_0 l_35_1 l_35_2
        l_36_0 l_36_1 l_36_2
        l_37_0 l_37_1 l_37_2
        l_38_0 l_38_1 l_38_2
        l_39_0 l_39_1 l_39_2
        l_40_0 l_40_1 l_40_2
        l_41_0 l_41_1 l_41_2
        l_42_0 l_42_1 l_42_2
        l_43_0 l_43_1 l_43_2
        l_44_0 l_44_1 l_44_2
        l_45_0 l_45_1 l_45_2
        l_46_0 l_46_1 l_46_2
        l_47_0 l_47_1 l_47_2
        l_48_0 l_48_1 l_48_2
        l_49_0 l_49_1 l_49_2
        l_50_0 l_50_1 l_50_2
        l_51_0 l_51_1 l_51_2
        l_52_0 l_52_1 l_52_2
        l_53_0 l_53_1 l_53_2
        l_54_0 l_54_1 l_54_2
        l_55_0 l_55_1 l_55_2
        l_56_0 l_56_1 l_56_2
        l_57_0 l_57_1 l_57_2
        l_58_0 l_58_1 l_58_2
        l_59_0 l_59_1 l_59_2
        l_60_0 l_60_1 l_60_2
        l_61_0 l_61_1 l_61_2
        l_62_0 l_62_1 l_62_2
        l_63_0 l_63_1 l_63_2
        l_64_0 l_64_1 l_64_2
        l_65_0 l_65_1 l_65_2
        l_66_0 l_66_1 l_66_2
        l_67_0 l_67_1 l_67_2
        l_68_0 l_68_1 l_68_2
        l_69_0 l_69_1 l_69_2
        l_70_0 l_70_1 l_70_2
        l_71_0 l_71_1 l_71_2
        l_72_0 l_72_1 l_72_2
        l_73_0 l_73_1 l_73_2
        l_74_0 l_74_1 l_74_2
        l_75_0 l_75_1 l_75_2
        l_76_0 l_76_1 l_76_2
        l_77_0 l_77_1 l_77_2
        l_78_0 l_78_1 l_78_2
        l_79_0 l_79_1 l_79_2
        l_80_0 l_80_1 l_80_2
        l_81_0 l_81_1 l_81_2
        l_82_0 l_82_1 l_82_2
    )
    (:init
        (at player_1 l_1_1)
        (box_at box_1 l_50_1)
        (goal l_82_1)
        (adjacent l_0_1 l_1_1) (adjacent l_1_1 l_0_1)
        (adjacent l_1_1 l_2_1) (adjacent l_2_1 l_1_1)
        (adjacent l_2_1 l_3_1) (adjacent l_3_1 l_2_1)
        (adjacent l_3_1 l_4_1) (adjacent l_4_1 l_3_1)
        (adjacent l_4_1 l_5_1) (adjacent l_5_1 l_4_1)
        (adjacent l_5_1 l_6_1) (adjacent l_6_1 l_5_1)
        (adjacent l_6_1 l_7_1) (adjacent l_7_1 l_6_1)
        (adjacent l_7_1 l_8_1) (adjacent l_8_1 l_7_1)
        (adjacent l_8_1 l_9_1) (adjacent l_9_1 l_8_1)
        (adjacent l_9_1 l_10_1) (adjacent l_10_1 l_9_1)
        (adjacent l_10_1 l_11_1) (adjacent l_11_1 l_10_1)
        (adjacent l_11_1 l_12_1) (adjacent l_12_1 l_11_1)
        (adjacent l_12_1 l_13_1) (adjacent l_13_1 l_12_1)
        (adjacent l_13_1 l_14_1) (adjacent l_14_1 l_13_1)
        (adjacent l_14_1 l_15_1) (adjacent l_15_1 l_14_1)
        (adjacent l_15_1 l_16_1) (adjacent l_16_1 l_15_1)
        (adjacent l_16_1 l_17_1) (adjacent l_17_1 l_16_1)
        (adjacent l_17_1 l_18_1) (adjacent l_18_1 l_17_1)
        (adjacent l_18_1 l_19_1) (adjacent l_19_1 l_18_1)
        (adjacent l_19_1 l_20_1) (adjacent l_20_1 l_19_1)
        (adjacent l_20_1 l_21_1) (adjacent l_21_1 l_20_1)
        (adjacent l_21_1 l_22_1) (adjacent l_22_1 l_21_1)
        (adjacent l_22_1 l_23_1) (adjacent l_23_1 l_22_1)
        (adjacent l_23_1 l_24_1) (adjacent l_24_1 l_23_1)
        (adjacent l_24_1 l_25_1) (adjacent l_25_1 l_24_1)
        (adjacent l_25_1 l_26_1) (adjacent l_26_1 l_25_1)
        (adjacent l_26_1 l_27_1) (adjacent l_27_1 l_26_1)
        (adjacent l_27_1 l_28_1) (adjacent l_28_1 l_27_1)
        (adjacent l_28_1 l_29_1) (adjacent l_29_1 l_28_1)
        (adjacent l_29_1 l_30_1) (adjacent l_30_1 l_29_1)
        (adjacent l_30_1 l_31_1) (adjacent l_31_1 l_30_1)
        (adjacent l_31_1 l_32_1) (adjacent l_32_1 l_31_1)
        (adjacent l_32_1 l_33_1) (adjacent l_33_1 l_32_1)
        (adjacent l_33_1 l_34_1) (adjacent l_34_1 l_33_1)
        (adjacent l_34_1 l_35_1) (adjacent l_35_1 l_34_1)
        (adjacent l_35_1 l_36_1) (adjacent l_36_1 l_35_1)
        (adjacent l_36_1 l_37_1) (adjacent l_37_1 l_36_1)
        (adjacent l_37_1 l_38_1) (adjacent l_38_1 l_37_1)
        (adjacent l_38_1 l_39_1) (adjacent l_39_1 l_38_1)
        (adjacent l_39_1 l_40_1) (adjacent l_40_1 l_39_1)
        (adjacent l_40_1 l_41_1) (adjacent l_41_1 l_40_1)
        (adjacent l_41_1 l_42_1) (adjacent l_42_1 l_41_1)
        (adjacent l_42_1 l_43_1) (adjacent l_43_1 l_42_1)
        (adjacent l_43_1 l_44_1) (adjacent l_44_1 l_43_1)
        (adjacent l_44_1 l_45_1) (adjacent l_45_1 l_44_1)
        (adjacent l_45_1 l_46_1) (adjacent l_46_1 l_45_1)
        (adjacent l_46_1 l_47_1) (adjacent l_47_1 l_46_1)
        (adjacent l_47_1 l_48_1) (adjacent l_48_1 l_47_1)
        (adjacent l_48_1 l_49_1) (adjacent l_49_1 l_48_1)
        (adjacent l_49_1 l_50_1) (adjacent l_50_1 l_49_1)
        (adjacent l_50_1 l_51_1) (adjacent l_51_1 l_50_1)
        (adjacent l_51_1 l_52_1) (adjacent l_52_1 l_51_1)
        (adjacent l_52_1 l_53_1) (adjacent l_53_1 l_52_1)
        (adjacent l_53_1 l_54_1) (adjacent l_54_1 l_53_1)
        (adjacent l_54_1 l_55_1) (adjacent l_55_1 l_54_1)
        (adjacent l_55_1 l_56_1) (adjacent l_56_1 l_55_1)
        (adjacent l_56_1 l_57_1) (adjacent l_57_1 l_56_1)
        (adjacent l_57_1 l_58_1) (adjacent l_58_1 l_57_1)
        (adjacent l_58_1 l_59_1) (adjacent l_59_1 l_58_1)
        (adjacent l_59_1 l_60_1) (adjacent l_60_1 l_59_1)
        (adjacent l_60_1 l_61_1) (adjacent l_61_1 l_60_1)
        (adjacent l_61_1 l_62_1) (adjacent l_62_1 l_61_1)
        (adjacent l_62_1 l_63_1) (adjacent l_63_1 l_62_1)
        (adjacent l_63_1 l_64_1) (adjacent l_64_1 l_63_1)
        (adjacent l_64_1 l_65_1) (adjacent l_65_1 l_64_1)
        (adjacent l_65_1 l_66_1) (adjacent l_66_1 l_65_1)
        (adjacent l_66_1 l_67_1) (adjacent l_67_1 l_66_1)
        (adjacent l_67_1 l_68_1) (adjacent l_68_1 l_67_1)
        (adjacent l_68_1 l_69_1) (adjacent l_69_1 l_68_1)
        (adjacent l_69_1 l_70_1) (adjacent l_70_1 l_69_1)
        (adjacent l_70_1 l_71_1) (adjacent l_71_1 l_70_1)
        (adjacent l_71_1 l_72_1) (adjacent l_72_1 l_71_1)
        (adjacent l_72_1 l_73_1) (adjacent l_73_1 l_72_1)
        (adjacent l_73_1 l_74_1) (adjacent l_74_1 l_73_1)
        (adjacent l_74_1 l_75_1) (adjacent l_75_1 l_74_1)
        (adjacent l_75_1 l_76_1) (adjacent l_76_1 l_75_1)
        (adjacent l_76_1 l_77_1) (adjacent l_77_1 l_76_1)
        (adjacent l_77_1 l_78_1) (adjacent l_78_1 l_77_1)
        (adjacent l_78_1 l_79_1) (adjacent l_79_1 l_78_1)
        (adjacent l_79_1 l_80_1) (adjacent l_80_1 l_79_1)
        (adjacent l_80_1 l_81_1) (adjacent l_81_1 l_80_1)
        (adjacent l_81_1 l_82_1) (adjacent l_82_1 l_81_1)
        (clear l_0_0) (clear l_0_2)
        ...
        (clear l_81_0) (clear l_81_2)
        (clear l_82_0) (clear l_82_2)
    )
    (:goal (and
        (box_at box_1 l_82_1)
    ))
)