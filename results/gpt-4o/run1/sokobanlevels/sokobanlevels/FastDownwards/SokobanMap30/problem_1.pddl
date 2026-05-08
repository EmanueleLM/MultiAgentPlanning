(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_1 - player
    box_1 - box
    goal_1 - goal
    cell_1_1 cell_2_1 cell_3_1 cell_4_1 cell_5_1 cell_6_1 cell_7_1 cell_8_1 cell_9_1 cell_10_1
    cell_11_1 cell_12_1 cell_13_1 cell_14_1 cell_15_1 cell_16_1 cell_17_1 cell_18_1 cell_19_1 cell_20_1
    cell_21_1 cell_22_1 cell_23_1 cell_24_1 cell_25_1 cell_26_1 cell_27_1 cell_28_1 cell_29_1 cell_30_1
    cell_31_1 cell_32_1 cell_33_1 cell_34_1 cell_35_1 cell_36_1 cell_37_1 cell_38_1 cell_39_1 cell_40_1
    cell_41_1 cell_42_1 cell_43_1 cell_44_1 cell_45_1 cell_46_1 cell_47_1 cell_48_1 cell_49_1 cell_50_1
    cell_51_1 cell_52_1 cell_53_1 cell_54_1 cell_55_1 cell_56_1 cell_57_1 cell_58_1 cell_59_1 cell_60_1
    cell_61_1 cell_62_1 cell_63_1 cell_64_1 cell_65_1 cell_66_1 cell_67_1 cell_68_1 cell_69_1 cell_70_1
    cell_71_1 cell_72_1 cell_73_1 cell_74_1 cell_75_1 cell_76_1 cell_77_1 cell_78_1 cell_79_1 cell_80_1
    cell_81_1 cell_82_1 cell_83_1 cell_84_1 cell_85_1 cell_86_1 cell_87_1 - cell
  )
  (:init
    (at player_1 cell_87_1)
    (at box_1 cell_40_1)
    (goal_at box_1 cell_1_1)
    (adjacent cell_1_1 cell_2_1) (adjacent cell_2_1 cell_1_1)
    (adjacent cell_2_1 cell_3_1) (adjacent cell_3_1 cell_2_1)
    ; Define all adjacent pairs similarly
    ; Define walls based on provided ASCII map
    (wall cell_1_1) (wall cell_2_1) ... (wall cell_87_1)
    (free cell_2_1) (free cell_3_1) (free cell_40_1) ... (free cell_86_1)
  )
  (:goal
    (goal_at box_1 cell_1_1)
  )
)