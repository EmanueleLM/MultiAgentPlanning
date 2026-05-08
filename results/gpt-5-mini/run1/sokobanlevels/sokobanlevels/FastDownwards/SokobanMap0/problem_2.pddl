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
    pos_131 pos_132 pos_133 pos_134 pos_135 pos_136 pos_137 pos_138 pos_139 pos_140 - position
    box1 - box
  )

  (:init
    (box_at box1 pos_139)
    (player_at pos_140)

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

    (free pos_1) (free pos_2) (free pos_3) (free pos_4) (free pos_5)
    (free pos_6) (free pos_7) (free pos_8) (free pos_9) (free pos_10)
    (free pos_11) (free pos_12) (free pos_13) (free pos_14) (free pos_15)
    (free pos_16) (free pos_17) (free pos_18) (free pos_19) (free pos_20)
    (free pos_21) (free pos_22) (free pos_23) (free pos_24) (free pos_25)
    (free pos_26) (free pos_27) (free pos_28) (free pos_29) (free pos_30)
    (free pos_31) (free pos_32) (free pos_33) (free pos_34) (free pos_35)
    (free pos_36) (free pos_37) (free pos_38) (free pos_39) (free pos_40)
    (free pos_41) (free pos_42) (free pos_43) (free pos_44) (free pos_45)
    (free pos_46) (free pos_47) (free pos_48) (free pos_49) (free pos_50)
    (free pos_51) (free pos_52) (free pos_53) (free pos_54) (free pos_55)
    (free pos_56) (free pos_57) (free pos_58) (free pos_59) (free pos_60)
    (free pos_61) (free pos_62) (free pos_63) (free pos_64) (free pos_65)
    (free pos_66) (free pos_67) (free pos_68) (free pos_69) (free pos_70)
    (free pos_71) (free pos_72) (free pos_73) (free pos_74) (free pos_75)
    (free pos_76) (free pos_77) (free pos_78) (free pos_79) (free pos_80)
    (free pos_81) (free pos_82) (free pos_83) (free pos_84) (free pos_85)
    (free pos_86) (free pos_87) (free pos_88) (free pos_89) (free pos_90)
    (free pos_91) (free pos_92) (free pos_93) (free pos_94) (free pos_95)
    (free pos_96) (free pos_97) (free pos_98) (free pos_99) (free pos_100)
    (free pos_101) (free pos_102) (free pos_103) (free pos_104) (free pos_105)
    (free pos_106) (free pos_107) (free pos_108) (free pos_109) (free pos_110)
    (free pos_111) (free pos_112) (free pos_113) (free pos_114) (free pos_115)
    (free pos_116) (free pos_117) (free pos_118) (free pos_119) (free pos_120)
    (free pos_121) (free pos_122) (free pos_123) (free pos_124) (free pos_125)
    (free pos_126) (free pos_127) (free pos_128) (free pos_129) (free pos_130)
    (free pos_131) (free pos_132) (free pos_133) (free pos_134) (free pos_135)
    (free pos_136) (free pos_137) (free pos_138)
  )

  (:goal (and (box_at box1 pos_1)))
)