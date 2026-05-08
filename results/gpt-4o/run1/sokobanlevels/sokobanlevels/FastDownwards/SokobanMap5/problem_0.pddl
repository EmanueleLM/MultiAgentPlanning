(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects 
    player - movable
    box - movable
    wall_1 wall_2 wall_3 wall_4 wall_5 wall_6 wall_7 wall_8 wall_9 wall_10 wall_11 wall_12 wall_13 wall_14 wall_15 wall_16 
    wall_17 wall_18 wall_19 wall_20 wall_21 wall_22 wall_23 wall_24 wall_25 wall_26 wall_27 wall_28 wall_29 wall_30 wall_31 wall_32
    wall_33 wall_34 wall_35 wall_36 wall_37 wall_38 wall_39 wall_40 wall_41 wall_42 wall_43 wall_44 wall_45 wall_46 wall_47 wall_48
    wall_49 wall_50 wall_51 wall_52 wall_53 wall_54 wall_55 wall_56 wall_57 wall_58 wall_59 wall_60 wall_61 wall_62 wall_63 wall_64
    wall_65 wall_66 wall_67 wall_68 wall_69 wall_70 wall_71 wall_72 wall_73 wall_74 wall_75 wall_76 wall_77 wall_78 wall_79 wall_80
    wall_81 wall_82 wall_83 wall_84 wall_85 wall_86 wall_87 wall_88 wall_89 wall_90 wall_91 wall_92 wall_93 wall_94 wall_95 wall_96 
    wall_97 wall_98 wall_99 wall_100 wall_101 wall_102 wall_103 wall_104 wall_105 wall_106 wall_107 wall_108 wall_109 wall_110 wall_111 
    wall_112 wall_113 wall_114 wall_115 wall_116 wall_117 wall_118 
    cell_1 cell_2 cell_3 cell_4 cell_5 cell_6 cell_7 cell_8 cell_9 cell_10 cell_11 cell_12 cell_13 cell_14 cell_15 cell_16 
    cell_17 cell_18 cell_19 cell_20 cell_21 cell_22 cell_23 cell_24 cell_25 cell_26 cell_27 cell_28 cell_29 cell_30 cell_31 
    cell_32 cell_33 cell_34 cell_35 cell_36 cell_37 cell_38 cell_39 cell_40 cell_41 cell_42 cell_43 cell_44 cell_45 cell_46 
    cell_47 cell_48 cell_49 cell_50 cell_51 cell_52 cell_53 cell_54 cell_55 cell_56 cell_57 cell_58 cell_59 cell_60 cell_61 
    cell_62 cell_63 cell_64 cell_65 cell_66 cell_67 cell_68 cell_69 cell_70 cell_71 cell_72 cell_73 cell_74 cell_75 cell_76 
    cell_77 cell_78 cell_79 cell_80 cell_81 cell_82 cell_83 cell_84 cell_85 cell_86 cell_87 cell_88 cell_89 cell_90 cell_91
    cell_92 cell_93 cell_94 cell_95 cell_96 cell_97 cell_98 cell_99 cell_100 cell_101 cell_102 cell_103 cell_104 cell_105 - location
  )
  
  (:init
    (at player cell_2)
    (at box cell_80)
    (goal-at cell_104)
    ; Define all adjacencies for movement
    ; e.g., (adjacent cell_1 cell_2), etc.
    ; Define walls and their restricted access
    (clear cell_1) (clear cell_2) (clear cell_3) (clear cell_4) (clear cell_5) 
    (clear cell_6) (clear cell_7) (clear cell_8) (clear cell_9) (clear cell_10)
    ; Additional clears for all other cells except wall locations
    ; Adjacent relation definitions follow
  )
  
  (:goal 
    (at box cell_104)
  )
)