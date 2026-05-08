(define (problem sokoban-instance)
  (:domain sokoban)
  
  (:objects
    player - player
    box_1 - box
    goal_1 - goal
    loc_00 loc_01 loc_02 loc_03 loc_04 loc_05 loc_06 loc_07 loc_08 loc_09 loc_10
    loc_11 loc_12 loc_13 loc_14 loc_15 loc_16 loc_17 loc_18 loc_19 loc_20
    loc_21 loc_22 loc_23 loc_24 loc_25 loc_26 loc_27 loc_28 loc_29 loc_30
    loc_31 loc_32 loc_33 loc_34 loc_35 loc_36 loc_37 loc_38 loc_39 loc_40
    loc_41 loc_42 loc_43 loc_44 loc_45 loc_46 loc_47 loc_48 loc_49 loc_50
    loc_51 loc_52 loc_53 loc_54 loc_55 loc_56 loc_57 loc_58 loc_59 loc_60
    loc_61 loc_62 loc_63 loc_64 loc_65 loc_66 loc_67 loc_68 loc_69 loc_70
    loc_71 loc_72 loc_73 loc_74 loc_75 loc_76 loc_77 loc_78 loc_79 loc_80
    loc_81 loc_82 loc_83 loc_84 loc_85 loc_86 loc_87 loc_88 loc_89 loc_90
    loc_91 loc_92 loc_93 loc_94 loc_95 loc_96 loc_97 loc_98 loc_99 loc_100
    loc_101 loc_102 loc_103 loc_104 loc_105 loc_106 loc_107 loc_108 loc_109 loc_110
    loc_111 loc_112 loc_113 loc_114 loc_115 loc_116 loc_117 loc_118 loc_119 loc_120
    loc_121 loc_122 loc_123 loc_124 loc_125 loc_126 loc_127 loc_128 loc_129 loc_130
    loc_131 loc_132 loc_133 loc_134 loc_135 loc_136 loc_137 loc_138 loc_139 loc_140
    loc_141 loc_142 loc_143 loc_144 loc_145 loc_146 loc_147 loc_148 loc_149 loc_150
    ; Continue listing locations up to loc_1499 as needed
    wall_0 wall_1 wall_2 wall_3 wall_4 wall_5 wall_6 wall_7 wall_8 wall_9 wall_10
    wall_11 wall_12 wall_13 wall_14 wall_15 wall_16 wall_17 wall_18 wall_19 wall_20
    ; Continue listing walls as needed
    - location
  )
  
  (:init
    (at_player loc_00)
    (at_box box_1 loc_50)
    (at_goal loc_1499 goal_1)
    ; Specify all clear locations and adjacency relations as needed...
    (clear loc_01)
    (adjacent loc_00 loc_01)
    (adjacent loc_00 loc_10)
    (adjacent loc_50 loc_51)
    (adjacent loc_50 loc_40)
    ; Continue for all relevant locational relationships based on map...
  )
  
  (:goal
    (box_on_goal box_1)
  )
)