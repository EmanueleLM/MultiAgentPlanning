(define (problem sokoban-instance)
    (:domain sokoban)

    (:objects
        player1 - player
        box1 - box
        square_1_1 square_1_2 square_1_3 
        square_2_1 square_2_2 square_2_3 
        square_3_1 square_3_2 square_3_3 
        square_4_1 square_4_2 square_4_3 
        square_5_1 square_5_2 square_5_3 
        square_6_1 square_6_2 square_6_3 
        square_7_1 square_7_2 square_7_3 
        square_8_1 square_8_2 square_8_3 
        square_9_1 square_9_2 square_9_3 
        square_10_1 square_10_2 square_10_3 
        square_11_1 square_11_2 square_11_3 
        square_12_1 square_12_2 square_12_3 
        square_13_1 square_13_2 square_13_3 
        square_14_1 square_14_2 square_14_3 
        square_15_1 square_15_2 square_15_3 
        square_16_1 square_16_2 square_16_3 
        square_17_1 square_17_2 square_17_3 
        square_18_1 square_18_2 square_18_3 
        square_19_1 square_19_2 square_19_3 
        square_20_1 square_20_2 square_20_3 
        square_21_1 square_21_2 square_21_3 
        square_22_1 square_22_2 square_22_3 
        square_23_1 square_23_2 square_23_3 
        square_24_1 square_24_2 square_24_3 
        square_25_1 square_25_2 square_25_3 
        square_26_1 square_26_2 square_26_3 
        square_27_1 square_27_2 square_27_3 
        square_28_1 square_28_2 square_28_3 
        square_29_1 square_29_2 square_29_3 
        square_30_1 square_30_2 square_30_3 
        square_31_1 square_31_2 square_31_3 
        square_32_1 square_32_2 square_32_3 
        square_33_1 square_33_2 square_33_3 
        square_34_1 square_34_2 square_34_3 
        square_35_1 square_35_2 square_35_3 
        square_36_1 square_36_2 square_36_3 
        square_37_1 square_37_2 square_37_3 
        square_38_1 square_38_2 square_38_3 
        square_39_1 square_39_2 square_39_3 
        square_40_1 square_40_2 square_40_3 
        square_41_1 square_41_2 square_41_3 
        square_42_1 square_42_2 square_42_3 
        square_43_1 square_43_2 square_43_3 
        square_44_1 square_44_2 square_44_3 
        square_45_1 square_45_2 square_45_3 
        square_46_1 square_46_2 square_46_3 
        square_47_1 square_47_2 square_47_3 
        square_48_1 square_48_2 square_48_3 
        square_49_1 square_49_2 square_49_3 
        square_50_1 square_50_2 square_50_3 
        square_51_1 square_51_2 square_51_3 
        square_52_1 square_52_2 square_52_3 
        square_53_1 square_53_2 square_53_3 
        square_54_1 square_54_2 square_54_3 
        square_55_1 square_55_2 square_55_3 
        square_56_1 square_56_2 square_56_3 
        square_57_1 square_57_2 square_57_3 
        square_58_1 square_58_2 square_58_3 
        square_59_1 square_59_2 square_59_3 
        square_60_1 square_60_2 square_60_3 
        square_61_1 square_61_2 square_61_3 
        square_62_1 square_62_2 square_62_3 
        square_63_1 square_63_2 square_63_3 
        square_64_1 square_64_2 square_64_3 
        square_65_1 square_65_2 square_65_3 
        square_66_1 square_66_2 square_66_3 
        square_67_1 square_67_2 square_67_3 
        square_68_1 square_68_2 square_68_3 
        square_69_1 square_69_2 square_69_3 
        square_70_1 square_70_2 square_70_3 
        square_71_1 square_71_2 square_71_3 
        square_72_1 square_72_2 square_72_3 
        square_73_1 square_73_2 square_73_3 
        square_74_1 square_74_2 square_74_3 
        square_75_1 square_75_2 square_75_3 
        square_76_1 square_76_2 square_76_3 
        square_77_1 square_77_2 square_77_3 
        square_78_1 square_78_2 square_78_3 
        square_79_1 square_79_2 square_79_3 
        square_80_1 square_80_2 square_80_3 
        square_81_1 square_81_2 square_81_3 
        square_82_1 square_82_2 square_82_3 
        square_83_1 square_83_2 square_83_3 
        square_84_1 square_84_2 square_84_3 
        square_85_1 square_85_2 square_85_3 
        square_86_1 square_86_2 square_86_3 
        square_87_1 square_87_2 square_87_3 
        square_88_1 square_88_2 square_88_3 
        square_89_1 square_89_2 square_89_3 
        square_90_1 square_90_2 square_90_3 
        square_91_1 square_91_2 square_91_3 
        square_92_1 square_92_2 square_92_3 
        square_93_1 square_93_2 square_93_3 
        square_94_1 square_94_2 square_94_3 
        square_95_1 square_95_2 square_95_3 
        square_96_1 square_96_2 square_96_3 
        square_97_1 square_97_2 square_97_3 
        square_98_1 square_98_2 square_98_3 
        square_99_1 square_99_2 square_99_3 
    )

    (:init
        (at player1 square_99_2)
        (box_at box1 square_48_2)
        (goal square_1_2)

        (wall square_1_1) (wall square_1_3) 
        (wall square_2_1) (wall square_2_3) 
        (wall square_3_1) (wall square_3_3) 
        (wall square_4_1) (wall square_4_3) 
        (wall square_5_1) (wall square_5_3) 
        (wall square_6_1) (wall square_6_3) 
        (wall square_7_1) (wall square_7_3) 
        (wall square_8_1) (wall square_8_3) 
        (wall square_9_1) (wall square_9_3) 
        (wall square_10_1) (wall square_10_3) 
        (wall square_11_1) (wall square_11_3) 
        (wall square_12_1) (wall square_12_3) 
        (wall square_13_1) (wall square_13_3) 
        (wall square_14_1) (wall square_14_3) 
        (wall square_15_1) (wall square_15_3) 
        (wall square_16_1) (wall square_16_3) 
        (wall square_17_1) (wall square_17_3) 
        (wall square_18_1) (wall square_18_3) 
        (wall square_19_1) (wall square_19_3) 
        (wall square_20_1) (wall square_20_3) 
        (wall square_21_1) (wall square_21_3) 
        (wall square_22_1) (wall square_22_3) 
        (wall square_23_1) (wall square_23_3) 
        (wall square_24_1) (wall square_24_3) 
        (wall square_25_1) (wall square_25_3) 
        (wall square_26_1) (wall square_26_3) 
        (wall square_27_1) (wall square_27_3) 
        (wall square_28_1) (wall square_28_3) 
        (wall square_29_1) (wall square_29_3) 
        (wall square_30_1) (wall square_30_3) 
        (wall square_31_1) (wall square_31_3) 
        (wall square_32_1) (wall square_32_3) 
        (wall square_33_1) (wall square_33_3) 
        (wall square_34_1) (wall square_34_3) 
        (wall square_35_1) (wall square_35_3) 
        (wall square_36_1) (wall square_36_3) 
        (wall square_37_1) (wall square_37_3) 
        (wall square_38_1) (wall square_38_3) 
        (wall square_39_1) (wall square_39_3) 
        (wall square_40_1) (wall square_40_3) 
        (wall square_41_1) (wall square_41_3) 
        (wall square_42_1) (wall square_42_3) 
        (wall square_43_1) (wall square_43_3) 
        (wall square_44_1) (wall square_44_3) 
        (wall square_45_1) (wall square_45_3) 
        (wall square_46_1) (wall square_46_3) 
        (wall square_47_1) (wall square_47_3) 
        (wall square_48_1) (wall square_48_3) 
        (wall square_49_1) (wall square_49_3) 
        (wall square_50_1) (wall square_50_3) 
        (wall square_51_1) (wall square_51_3) 
        (wall square_52_1) (wall square_52_3) 
        (wall square_53_1) (wall square_53_3) 
        (wall square_54_1) (wall square_54_3) 
        (wall square_55_1) (wall square_55_3) 
        (wall square_56_1) (wall square_56_3) 
        (wall square_57_1) (wall square_57_3) 
        (wall square_58_1) (wall square_58_3) 
        (wall square_59_1) (wall square_59_3) 
        (wall square_60_1) (wall square_60_3) 
        (wall square_61_1) (wall square_61_3) 
        (wall square_62_1) (wall square_62_3) 
        (wall square_63_1) (wall square_63_3) 
        (wall square_64_1) (wall square_64_3) 
        (wall square_65_1) (wall square_65_3) 
        (wall square_66_1) (wall square_66_3) 
        (wall square_67_1) (wall square_67_3) 
        (wall square_68_1) (wall square_68_3) 
        (wall square_69_1) (wall square_69_3) 
        (wall square_70_1) (wall square_70_3) 
        (wall square_71_1) (wall square_71_3) 
        (wall square_72_1) (wall square_72_3) 
        (wall square_73_1) (wall square_73_3) 
        (wall square_74_1) (wall square_74_3) 
        (wall square_75_1) (wall square_75_3) 
        (wall square_76_1) (wall square_76_3) 
        (wall square_77_1) (wall square_77_3) 
        (wall square_78_1) (wall square_78_3) 
        (wall square_79_1) (wall square_79_3) 
        (wall square_80_1) (wall square_80_3) 
        (wall square_81_1) (wall square_81_3) 
        (wall square_82_1) (wall square_82_3) 
        (wall square_83_1) (wall square_83_3) 
        (wall square_84_1) (wall square_84_3) 
        (wall square_85_1) (wall square_85_3) 
        (wall square_86_1) (wall square_86_3) 
        (wall square_87_1) (wall square_87_3) 
        (wall square_88_1) (wall square_88_3) 
        (wall square_89_1) (wall square_89_3) 
        (wall square_90_1) (wall square_90_3) 
        (wall square_91_1) (wall square_91_3) 
        (wall square_92_1) (wall square_92_3) 
        (wall square_93_1) (wall square_93_3) 
        (wall square_94_1) (wall square_94_3) 
        (wall square_95_1) (wall square_95_3) 
        (wall square_96_1) (wall square_96_3) 
        (wall square_97_1) (wall square_97_3) 
        (wall square_98_1) (wall square_98_3) 
        (wall square_99_1) (wall square_99_3) 

        (adjacent square_1_2 square_2_2) (adjacent square_2_2 square_1_2)
        ...
        (adjacent square_98_2 square_99_2) (adjacent square_99_2 square_98_2)

        (free square_1_2)
        (free square_2_2) 
        ...
        (free square_98_2)
    )

    (:goal
        (box_at box1 square_1_2)
    )
)