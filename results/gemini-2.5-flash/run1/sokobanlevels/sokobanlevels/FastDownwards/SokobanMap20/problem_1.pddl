(define (problem sokobanmap20-instance)
    (:domain sokobanmap20)
    (:objects
        player1 - agent
        box1 - box
        cell_0_0 cell_0_1 cell_0_2
        cell_1_0 cell_1_1 cell_1_2
        cell_2_0 cell_2_1 cell_2_2
        cell_3_0 cell_3_1 cell_3_2
        cell_4_0 cell_4_1 cell_4_2
        cell_5_0 cell_5_1 cell_5_2
        cell_6_0 cell_6_1 cell_6_2
        cell_7_0 cell_7_1 cell_7_2
        cell_8_0 cell_8_1 cell_8_2
        cell_9_0 cell_9_1 cell_9_2
        cell_10_0 cell_10_1 cell_10_2
        cell_11_0 cell_11_1 cell_11_2
        cell_12_0 cell_12_1 cell_12_2
        cell_13_0 cell_13_1 cell_13_2
        cell_14_0 cell_14_1 cell_14_2
        cell_15_0 cell_15_1 cell_15_2
        cell_16_0 cell_16_1 cell_16_2
        cell_17_0 cell_17_1 cell_17_2
        cell_18_0 cell_18_1 cell_18_2
        cell_19_0 cell_19_1 cell_19_2
        cell_20_0 cell_20_1 cell_20_2
        cell_21_0 cell_21_1 cell_21_2
        cell_22_0 cell_22_1 cell_22_2
        cell_23_0 cell_23_1 cell_23_2
        cell_24_0 cell_24_1 cell_24_2
        cell_25_0 cell_25_1 cell_25_2
        cell_26_0 cell_26_1 cell_26_2
        cell_27_0 cell_27_1 cell_27_2
        cell_28_0 cell_28_1 cell_28_2
        cell_29_0 cell_29_1 cell_29_2
        cell_30_0 cell_30_1 cell_30_2
        cell_31_0 cell_31_1 cell_31_2
        cell_32_0 cell_32_1 cell_32_2
        cell_33_0 cell_33_1 cell_33_2
        cell_34_0 cell_34_1 cell_34_2
        cell_35_0 cell_35_1 cell_35_2
        cell_36_0 cell_36_1 cell_36_2
        cell_37_0 cell_37_1 cell_37_2
        cell_38_0 cell_38_1 cell_38_2
        cell_39_0 cell_39_1 cell_39_2
        cell_40_0 cell_40_1 cell_40_2
        cell_41_0 cell_41_1 cell_41_2
        cell_42_0 cell_42_1 cell_42_2
        cell_43_0 cell_43_1 cell_43_2
        cell_44_0 cell_44_1 cell_44_2
        cell_45_0 cell_45_1 cell_45_2
        cell_46_0 cell_46_1 cell_46_2
        cell_47_0 cell_47_1 cell_47_2
        cell_48_0 cell_48_1 cell_48_2
        cell_49_0 cell_49_1 cell_49_2
        cell_50_0 cell_50_1 cell_50_2
        cell_51_0 cell_51_1 cell_51_2
        cell_52_0 cell_52_1 cell_52_2
        cell_53_0 cell_53_1 cell_53_2
        cell_54_0 cell_54_1 cell_54_2
        cell_55_0 cell_55_1 cell_55_2
        cell_56_0 cell_56_1 cell_56_2
        cell_57_0 cell_57_1 cell_57_2
        cell_58_0 cell_58_1 cell_58_2
        cell_59_0 cell_59_1 cell_59_2
        cell_60_0 cell_60_1 cell_60_2
        cell_61_0 cell_61_1 cell_61_2
        cell_62_0 cell_62_1 cell_62_2
        cell_63_0 cell_63_1 cell_63_2
        cell_64_0 cell_64_1 cell_64_2
        cell_65_0 cell_65_1 cell_65_2
        cell_66_0 cell_66_1 cell_66_2
        cell_67_0 cell_67_1 cell_67_2
        cell_68_0 cell_68_1 cell_68_2
        cell_69_0 cell_69_1 cell_69_2
        cell_70_0 cell_70_1 cell_70_2
        cell_71_0 cell_71_1 cell_71_2
        cell_72_0 cell_72_1 cell_72_2
        cell_73_0 cell_73_1 cell_73_2
        cell_74_0 cell_74_1 cell_74_2
        cell_75_0 cell_75_1 cell_75_2
        cell_76_0 cell_76_1 cell_76_2
        cell_77_0 cell_77_1 cell_77_2
        cell_78_0 cell_78_1 cell_78_2
        cell_79_0 cell_79_1 cell_79_2
        cell_80_0 cell_80_1 cell_80_2
        cell_81_0 cell_81_1 cell_81_2
        cell_82_0 cell_82_1 cell_82_2
        cell_83_0 cell_83_1 cell_83_2
        cell_84_0 cell_84_1 cell_84_2
        cell_85_0 cell_85_1 cell_85_2
        cell_86_0 cell_86_1 cell_86_2
        cell_87_0 cell_87_1 cell_87_2
        cell_88_0 cell_88_1 cell_88_2
        cell_89_0 cell_89_1 cell_89_2
        cell_90_0 cell_90_1 cell_90_2
        cell_91_0 cell_91_1 cell_91_2
        cell_92_0 cell_92_1 cell_92_2
        cell_93_0 cell_93_1 cell_93_2
        cell_94_0 cell_94_1 cell_94_2
        cell_95_0 cell_95_1 cell_95_2
        cell_96_0 cell_96_1 cell_96_2
        cell_97_0 cell_97_1 cell_97_2
        cell_98_0 cell_98_1 cell_98_2
        cell_99_0 cell_99_1 cell_99_2
        cell_100_0 cell_100_1 cell_100_2
        cell_101_0 cell_101_1 cell_101_2
    )
    (:init
        (at_player cell_100_1)
        (at_box box1 cell_50_1)
        (is_goal cell_1_1)

        ; Walls
        (wall cell_0_0) (wall cell_0_1) (wall cell_0_2)
        (wall cell_1_0) (wall cell_1_2)
        (wall cell_2_0) (wall cell_2_2)
        (wall cell_3_0) (wall cell_3_2)
        (wall cell_4_0) (wall cell_4_2)
        (wall cell_5_0) (wall cell_5_2)
        (wall cell_6_0) (wall cell_6_2)
        (wall cell_7_0) (wall cell_7_2)
        (wall cell_8_0) (wall cell_8_2)
        (wall cell_9_0) (wall cell_9_2)
        (wall cell_10_0) (wall cell_10_2)
        (wall cell_11_0) (wall cell_11_2)
        (wall cell_12_0) (wall cell_12_2)
        (wall cell_13_0) (wall cell_13_2)
        (wall cell_14_0) (wall cell_14_2)
        (wall cell_15_0) (wall cell_15_2)
        (wall cell_16_0) (wall cell_16_2)
        (wall cell_17_0) (wall cell_17_2)
        (wall cell_18_0) (wall cell_18_2)
        (wall cell_19_0) (wall cell_19_2)
        (wall cell_20_0) (wall cell_20_2)
        (wall cell_21_0) (wall cell_21_2)
        (wall cell_22_0) (wall cell_22_2)
        (wall cell_23_0) (wall cell_23_2)
        (wall cell_24_0) (wall cell_24_2)
        (wall cell_25_0) (wall cell_25_2)
        (wall cell_26_0) (wall cell_26_2)
        (wall cell_27_0) (wall cell_27_2)
        (wall cell_28_0) (wall cell_28_2)
        (wall cell_29_0) (wall cell_29_2)
        (wall cell_30_0) (wall cell_30_2)
        (wall cell_31_0) (wall cell_31_2)
        (wall cell_32_0) (wall cell_32_2)
        (wall cell_33_0) (wall cell_33_2)
        (wall cell_34_0) (wall cell_34_2)
        (wall cell_35_0) (wall cell_35_2)
        (wall cell_36_0) (wall cell_36_2)
        (wall cell_37_0) (wall cell_37_2)
        (wall cell_38_0) (wall cell_38_2)
        (wall cell_39_0) (wall cell_39_2)
        (wall cell_40_0) (wall cell_40_2)
        (wall cell_41_0) (wall cell_41_2)
        (wall cell_42_0) (wall cell_42_2)
        (wall cell_43_0) (wall cell_43_2)
        (wall cell_44_0) (wall cell_44_2)
        (wall cell_45_0) (wall cell_45_2)
        (wall cell_46_0) (wall cell_46_2)
        (wall cell_47_0) (wall cell_47_2)
        (wall cell_48_0) (wall cell_48_2)
        (wall cell_49_0) (wall cell_49_2)
        (wall cell_50_0) (wall cell_50_2)
        (wall cell_51_0) (wall cell_51_2)
        (wall cell_52_0) (wall cell_52_2)
        (wall cell_53_0) (wall cell_53_2)
        (wall cell_54_0) (wall cell_54_2)
        (wall cell_55_0) (wall cell_55_2)
        (wall cell_56_0) (wall cell_56_2)
        (wall cell_57_0) (wall cell_57_2)
        (wall cell_58_0) (wall cell_58_2)
        (wall cell_59_0) (wall cell_59_2)
        (wall cell_60_0) (wall cell_60_2)
        (wall cell_61_0) (wall cell_61_2)
        (wall cell_62_0) (wall cell_62_2)
        (wall cell_63_0) (wall cell_63_2)
        (wall cell_64_0) (wall cell_64_2)
        (wall cell_65_0) (wall cell_65_2)
        (wall cell_66_0) (wall cell_66_2)
        (wall cell_67_0) (wall cell_67_2)
        (wall cell_68_0) (wall cell_68_2)
        (wall cell_69_0) (wall cell_69_2)
        (wall cell_70_0) (wall cell_70_2)
        (wall cell_71_0) (wall cell_71_2)
        (wall cell_72_0) (wall cell_72_2)
        (wall cell_73_0) (wall cell_73_2)
        (wall cell_74_0) (wall cell_74_2)
        (wall cell_75_0) (wall cell_75_2)
        (wall cell_76_0) (wall cell_76_2)
        (wall cell_77_0) (wall cell_77_2)
        (wall cell_78_0) (wall cell_78_2)
        (wall cell_79_0) (wall cell_79_2)
        (wall cell_80_0) (wall cell_80_2)
        (wall cell_81_0) (wall cell_81_2)
        (wall cell_82_0) (wall cell_82_2)
        (wall cell_83_0) (wall cell_83_2)
        (wall cell_84_0) (wall cell_84_2)
        (wall cell_85_0) (wall cell_85_2)
        (wall cell_86_0) (wall cell_86_2)
        (wall cell_87_0) (wall cell_87_2)
        (wall cell_88_0) (wall cell_88_2)
        (wall cell_89_0) (wall cell_89_2)
        (wall cell_90_0) (wall cell_90_2)
        (wall cell_91_0) (wall cell_91_2)
        (wall cell_92_0) (wall cell_92_2)
        (wall cell_93_0) (wall cell_93_2)
        (wall cell_94_0) (wall cell_94_2)
        (wall cell_95_0) (wall cell_95_2)
        (wall cell_96_0) (wall cell_96_2)
        (wall cell_97_0) (wall cell_97_2)
        (wall cell_98_0) (wall cell_98_2)
        (wall cell_99_0) (wall cell_99_2)
        (wall cell_100_0) (wall cell_100_2)
        (wall cell_101_0) (wall cell_101_1) (wall cell_101_2)

        ; North connections (l2 is above l1)
        (north cell_1_1 cell_0_1) ; This is a wall, so player/box won't move there directly. But useful for definition
        (north cell_2_1 cell_1_1)
        (north cell_3_1 cell_2_1)
        (north cell_4_1 cell_3_1)
        (north cell_5_1 cell_4_1)
        (north cell_6_1 cell_5_1)
        (north cell_7_1 cell_6_1)
        (north cell_8_1 cell_7_1)
        (north cell_9_1 cell_8_1)
        (north cell_10_1 cell_9_1)
        (north cell_11_1 cell_10_1)
        (north cell_12_1 cell_11_1)
        (north cell_13_1 cell_12_1)
        (north cell_14_1 cell_13_1)
        (north cell_15_1 cell_14_1)
        (north cell_16_1 cell_15_1)
        (north cell_17_1 cell_16_1)
        (north cell_18_1 cell_17_1)
        (north cell_19_1 cell_18_1)
        (north cell_20_1 cell_19_1)
        (north cell_21_1 cell_20_1)
        (north cell_22_1 cell_21_1)
        (north cell_23_1 cell_22_1)
        (north cell_24_1 cell_23_1)
        (north cell_25_1 cell_24_1)
        (north cell_26_1 cell_25_1)
        (north cell_27_1 cell_26_1)
        (north cell_28_1 cell_27_1)
        (north cell_29_1 cell_28_1)
        (north cell_30_1 cell_29_1)
        (north cell_31_1 cell_30_1)
        (north cell_32_1 cell_31_1)
        (north cell_33_1 cell_32_1)
        (north cell_34_1 cell_33_1)
        (north cell_35_1 cell_34_1)
        (north cell_36_1 cell_35_1)
        (north cell_37_1 cell_36_1)
        (north cell_38_1 cell_37_1)
        (north cell_39_1 cell_38_1)
        (north cell_40_1 cell_39_1)
        (north cell_41_1 cell_40_1)
        (north cell_42_1 cell_41_1)
        (north cell_43_1 cell_42_1)
        (north cell_44_1 cell_43_1)
        (north cell_45_1 cell_44_1)
        (north cell_46_1 cell_45_1)
        (north cell_47_1 cell_46_1)
        (north cell_48_1 cell_47_1)
        (north cell_49_1 cell_48_1)
        (north cell_50_1 cell_49_1)
        (north cell_51_1 cell_50_1)
        (north cell_52_1 cell_51_1)
        (north cell_53_1 cell_52_1)
        (north cell_54_1 cell_53_1)
        (north cell_55_1 cell_54_1)
        (north cell_56_1 cell_55_1)
        (north cell_57_1 cell_56_1)
        (north cell_58_1 cell_57_1)
        (north cell_59_1 cell_58_1)
        (north cell_60_1 cell_59_1)
        (north cell_61_1 cell_60_1)
        (north cell_62_1 cell_61_1)
        (north cell_63_1 cell_62_1)
        (north cell_64_1 cell_63_1)
        (north cell_65_1 cell_64_1)
        (north cell_66_1 cell_65_1)
        (north cell_67_1 cell_66_1)
        (north cell_68_1 cell_67_1)
        (north cell_69_1 cell_68_1)
        (north cell_70_1 cell_69_1)
        (north cell_71_1 cell_70_1)
        (north cell_72_1 cell_71_1)
        (north cell_73_1 cell_72_1)
        (north cell_74_1 cell_73_1)
        (north cell_75_1 cell_74_1)
        (north cell_76_1 cell_75_1)
        (north cell_77_1 cell_76_1)
        (north cell_78_1 cell_77_1)
        (north cell_79_1 cell_78_1)
        (north cell_80_1 cell_79_1)
        (north cell_81_1 cell_80_1)
        (north cell_82_1 cell_81_1)
        (north cell_83_1 cell_82_1)
        (north cell_84_1 cell_83_1)
        (north cell_85_1 cell_84_1)
        (north cell_86_1 cell_85_1)
        (north cell_87_1 cell_86_1)
        (north cell_88_1 cell_87_1)
        (north cell_89_1 cell_88_1)
        (north cell_90_1 cell_89_1)
        (north cell_91_1 cell_90_1)
        (north cell_92_1 cell_91_1)
        (north cell_93_1 cell_92_1)
        (north cell_94_1 cell_93_1)
        (north cell_95_1 cell_94_1)
        (north cell_96_1 cell_95_1)
        (north cell_97_1 cell_96_1)
        (north cell_98_1 cell_97_1)
        (north cell_99_1 cell_98_1)
        (north cell_100_1 cell_99_1)

        ; South connections (l2 is below l1)
        (south cell_1_1 cell_2_1)
        (south cell_2_1 cell_3_1)
        (south cell_3_1 cell_4_1)
        (south cell_4_1 cell_5_1)
        (south cell_5_1 cell_6_1)
        (south cell_6_1 cell_7_1)
        (south cell_7_1 cell_8_1)
        (south cell_8_1 cell_9_1)
        (south cell_9_1 cell_10_1)
        (south cell_10_1 cell_11_1)
        (south cell_11_1 cell_12_1)
        (south cell_12_1 cell_13_1)
        (south cell_13_1 cell_14_1)
        (south cell_14_1 cell_15_1)
        (south cell_15_1 cell_16_1)
        (south cell_16_1 cell_17_1)
        (south cell_17_1 cell_18_1)
        (south cell_18_1 cell_19_1)
        (south cell_19_1 cell_20_1)
        (south cell_20_1 cell_21_1)
        (south cell_21_1 cell_22_1)
        (south cell_22_1 cell_23_1)
        (south cell_23_1 cell_24_1)
        (south cell_24_1 cell_25_1)
        (south cell_25_1 cell_26_1)
        (south cell_26_1 cell_27_1)
        (south cell_27_1 cell_28_1)
        (south cell_28_1 cell_29_1)
        (south cell_29_1 cell_30_1)
        (south cell_30_1 cell_31_1)
        (south cell_31_1 cell_32_1)
        (south cell_32_1 cell_33_1)
        (south cell_33_1 cell_34_1)
        (south cell_34_1 cell_35_1)
        (south cell_35_1 cell_36_1)
        (south cell_36_1 cell_37_1)
        (south cell_37_1 cell_38_1)
        (south cell_38_1 cell_39_1)
        (south cell_39_1 cell_40_1)
        (south cell_40_1 cell_41_1)
        (south cell_41_1 cell_42_1)
        (south cell_42_1 cell_43_1)
        (south cell_43_1 cell_44_1)
        (south cell_44_1 cell_45_1)
        (south cell_45_1 cell_46_1)
        (south cell_46_1 cell_47_1)
        (south cell_47_1 cell_48_1)
        (south cell_48_1 cell_49_1)
        (south cell_49_1 cell_50_1)
        (south cell_50_1 cell_51_1)
        (south cell_51_1 cell_52_1)
        (south cell_52_1 cell_53_1)
        (south cell_53_1 cell_54_1)
        (south cell_54_1 cell_55_1)
        (south cell_55_1 cell_56_1)
        (south cell_56_1 cell_57_1)
        (south cell_57_1 cell_58_1)
        (south cell_58_1 cell_59_1)
        (south cell_59_1 cell_60_1)
        (south cell_60_1 cell_61_1)
        (south cell_61_1 cell_62_1)
        (south cell_62_1 cell_63_1)
        (south cell_63_1 cell_64_1)
        (south cell_64_1 cell_65_1)
        (south cell_65_1 cell_66_1)
        (south cell_66_1 cell_67_1)
        (south cell_67_1 cell_68_1)
        (south cell_68_1 cell_69_1)
        (south cell_69_1 cell_70_1)
        (south cell_70_1 cell_71_1)
        (south cell_71_1 cell_72_1)
        (south cell_72_1 cell_73_1)
        (south cell_73_1 cell_74_1)
        (south cell_74_1 cell_75_1)
        (south cell_75_1 cell_76_1)
        (south cell_76_1 cell_77_1)
        (south cell_77_1 cell_78_1)
        (south cell_78_1 cell_79_1)
        (south cell_79_1 cell_80_1)
        (south cell_80_1 cell_81_1)
        (south cell_81_1 cell_82_1)
        (south cell_82_1 cell_83_1)
        (south cell_83_1 cell_84_1)
        (south cell_84_1 cell_85_1)
        (south cell_85_1 cell_86_1)
        (south cell_86_1 cell_87_1)
        (south cell_87_1 cell_88_1)
        (south cell_88_1 cell_89_1)
        (south cell_89_1 cell_90_1)
        (south cell_90_1 cell_91_1)
        (south cell_91_1 cell_92_1)
        (south cell_92_1 cell_93_1)
        (south cell_93_1 cell_94_1)
        (south cell_94_1 cell_95_1)
        (south cell_95_1 cell_96_1)
        (south cell_96_1 cell_97_1)
        (south cell_97_1 cell_98_1)
        (south cell_98_1 cell_99_1)
        (south cell_99_1 cell_100_1)
        (south cell_100_1 cell_101_1) ; This is a wall, so player/box won't move there directly.
    )
    (:goal (and
        (at_box box1 cell_1_1)
    ))
)