(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    pos_0_0 - position
    pos_1_0 - position
    pos_2_0 - position
    pos_3_0 - position
    pos_4_0 - position
    pos_5_0 - position
    pos_6_0 - position
    pos_7_0 - position
    pos_8_0 - position
    pos_9_0 - position
    pos_10_0 - position
    pos_11_0 - position
    pos_12_0 - position
    pos_13_0 - position
    pos_14_0 - position
    pos_15_0 - position
    pos_16_0 - position
    pos_17_0 - position
    pos_18_0 - position
    pos_19_0 - position
    pos_20_0 - position
    pos_21_0 - position
    pos_22_0 - position
    pos_23_0 - position
    pos_24_0 - position
    pos_25_0 - position
    pos_26_0 - position
    pos_27_0 - position
    pos_28_0 - position
    pos_29_0 - position
    pos_30_0 - position
    pos_31_0 - position
    pos_32_0 - position
    pos_33_0 - position
    pos_34_0 - position
    pos_35_0 - position
    pos_36_0 - position
    pos_37_0 - position
    pos_38_0 - position
    pos_39_0 - position
    pos_40_0 - position
    pos_41_0 - position
    pos_42_0 - position
    pos_43_0 - position
    pos_44_0 - position
    pos_45_0 - position
    pos_46_0 - position
    pos_47_0 - position
    pos_48_0 - position
    pos_49_0 - position
    pos_50_0 - position
    pos_51_0 - position
    pos_52_0 - position
    pos_53_0 - position
    pos_54_0 - position
    pos_55_0 - position
    pos_56_0 - position
    pos_57_0 - position
    pos_58_0 - position
    pos_59_0 - position
    pos_60_0 - position
    pos_61_0 - position
    pos_62_0 - position
    pos_63_0 - position
    pos_64_0 - position
    pos_65_0 - position
    pos_66_0 - position
    pos_67_0 - position
    pos_68_0 - position
    pos_69_0 - position
    pos_70_0 - position
    pos_71_0 - position
    pos_72_0 - position
    pos_73_0 - position
    pos_74_0 - position
    pos_75_0 - position
    pos_76_0 - position
    pos_77_0 - position
    pos_78_0 - position
    pos_79_0 - position
    pos_80_0 - position
    pos_81_0 - position
    pos_82_0 - position
    pos_83_0 - position
    pos_84_0 - position
    pos_85_0 - position
    pos_86_0 - position
    pos_87_0 - position
    pos_88_0 - position
    pos_89_0 - position
    pos_90_0 - position
    pos_91_0 - position
    pos_92_0 - position
    pos_93_0 - position
    pos_94_0 - position
    pos_95_0 - position
    pos_96_0 - position
    pos_97_0 - position
    pos_98_0 - position
    pos_99_0 - position
  )
  
  (:init
    (player_at pos_1_0)
    (box_at pos_48_0)
    (goal_at pos_96_0)
    
    (wall_at pos_0_0)
    (wall_at pos_2_0)
    (wall_at pos_3_0)
    (wall_at pos_4_0)
    (wall_at pos_5_0)
    (wall_at pos_6_0)
    (wall_at pos_7_0)
    (wall_at pos_8_0)
    (wall_at pos_9_0)
    (wall_at pos_10_0)
    (wall_at pos_11_0)
    (wall_at pos_12_0)
    (wall_at pos_13_0)
    (wall_at pos_14_0)
    (wall_at pos_15_0)
    (wall_at pos_16_0)
    (wall_at pos_17_0)
    (wall_at pos_18_0)
    (wall_at pos_19_0)
    (wall_at pos_20_0)
    (wall_at pos_21_0)
    (wall_at pos_22_0)
    (wall_at pos_23_0)
    (wall_at pos_24_0)
    (wall_at pos_25_0)
    (wall_at pos_26_0)
    (wall_at pos_27_0)
    (wall_at pos_28_0)
    (wall_at pos_29_0)
    (wall_at pos_30_0)
    (wall_at pos_31_0)
    (wall_at pos_32_0)
    (wall_at pos_33_0)
    (wall_at pos_34_0)
    (wall_at pos_35_0)
    (wall_at pos_36_0)
    (wall_at pos_37_0)
    (wall_at pos_38_0)
    (wall_at pos_39_0)
    (wall_at pos_40_0)
    (wall_at pos_41_0)
    (wall_at pos_42_0)
    (wall_at pos_43_0)
    (wall_at pos_44_0)
    (wall_at pos_45_0)
    (wall_at pos_46_0)
    (wall_at pos_47_0)
    (wall_at pos_49_0)
    (wall_at pos_50_0)
    (wall_at pos_51_0)
    (wall_at pos_52_0)
    (wall_at pos_53_0)
    (wall_at pos_54_0)
    (wall_at pos_55_0)
    (wall_at pos_56_0)
    (wall_at pos_57_0)
    (wall_at pos_58_0)
    (wall_at pos_59_0)
    (wall_at pos_60_0)
    (wall_at pos_61_0)
    (wall_at pos_62_0)
    (wall_at pos_63_0)
    (wall_at pos_64_0)
    (wall_at pos_65_0)
    (wall_at pos_66_0)
    (wall_at pos_67_0)
    (wall_at pos_68_0)
    (wall_at pos_69_0)
    (wall_at pos_70_0)
    (wall_at pos_71_0)
    (wall_at pos_72_0)
    (wall_at pos_73_0)
    (wall_at pos_74_0)
    (wall_at pos_75_0)
    (wall_at pos_76_0)
    (wall_at pos_77_0)
    (wall_at pos_78_0)
    (wall_at pos_79_0)
    (wall_at pos_80_0)
    (wall_at pos_81_0)
    (wall_at pos_82_0)
    (wall_at pos_83_0)
    (wall_at pos_84_0)
    (wall_at pos_85_0)
    (wall_at pos_86_0)
    (wall_at pos_87_0)
    (wall_at pos_88_0)
    (wall_at pos_89_0)
    (wall_at pos_90_0)
    (wall_at pos_91_0)
    (wall_at pos_92_0)
    (wall_at pos_93_0)
    (wall_at pos_94_0)
    (wall_at pos_95_0)
    (wall_at pos_97_0)
    (wall_at pos_98_0)
    (wall_at pos_99_0)

    (adjacent pos_1_0 pos_2_0)
    (adjacent pos_2_0 pos_1_0)
    (adjacent pos_2_0 pos_48_0)
    (adjacent pos_48_0 pos_2_0)
    (adjacent pos_48_0 pos_96_0)
    (adjacent pos_96_0 pos_48_0)
  )

  (:goal
    (box_at pos_96_0)
  )
)