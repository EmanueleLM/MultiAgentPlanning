(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    cell_1 cell_2 cell_3 cell_4 cell_5 cell_6 cell_7 cell_8 cell_9 cell_10
    cell_11 cell_12 cell_13 cell_14 cell_15 cell_16 cell_17 cell_18 cell_19 cell_20
    cell_21 cell_22 cell_23 cell_24 cell_25 cell_26 cell_27 cell_28 cell_29 cell_30
    cell_31 cell_32 cell_33 cell_34 cell_35 cell_36 cell_37 cell_38 cell_39 cell_40
    cell_41 cell_42 cell_43 cell_44 cell_45 cell_46 cell_47 cell_48 cell_49 cell_50
    cell_51 cell_52 cell_53 cell_54 cell_55 cell_56 cell_57 cell_58 cell_59 cell_60
    cell_61 cell_62 cell_63 cell_64 cell_65 cell_66 cell_67 cell_68 cell_69 cell_70
    cell_71 cell_72 cell_73 cell_74 cell_75 cell_76 cell_77 cell_78 cell_79 cell_80
    cell_81 cell_82 cell_83 cell_84 cell_85 cell_86 cell_87 cell_88 cell_89 cell_90
    cell_91 cell_92 cell_93 cell_94 cell_95 cell_96 cell_97 cell_98 cell_99 cell_100
    cell_101 cell_102 cell_103 cell_104 cell_105 - location
  )
  
  (:init
    (at-player cell_2)
    (at-box cell_80)
    (goal cell_104)
    ; set all cells clear except wall positions, e.g., cell_3 to cell_79 and cell_81 to cell_103
    (clear cell_2) (clear cell_4) (clear cell_5) 
    (clear cell_6) (clear cell_7) (clear cell_8) 
    ; specify relevant adjacencies, note: non-wall positions assumed adjacent in sequence
    (adjacent cell_2 cell_3)
    ; possibly additional adjacencies
  )
  
  (:goal 
    (at-box cell_104)
  )
)