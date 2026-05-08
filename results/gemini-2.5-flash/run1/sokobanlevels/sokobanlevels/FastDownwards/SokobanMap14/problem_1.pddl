(define (problem sokobanmap14)
  (:domain sokoban)
  (:objects
    agent_0 - agent
    box_0 - box
    loc_0_0 loc_0_1 loc_0_2
    loc_1_0 loc_1_1 loc_1_2
    loc_2_0 loc_2_1 loc_2_2
    loc_3_0 loc_3_1 loc_3_2
    loc_4_0 loc_4_1 loc_4_2
    loc_5_0 loc_5_1 loc_5_2
    loc_6_0 loc_6_1 loc_6_2
    loc_7_0 loc_7_1 loc_7_2
    loc_8_0 loc_8_1 loc_8_2
    loc_9_0 loc_9_1 loc_9_2
    loc_10_0 loc_10_1 loc_10_2
    loc_11_0 loc_11_1 loc_11_2
    loc_12_0 loc_12_1 loc_12_2
    loc_13_0 loc_13_1 loc_13_2
    loc_14_0 loc_14_1 loc_14_2
    loc_15_0 loc_15_1 loc_15_2
    loc_16_0 loc_16_1 loc_16_2
    loc_17_0 loc_17_1 loc_17_2
    loc_18_0 loc_18_1 loc_18_2
    loc_19_0 loc_19_1 loc_19_2
    loc_20_0 loc_20_1 loc_20_2
    loc_21_0 loc_21_1 loc_21_2
    loc_22_0 loc_22_1 loc_22_2
    loc_23_0 loc_23_1 loc_23_2
    loc_24_0 loc_24_1 loc_24_2
    loc_25_0 loc_25_1 loc_25_2
    loc_26_0 loc_26_1 loc_26_2
    loc_27_0 loc_27_1 loc_27_2
    loc_28_0 loc_28_1 loc_28_2
    loc_29_0 loc_29_1 loc_29_2
    loc_30_0 loc_30_1 loc_30_2
    loc_31_0 loc_31_1 loc_31_2
    loc_32_0 loc_32_1 loc_32_2
    loc_33_0 loc_33_1 loc_33_2
    loc_34_0 loc_34_1 loc_34_2
    loc_35_0 loc_35_1 loc_35_2
    loc_36_0 loc_36_1 loc_36_2
    loc_37_0 loc_37_1 loc_37_2
    loc_38_0 loc_38_1 loc_38_2
    loc_39_0 loc_39_1 loc_39_2
    loc_40_0 loc_40_1 loc_40_2
    loc_41_0 loc_41_1 loc_41_2
    loc_42_0 loc_42_1 loc_42_2
    loc_43_0 loc_43_1 loc_43_2
    loc_44_0 loc_44_1 loc_44_2
    loc_45_0 loc_45_1 loc_45_2
    loc_46_0 loc_46_1 loc_46_2
    loc_47_0 loc_47_1 loc_47_2
    loc_48_0 loc_48_1 loc_48_2
    loc_49_0 loc_49_1 loc_49_2
    loc_50_0 loc_50_1 loc_50_2
    loc_51_0 loc_51_1 loc_51_2
    loc_52_0 loc_52_1 loc_52_2
    loc_53_0 loc_53_1 loc_53_2
    loc_54_0 loc_54_1 loc_54_2
    loc_55_0 loc_55_1 loc_55_2
    loc_56_0 loc_56_1 loc_56_2
    loc_57_0 loc_57_1 loc_57_2
    loc_58_0 loc_58_1 loc_58_2
    loc_59_0 loc_59_1 loc_59_2
    loc_60_0 loc_60_1 loc_60_2
    loc_61_0 loc_61_1 loc_61_2
    loc_62_0 loc_62_1 loc_62_2
    loc_63_0 loc_63_1 loc_63_2
    loc_64_0 loc_64_1 loc_64_2
    loc_65_0 loc_65_1 loc_65_2
    loc_66_0 loc_66_1 loc_66_2
    loc_67_0 loc_67_1 loc_67_2
    loc_68_0 loc_68_1 loc_68_2
    loc_69_0 loc_69_1 loc_69_2
    loc_70_0 loc_70_1 loc_70_2
    loc_71_0 loc_71_1 loc_71_2
    loc_72_0 loc_72_1 loc_72_2
    loc_73_0 loc_73_1 loc_73_2
    loc_74_0 loc_74_1 loc_74_2
    loc_75_0 loc_75_1 loc_75_2
    loc_76_0 loc_76_1 loc_76_2
    loc_77_0 loc_77_1 loc_77_2
    loc_78_0 loc_78_1 loc_78_2
    loc_79_0 loc_79_1 loc_79_2
    loc_80_0 loc_80_1 loc_80_2
    loc_81_0 loc_81_1 loc_81_2
    loc_82_0 loc_82_1 loc_82_2
    loc_83_0 loc_83_1 loc_83_2
    loc_84_0 loc_84_1 loc_84_2
    loc_85_0 loc_85_1 loc_85_2
    loc_86_0 loc_86_1 loc_86_2
    loc_87_0 loc_87_1 loc_87_2
    loc_88_0 loc_88_1 loc_88_2
    loc_89_0 loc_89_1 loc_89_2
    loc_90_0 loc_90_1 loc_90_2
    loc_91_0 loc_91_1 loc_91_2
    loc_92_0 loc_92_1 loc_92_2
    loc_93_0 loc_93_1 loc_93_2
    loc_94_0 loc_94_1 loc_94_2
    loc_95_0 loc_95_1 loc_95_2
    loc_96_0 loc_96_1 loc_96_2
  )
  (:init
    (at_agent agent_0 loc_95_1)
    (at_box box_0 loc_48_1)
    (is_goal loc_1_1)

    ; Walls for all columns 0 and 2
    (is_wall loc_0_0) (is_wall loc_0_2)
    (is_wall loc_1_0) (is_wall loc_1_2)
    (is_wall loc_2_0) (is_wall loc_2_2)
    (is_wall loc_3_0) (is_wall loc_3_2)
    (is_wall loc_4_0) (is_wall loc_4_2)
    (is_wall loc_5_0) (is_wall loc_5_2)
    (is_wall loc_6_0) (is_wall loc_6_2)
    (is_wall loc_7_0) (is_wall loc_7_2)
    (is_wall loc_8_0) (is_wall loc_8_2)
    (is_wall loc_9_0) (is_wall loc_9_2)
    (is_wall loc_10_0) (is_wall loc_10_2)
    (is_wall loc_11_0) (is_wall loc_11_2)
    (is_wall loc_12_0) (is_wall loc_12_2)
    (is_wall loc_13_0) (is_wall loc_13_2)
    (is_wall loc_14_0) (is_wall loc_14_2)
    (is_wall loc_15_0) (is_wall loc_15_2)
    (is_wall loc_16_0) (is_wall loc_16_2)
    (is_wall loc_17_0) (is_wall loc_17_2)
    (is_wall loc_18_0) (is_wall loc_18_2)
    (is_wall loc_19_0) (is_wall loc_19_2)
    (is_wall loc_20_0) (is_wall loc_20_2)
    (is_wall loc_21_0) (is_wall loc_21_2)
    (is_wall loc_22_0) (is_wall loc_22_2)
    (is_wall loc_23_0) (is_wall loc_23_2)
    (is_wall loc_24_0) (is_wall loc_24_2)
    (is_wall loc_25_0) (is_wall loc_25_2)
    (is_wall loc_26_0) (is_wall loc_26_2)
    (is_wall loc_27_0) (is_wall loc_27_2)
    (is_wall loc_28_0) (is_wall loc_28_2)
    (is_wall loc_29_0) (is_wall loc_29_2)
    (is_wall loc_30_0) (is_wall loc_30_2)
    (is_wall loc_31_0) (is_wall loc_31_2)
    (is_wall loc_32_0) (is_wall loc_32_2)
    (is_wall loc_33_0) (is_wall loc_33_2)
    (is_wall loc_34_0) (is_wall loc_34_2)
    (is_wall loc_35_0) (is_wall loc_35_2)
    (is_wall loc_36_0) (is_wall loc_36_2)
    (is_wall loc_37_0) (is_wall loc_37_2)
    (is_wall loc_38_0) (is_wall loc_38_2)
    (is_wall loc_39_0) (is_wall loc_39_2)
    (is_wall loc_40_0) (is_wall loc_40_2)
    (is_wall loc_41_0) (is_wall loc_41_2)
    (is_wall loc_42_0) (is_wall loc_42_2)
    (is_wall loc_43_0) (is_wall loc_43_2)
    (is_wall loc_44_0) (is_wall loc_44_2)
    (is_wall loc_45_0) (is_wall loc_45_2)
    (is_wall loc_46_0) (is_wall loc_46_2)
    (is_wall loc_47_0) (is_wall loc_47_2)
    (is_wall loc_48_0) (is_wall loc_48_2)
    (is_wall loc_49_0) (is_wall loc_49_2)
    (is_wall loc_50_0) (is_wall loc_50_2)
    (is_wall loc_51_0) (is_wall loc_51_2)
    (is_wall loc_52_0) (is_wall loc_52_2)
    (is_wall loc_53_0) (is_wall loc_53_2)
    (is_wall loc_54_0) (is_wall loc_54_2)
    (is_wall loc_55_0) (is_wall loc_55_2)
    (is_wall loc_56_0) (is_wall loc_56_2)
    (is_wall loc_57_0) (is_wall loc_57_2)
    (is_wall loc_58_0) (is_wall loc_58_2)
    (is_wall loc_59_0) (is_wall loc_59_2)
    (is_wall loc_60_0) (is_wall loc_60_2)
    (is_wall loc_61_0) (is_wall loc_61_2)
    (is_wall loc_62_0) (is_wall loc_62_2)
    (is_wall loc_63_0) (is_wall loc_63_2)
    (is_wall loc_64_0) (is_wall loc_64_2)
    (is_wall loc_65_0) (is_wall loc_65_2)
    (is_wall loc_66_0) (is_wall loc_66_2)
    (is_wall loc_67_0) (is_wall loc_67_2)
    (is_wall loc_68_0) (is_wall loc_68_2)
    (is_wall loc_69_0) (is_wall loc_69_2)
    (is_wall loc_70_0) (is_wall loc_70_2)
    (is_wall loc_71_0) (is_wall loc_71_2)
    (is_wall loc_72_0) (is_wall loc_72_2)
    (is_wall loc_73_0) (is_wall loc_73_2)
    (is_wall loc_74_0) (is_wall loc_74_2)
    (is_wall loc_75_0) (is_wall loc_75_2)
    (is_wall loc_76_0) (is_wall loc_76_2)
    (is_wall loc_77_0) (is_wall loc_77_2)
    (is_wall loc_78_0) (is_wall loc_78_2)
    (is_wall loc_79_0) (is_wall loc_79_2)
    (is_wall loc_80_0) (is_wall loc_80_2)
    (is_wall loc_81_0) (is_wall loc_81_2)
    (is_wall loc_82_0) (is_wall loc_82_2)
    (is_wall loc_83_0) (is_wall loc_83_2)
    (is_wall loc_84_0) (is_wall loc_84_2)
    (is_wall loc_85_0) (is_wall loc_85_2)
    (is_wall loc_86_0) (is_wall loc_86_2)
    (is_wall loc_87_0) (is_wall loc_87_2)
    (is_wall loc_88_0) (is_wall loc_88_2)
    (is_wall loc_89_0) (is_wall loc_89_2)
    (is_wall loc_90_0) (is_wall loc_90_2)
    (is_wall loc_91_0) (is_wall loc_91_2)
    (is_wall loc_92_0) (is_wall loc_92_2)
    (is_wall loc_93_0) (is_wall loc_93_2)
    (is_wall loc_94_0) (is_wall loc_94_2)
    (is_wall loc_95_0) (is_wall loc_95_2)
    (is_wall loc_96_0) (is_wall loc_96_2)

    ; Walls for top and bottom of middle column
    (is_wall loc_0_1)
    (is_wall loc_96_1)

    ; Adjacency predicates for column 1
    (adj_up loc_1_1 loc_0_1) ; This is a wall, so not traversable, but defines relation
    (adj_down loc_0_1 loc_1_1)

    (adj_up loc_2_1 loc_1_1)
    (adj_down loc_1_1 loc_2_1)
    (adj_up loc_3_1 loc_2_1)
    (adj_down loc_2_1 loc_3_1)
    (adj_up loc_4_1 loc_3_1)
    (adj_down loc_3_1 loc_4_1)
    (adj_up loc_5_1 loc_4_1)
    (adj_down loc_4_1 loc_5_1)
    (adj_up loc_6_1 loc_5_1)
    (adj_down loc_5_1 loc_6_1)
    (adj_up loc_7_1 loc_6_1)
    (adj_down loc_6_1 loc_7_1)
    (adj_up loc_8_1 loc_7_1)
    (adj_down loc_7_1 loc_8_1)
    (adj_up loc_9_1 loc_8_1)
    (adj_down loc_8_1 loc_9_1)
    (adj_up loc_10_1 loc_9_1)
    (adj_down loc_9_1 loc_10_1)
    (adj_up loc_11_1 loc_10_1)
    (adj_down loc_10_1 loc_11_1)
    (adj_up loc_12_1 loc_11_1)
    (adj_down loc_11_1 loc_12_1)
    (adj_up loc_13_1 loc_12_1)
    (adj_down loc_12_1 loc_13_1)
    (adj_up loc_14_1 loc_13_1)
    (adj_down loc_13_1 loc_14_1)
    (adj_up loc_15_1 loc_14_1)
    (adj_down loc_14_1 loc_15_1)
    (adj_up loc_16_1 loc_15_1)
    (adj_down loc_15_1 loc_16_1)
    (adj_up loc_17_1 loc_16_1)
    (adj_down loc_16_1 loc_17_1)
    (adj_up loc_18_1 loc_17_1)
    (adj_down loc_17_1 loc_18_1)
    (adj_up loc_19_1 loc_18_1)
    (adj_down loc_18_1 loc_19_1)
    (adj_up loc_20_1 loc_19_1)
    (adj_down loc_19_1 loc_20_1)
    (adj_up loc_21_1 loc_20_1)
    (adj_down loc_20_1 loc_21_1)
    (adj_up loc_22_1 loc_21_1)
    (adj_down loc_21_1 loc_22_1)
    (adj_up loc_23_1 loc_22_1)
    (adj_down loc_22_1 loc_23_1)
    (adj_up loc_24_1 loc_23_1)
    (adj_down loc_23_1 loc_24_1)
    (adj_up loc_25_1 loc_24_1)
    (adj_down loc_24_1 loc_25_1)
    (adj_up loc_26_1 loc_25_1)
    (adj_down loc_25_1 loc_26_1)
    (adj_up loc_27_1 loc_26_1)
    (adj_down loc_26_1 loc_27_1)
    (adj_up loc_28_1 loc_27_1)
    (adj_down loc_27_1 loc_28_1)
    (adj_up loc_29_1 loc_28_1)
    (adj_down loc_28_1 loc_29_1)
    (adj_up loc_30_1 loc_29_1)
    (adj_down loc_29_1 loc_30_1)
    (adj_up loc_31_1 loc_30_1)
    (adj_down loc_30_1 loc_31_1)
    (adj_up loc_32_1 loc_31_1)
    (adj_down loc_31_1 loc_32_1)
    (adj_up loc_33_1 loc_32_1)
    (adj_down loc_32_1 loc_33_1)
    (adj_up loc_34_1 loc_33_1)
    (adj_down loc_33_1 loc_34_1)
    (adj_up loc_35_1 loc_34_1)
    (adj_down loc_34_1 loc_35_1)
    (adj_up loc_36_1 loc_35_1)
    (adj_down loc_35_1 loc_36_1)
    (adj_up loc_37_1 loc_36_1)
    (adj_down loc_36_1 loc_37_1)
    (adj_up loc_38_1 loc_37_1)
    (adj_down loc_37_1 loc_38_1)
    (adj_up loc_39_1 loc_38_1)
    (adj_down loc_38_1 loc_39_1)
    (adj_up loc_40_1 loc_39_1)
    (adj_down loc_39_1 loc_40_1)
    (adj_up loc_41_1 loc_40_1)
    (adj_down loc_40_1 loc_41_1)
    (adj_up loc_42_1 loc_41_1)
    (adj_down loc_41_1 loc_42_1)
    (adj_up loc_43_1 loc_42_1)
    (adj_down loc_42_1 loc_43_1)
    (adj_up loc_44_1 loc_43_1)
    (adj_down loc_43_1 loc_44_1)
    (adj_up loc_45_1 loc_44_1)
    (adj_down loc_44_1 loc_45_1)
    (adj_up loc_46_1 loc_45_1)
    (adj_down loc_45_1 loc_46_1)
    (adj_up loc_47_1 loc_46_1)
    (adj_down loc_46_1 loc_47_1)
    (adj_up loc_48_1 loc_47_1)
    (adj_down loc_47_1 loc_48_1)
    (adj_up loc_49_1 loc_48_1)
    (adj_down loc_48_1 loc_49_1)
    (adj_up loc_50_1 loc_49_1)
    (adj_down loc_49_1 loc_50_1)
    (adj_up loc_51_1 loc_50_1)
    (adj_down loc_50_1 loc_51_1)
    (adj_up loc_52_1 loc_51_1)
    (adj_down loc_51_1 loc_52_1)
    (adj_up loc_53_1 loc_52_1)
    (adj_down loc_52_1 loc_53_1)
    (adj_up loc_54_1 loc_53_1)
    (adj_down loc_53_1 loc_54_1)
    (adj_up loc_55_1 loc_54_1)
    (adj_down loc_54_1 loc_55_1)
    (adj_up loc_56_1 loc_55_1)
    (adj_down loc_55_1 loc_56_1)
    (adj_up loc_57_1 loc_56_1)
    (adj_down loc_56_1 loc_57_1)
    (adj_up loc_58_1 loc_57_1)
    (adj_down loc_57_1 loc_58_1)
    (adj_up loc_59_1 loc_58_1)
    (adj_down loc_58_1 loc_59_1)
    (adj_up loc_60_1 loc_59_1)
    (adj_down loc_59_1 loc_60_1)
    (adj_up loc_61_1 loc_60_1)
    (adj_down loc_60_1 loc_61_1)
    (adj_up loc_62_1 loc_61_1)
    (adj_down loc_61_1 loc_62_1)
    (adj_up loc_63_1 loc_62_1)
    (adj_down loc_62_1 loc_63_1)
    (adj_up loc_64_1 loc_63_1)
    (adj_down loc_63_1 loc_64_1)
    (adj_up loc_65_1 loc_64_1)
    (adj_down loc_64_1 loc_65_1)
    (adj_up loc_66_1 loc_65_1)
    (adj_down loc_65_1 loc_66_1)
    (adj_up loc_67_1 loc_66_1)
    (adj_down loc_66_1 loc_67_1)
    (adj_up loc_68_1 loc_67_1)
    (adj_down loc_67_1 loc_68_1)
    (adj_up loc_69_1 loc_68_1)
    (adj_down loc_68_1 loc_69_1)
    (adj_up loc_70_1 loc_69_1)
    (adj_down loc_69_1 loc_70_1)
    (adj_up loc_71_1 loc_70_1)
    (adj_down loc_70_1 loc_71_1)
    (adj_up loc_72_1 loc_71_1)
    (adj_down loc_71_1 loc_72_1)
    (adj_up loc_73_1 loc_72_1)
    (adj_down loc_72_1 loc_73_1)
    (adj_up loc_74_1 loc_73_1)
    (adj_down loc_73_1 loc_74_1)
    (adj_up loc_75_1 loc_74_1)
    (adj_down loc_74_1 loc_75_1)
    (adj_up loc_76_1 loc_75_1)
    (adj_down loc_75_1 loc_76_1)
    (adj_up loc_77_1 loc_76_1)
    (adj_down loc_76_1 loc_77_1)
    (adj_up loc_78_1 loc_77_1)
    (adj_down loc_77_1 loc_78_1)
    (adj_up loc_79_1 loc_78_1)
    (adj_down loc_78_1 loc_79_1)
    (adj_up loc_80_1 loc_79_1)
    (adj_down loc_79_1 loc_80_1)
    (adj_up loc_81_1 loc_80_1)
    (adj_down loc_80_1 loc_81_1)
    (adj_up loc_82_1 loc_81_1)
    (adj_down loc_81_1 loc_82_1)
    (adj_up loc_83_1 loc_82_1)
    (adj_down loc_82_1 loc_83_1)
    (adj_up loc_84_1 loc_83_1)
    (adj_down loc_83_1 loc_84_1)
    (adj_up loc_85_1 loc_84_1)
    (adj_down loc_84_1 loc_85_1)
    (adj_up loc_86_1 loc_85_1)
    (adj_down loc_85_1 loc_86_1)
    (adj_up loc_87_1 loc_86_1)
    (adj_down loc_86_1 loc_87_1)
    (adj_up loc_88_1 loc_87_1)
    (adj_down loc_87_1 loc_88_1)
    (adj_up loc_89_1 loc_88_1)
    (adj_down loc_88_1 loc_89_1)
    (adj_up loc_90_1 loc_89_1)
    (adj_down loc_89_1 loc_90_1)
    (adj_up loc_91_1 loc_90_1)
    (adj_down loc_90_1 loc_91_1)
    (adj_up loc_92_1 loc_91_1)
    (adj_down loc_91_1 loc_92_1)
    (adj_up loc_93_1 loc_92_1)
    (adj_down loc_92_1 loc_93_1)
    (adj_up loc_94_1 loc_93_1)
    (adj_down loc_93_1 loc_94_1)
    (adj_up loc_95_1 loc_94_1)
    (adj_down loc_94_1 loc_95_1)
    (adj_up loc_96_1 loc_95_1) ; This is a wall, so not traversable, but defines relation
    (adj_down loc_95_1 loc_96_1)
  )
  (:goal (at_box box_0 loc_1_1))
)