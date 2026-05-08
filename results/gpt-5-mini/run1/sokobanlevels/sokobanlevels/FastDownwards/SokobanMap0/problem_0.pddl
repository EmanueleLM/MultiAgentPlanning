(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
    pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10
    pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20
    pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29 pos_30
    pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39 pos_40
    pos_41 pos_42 pos_43 pos_44 pos_45 pos_46 pos_47 pos_48 pos_49 pos_50
    pos_51 pos_52 pos_53 pos_54 pos_55 pos_56 pos_57 pos_58 pos_59 pos_60
    pos_61 pos_62 pos_63 pos_64 pos_65 pos_66 pos_67 pos_68 pos_69 pos_70
    pos_71 pos_72 pos_73 pos_74 pos_75 pos_76 pos_77 pos_78 pos_79 pos_80
    pos_81 pos_82 pos_83 pos_84 pos_85 pos_86 pos_87 pos_88 pos_89 pos_90
    pos_91 pos_92 pos_93 pos_94 pos_95 pos_96 pos_97 pos_98 pos_99 pos_100
    pos_101 pos_102 pos_103 pos_104 pos_105 pos_106 pos_107 pos_108 pos_109 pos_110
    pos_111 pos_112 pos_113 pos_114 pos_115 pos_116 pos_117 pos_118 pos_119 pos_120
    pos_121 pos_122 pos_123 pos_124 pos_125 pos_126 pos_127 pos_128 pos_129 pos_130
    pos_131 pos_132 pos_133 pos_134 pos_135 pos_136 pos_137 pos_138 pos_139 pos_140
    box1 - box
    player1 - player
  )

  (:init
    ;; goal location (topmost walkable cell)
    (goal pos_1)

    ;; initial locations
    ;; box is located near the bottom, player directly below it
    (box_at box1 pos_139)
    (player_at pos_140)

    ;; adjacency: adjacent_up ?below ?above (above is immediately north of below)
    (adjacent_up pos_2 pos_1) (adjacent_up pos_3 pos_2) (adjacent_up pos_4 pos_3)
    (adjacent_up pos_5 pos_4) (adjacent_up pos_6 pos_5) (adjacent_up pos_7 pos_6)
    (adjacent_up pos_8 pos_7) (adjacent_up pos_9 pos_8) (adjacent_up pos_10 pos_9)
    (adjacent_up pos_11 pos_10) (adjacent_up pos_12 pos_11) (adjacent_up pos_13 pos_12)
    (adjacent_up pos_14 pos_13) (adjacent_up pos_15 pos_14) (adjacent_up pos_16 pos_15)
    (adjacent_up pos_17 pos_16) (adjacent_up pos_18 pos_17) (adjacent_up pos_19 pos_18)
    (adjacent_up pos_20 pos_19) (adjacent_up pos_21 pos_20) (adjacent_up pos_22 pos_21)
    (adjacent_up pos_23 pos_22) (adjacent_up pos_24 pos_23) (adjacent_up pos_25 pos_24)
    (adjacent_up pos_26 pos_25) (adjacent_up pos_27 pos_26) (adjacent_up pos_28 pos_27)
    (adjacent_up pos_29 pos_28) (adjacent_up pos_30 pos_29) (adjacent_up pos_31 pos_30)
    (adjacent_up pos_32 pos_31) (adjacent_up pos_33 pos_32) (adjacent_up pos_34 pos_33)
    (adjacent_up pos_35 pos_34) (adjacent_up pos_36 pos_35) (adjacent_up pos_37 pos_36)
    (adjacent_up pos_38 pos_37) (adjacent_up pos_39 pos_38) (adjacent_up pos_40 pos_39)
    (adjacent_up pos_41 pos_40) (adjacent_up pos_42 pos_41) (adjacent_up pos_43 pos_42)
    (adjacent_up pos_44 pos_43) (adjacent_up pos_45 pos_44) (adjacent_up pos_46 pos_45)
    (adjacent_up pos_47 pos_46) (adjacent_up pos_48 pos_47) (adjacent_up pos_49 pos_48)
    (adjacent_up pos_50 pos_49) (adjacent_up pos_51 pos_50) (adjacent_up pos_52 pos_51)
    (adjacent_up pos_53 pos_52) (adjacent_up pos_54 pos_53) (adjacent_up pos_55 pos_54)
    (adjacent_up pos_56 pos_55) (adjacent_up pos_57 pos_56) (adjacent_up pos_58 pos_57)
    (adjacent_up pos_59 pos_58) (adjacent_up pos_60 pos_59) (adjacent_up pos_61 pos_60)
    (adjacent_up pos_62 pos_61) (adjacent_up pos_63 pos_62) (adjacent_up pos_64 pos_63)
    (adjacent_up pos_65 pos_64) (adjacent_up pos_66 pos_65) (adjacent_up pos_67 pos_66)
    (adjacent_up pos_68 pos_67) (adjacent_up pos_69 pos_68) (adjacent_up pos_70 pos_69)
    (adjacent_up pos_71 pos_70) (adjacent_up pos_72 pos_71) (adjacent_up pos_73 pos_72)
    (adjacent_up pos_74 pos_73) (adjacent_up pos_75 pos_74) (adjacent_up pos_76 pos_75)
    (adjacent_up pos_77 pos_76) (adjacent_up pos_78 pos_77) (adjacent_up pos_79 pos_78)
    (adjacent_up pos_80 pos_79) (adjacent_up pos_81 pos_80) (adjacent_up pos_82 pos_81)
    (adjacent_up pos_83 pos_82) (adjacent_up pos_84 pos_83) (adjacent_up pos_85 pos_84)
    (adjacent_up pos_86 pos_85) (adjacent_up pos_87 pos_86) (adjacent_up pos_88 pos_87)
    (adjacent_up pos_89 pos_88) (adjacent_up pos_90 pos_89) (adjacent_up pos_91 pos_90)
    (adjacent_up pos_92 pos_91) (adjacent_up pos_93 pos_92) (adjacent_up pos_94 pos_93)
    (adjacent_up pos_95 pos_94) (adjacent_up pos_96 pos_95) (adjacent_up pos_97 pos_96)
    (adjacent_up pos_98 pos_97) (adjacent_up pos_99 pos_98) (adjacent_up pos_100 pos_99)
    (adjacent_up pos_101 pos_100) (adjacent_up pos_102 pos_101) (adjacent_up pos_103 pos_102)
    (adjacent_up pos_104 pos_103) (adjacent_up pos_105 pos_104) (adjacent_up pos_106 pos_105)
    (adjacent_up pos_107 pos_106) (adjacent_up pos_108 pos_107) (adjacent_up pos_109 pos_108)
    (adjacent_up pos_110 pos_109) (adjacent_up pos_111 pos_110) (adjacent_up pos_112 pos_111)
    (adjacent_up pos_113 pos_112) (adjacent_up pos_114 pos_113) (adjacent_up pos_115 pos_114)
    (adjacent_up pos_116 pos_115) (adjacent_up pos_117 pos_116) (adjacent_up pos_118 pos_117)
    (adjacent_up pos_119 pos_118) (adjacent_up pos_120 pos_119) (adjacent_up pos_121 pos_120)
    (adjacent_up pos_122 pos_121) (adjacent_up pos_123 pos_122) (adjacent_up pos_124 pos_123)
    (adjacent_up pos_125 pos_124) (adjacent_up pos_126 pos_125) (adjacent_up pos_127 pos_126)
    (adjacent_up pos_128 pos_127) (adjacent_up pos_129 pos_128) (adjacent_up pos_130 pos_129)
    (adjacent_up pos_131 pos_130) (adjacent_up pos_132 pos_131) (adjacent_up pos_133 pos_132)
    (adjacent_up pos_134 pos_133) (adjacent_up pos_135 pos_134) (adjacent_up pos_136 pos_135)
    (adjacent_up pos_137 pos_136) (adjacent_up pos_138 pos_137) (adjacent_up pos_139 pos_138)
    (adjacent_up pos_140 pos_139)

    ;; empty cells: all positions except the ones holding the box or the player
    (empty pos_1) (empty pos_2) (empty pos_3) (empty pos_4) (empty pos_5)
    (empty pos_6) (empty pos_7) (empty pos_8) (empty pos_9) (empty pos_10)
    (empty pos_11) (empty pos_12) (empty pos_13) (empty pos_14) (empty pos_15)
    (empty pos_16) (empty pos_17) (empty pos_18) (empty pos_19) (empty pos_20)
    (empty pos_21) (empty pos_22) (empty pos_23) (empty pos_24) (empty pos_25)
    (empty pos_26) (empty pos_27) (empty pos_28) (empty pos_29) (empty pos_30)
    (empty pos_31) (empty pos_32) (empty pos_33) (empty pos_34) (empty pos_35)
    (empty pos_36) (empty pos_37) (empty pos_38) (empty pos_39) (empty pos_40)
    (empty pos_41) (empty pos_42) (empty pos_43) (empty pos_44) (empty pos_45)
    (empty pos_46) (empty pos_47) (empty pos_48) (empty pos_49) (empty pos_50)
    (empty pos_51) (empty pos_52) (empty pos_53) (empty pos_54) (empty pos_55)
    (empty pos_56) (empty pos_57) (empty pos_58) (empty pos_59) (empty pos_60)
    (empty pos_61) (empty pos_62) (empty pos_63) (empty pos_64) (empty pos_65)
    (empty pos_66) (empty pos_67) (empty pos_68) (empty pos_69) (empty pos_70)
    (empty pos_71) (empty pos_72) (empty pos_73) (empty pos_74) (empty pos_75)
    (empty pos_76) (empty pos_77) (empty pos_78) (empty pos_79) (empty pos_80)
    (empty pos_81) (empty pos_82) (empty pos_83) (empty pos_84) (empty pos_85)
    (empty pos_86) (empty pos_87) (empty pos_88) (empty pos_89) (empty pos_90)
    (empty pos_91) (empty pos_92) (empty pos_93) (empty pos_94) (empty pos_95)
    (empty pos_96) (empty pos_97) (empty pos_98) (empty pos_99) (empty pos_100)
    (empty pos_101) (empty pos_102) (empty pos_103) (empty pos_104) (empty pos_105)
    (empty pos_106) (empty pos_107) (empty pos_108) (empty pos_109) (empty pos_110)
    (empty pos_111) (empty pos_112) (empty pos_113) (empty pos_114) (empty pos_115)
    (empty pos_116) (empty pos_117) (empty pos_118) (empty pos_119) (empty pos_120)
    (empty pos_121) (empty pos_122) (empty pos_123) (empty pos_124) (empty pos_125)
    (empty pos_126) (empty pos_127) (empty pos_128) (empty pos_129) (empty pos_130)
    (empty pos_131) (empty pos_132) (empty pos_133) (empty pos_134) (empty pos_135)
    (empty pos_136) (empty pos_137) (empty pos_138)
    ;; pos_139 holds the box (not empty), pos_140 holds the player (not empty)
  )

  (:goal (and (box_at box1 pos_1)))
)