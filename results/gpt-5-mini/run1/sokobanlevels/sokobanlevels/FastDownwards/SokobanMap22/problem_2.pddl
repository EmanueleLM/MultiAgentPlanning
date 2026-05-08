(define (problem sokoban_instance_140)
  (:domain sokoban_linear)
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
    (at_player pos_140)
    (box_at box1 pos_110)
    (occupied pos_110)
    (goal_pos pos_1)

    (next_up pos_2 pos_1) (next_up pos_3 pos_2) (next_up pos_4 pos_3) (next_up pos_5 pos_4)
    (next_up pos_6 pos_5) (next_up pos_7 pos_6) (next_up pos_8 pos_7) (next_up pos_9 pos_8)
    (next_up pos_10 pos_9) (next_up pos_11 pos_10) (next_up pos_12 pos_11) (next_up pos_13 pos_12)
    (next_up pos_14 pos_13) (next_up pos_15 pos_14) (next_up pos_16 pos_15) (next_up pos_17 pos_16)
    (next_up pos_18 pos_17) (next_up pos_19 pos_18) (next_up pos_20 pos_19) (next_up pos_21 pos_20)
    (next_up pos_22 pos_21) (next_up pos_23 pos_22) (next_up pos_24 pos_23) (next_up pos_25 pos_24)
    (next_up pos_26 pos_25) (next_up pos_27 pos_26) (next_up pos_28 pos_27) (next_up pos_29 pos_28)
    (next_up pos_30 pos_29) (next_up pos_31 pos_30) (next_up pos_32 pos_31) (next_up pos_33 pos_32)
    (next_up pos_34 pos_33) (next_up pos_35 pos_34) (next_up pos_36 pos_35) (next_up pos_37 pos_36)
    (next_up pos_38 pos_37) (next_up pos_39 pos_38) (next_up pos_40 pos_39) (next_up pos_41 pos_40)
    (next_up pos_42 pos_41) (next_up pos_43 pos_42) (next_up pos_44 pos_43) (next_up pos_45 pos_44)
    (next_up pos_46 pos_45) (next_up pos_47 pos_46) (next_up pos_48 pos_47) (next_up pos_49 pos_48)
    (next_up pos_50 pos_49) (next_up pos_51 pos_50) (next_up pos_52 pos_51) (next_up pos_53 pos_52)
    (next_up pos_54 pos_53) (next_up pos_55 pos_54) (next_up pos_56 pos_55) (next_up pos_57 pos_56)
    (next_up pos_58 pos_57) (next_up pos_59 pos_58) (next_up pos_60 pos_59) (next_up pos_61 pos_60)
    (next_up pos_62 pos_61) (next_up pos_63 pos_62) (next_up pos_64 pos_63) (next_up pos_65 pos_64)
    (next_up pos_66 pos_65) (next_up pos_67 pos_66) (next_up pos_68 pos_67) (next_up pos_69 pos_68)
    (next_up pos_70 pos_69) (next_up pos_71 pos_70) (next_up pos_72 pos_71) (next_up pos_73 pos_72)
    (next_up pos_74 pos_73) (next_up pos_75 pos_74) (next_up pos_76 pos_75) (next_up pos_77 pos_76)
    (next_up pos_78 pos_77) (next_up pos_79 pos_78) (next_up pos_80 pos_79) (next_up pos_81 pos_80)
    (next_up pos_82 pos_81) (next_up pos_83 pos_82) (next_up pos_84 pos_83) (next_up pos_85 pos_84)
    (next_up pos_86 pos_85) (next_up pos_87 pos_86) (next_up pos_88 pos_87) (next_up pos_89 pos_88)
    (next_up pos_90 pos_89) (next_up pos_91 pos_90) (next_up pos_92 pos_91) (next_up pos_93 pos_92)
    (next_up pos_94 pos_93) (next_up pos_95 pos_94) (next_up pos_96 pos_95) (next_up pos_97 pos_96)
    (next_up pos_98 pos_97) (next_up pos_99 pos_98) (next_up pos_100 pos_99) (next_up pos_101 pos_100)
    (next_up pos_102 pos_101) (next_up pos_103 pos_102) (next_up pos_104 pos_103) (next_up pos_105 pos_104)
    (next_up pos_106 pos_105) (next_up pos_107 pos_106) (next_up pos_108 pos_107) (next_up pos_109 pos_108)
    (next_up pos_110 pos_109) (next_up pos_111 pos_110) (next_up pos_112 pos_111) (next_up pos_113 pos_112)
    (next_up pos_114 pos_113) (next_up pos_115 pos_114) (next_up pos_116 pos_115) (next_up pos_117 pos_116)
    (next_up pos_118 pos_117) (next_up pos_119 pos_118) (next_up pos_120 pos_119) (next_up pos_121 pos_120)
    (next_up pos_122 pos_121) (next_up pos_123 pos_122) (next_up pos_124 pos_123) (next_up pos_125 pos_124)
    (next_up pos_126 pos_125) (next_up pos_127 pos_126) (next_up pos_128 pos_127) (next_up pos_129 pos_128)
    (next_up pos_130 pos_129) (next_up pos_131 pos_130) (next_up pos_132 pos_131) (next_up pos_133 pos_132)
    (next_up pos_134 pos_133) (next_up pos_135 pos_134) (next_up pos_136 pos_135) (next_up pos_137 pos_136)
    (next_up pos_138 pos_137) (next_up pos_139 pos_138) (next_up pos_140 pos_139)

    (next_down pos_1 pos_2) (next_down pos_2 pos_3) (next_down pos_3 pos_4) (next_down pos_4 pos_5)
    (next_down pos_5 pos_6) (next_down pos_6 pos_7) (next_down pos_7 pos_8) (next_down pos_8 pos_9)
    (next_down pos_9 pos_10) (next_down pos_10 pos_11) (next_down pos_11 pos_12) (next_down pos_12 pos_13)
    (next_down pos_13 pos_14) (next_down pos_14 pos_15) (next_down pos_15 pos_16) (next_down pos_16 pos_17)
    (next_down pos_17 pos_18) (next_down pos_18 pos_19) (next_down pos_19 pos_20) (next_down pos_20 pos_21)
    (next_down pos_21 pos_22) (next_down pos_22 pos_23) (next_down pos_23 pos_24) (next_down pos_24 pos_25)
    (next_down pos_25 pos_26) (next_down pos_26 pos_27) (next_down pos_27 pos_28) (next_down pos_28 pos_29)
    (next_down pos_29 pos_30) (next_down pos_30 pos_31) (next_down pos_31 pos_32) (next_down pos_32 pos_33)
    (next_down pos_33 pos_34) (next_down pos_34 pos_35) (next_down pos_35 pos_36) (next_down pos_36 pos_37)
    (next_down pos_37 pos_38) (next_down pos_38 pos_39) (next_down pos_39 pos_40) (next_down pos_40 pos_41)
    (next_down pos_41 pos_42) (next_down pos_42 pos_43) (next_down pos_43 pos_44) (next_down pos_44 pos_45)
    (next_down pos_45 pos_46) (next_down pos_46 pos_47) (next_down pos_47 pos_48) (next_down pos_48 pos_49)
    (next_down pos_49 pos_50) (next_down pos_50 pos_51) (next_down pos_51 pos_52) (next_down pos_52 pos_53)
    (next_down pos_53 pos_54) (next_down pos_54 pos_55) (next_down pos_55 pos_56) (next_down pos_56 pos_57)
    (next_down pos_57 pos_58) (next_down pos_58 pos_59) (next_down pos_59 pos_60) (next_down pos_60 pos_61)
    (next_down pos_61 pos_62) (next_down pos_62 pos_63) (next_down pos_63 pos_64) (next_down pos_64 pos_65)
    (next_down pos_65 pos_66) (next_down pos_66 pos_67) (next_down pos_67 pos_68) (next_down pos_68 pos_69)
    (next_down pos_69 pos_70) (next_down pos_70 pos_71) (next_down pos_71 pos_72) (next_down pos_72 pos_73)
    (next_down pos_73 pos_74) (next_down pos_74 pos_75) (next_down pos_75 pos_76) (next_down pos_76 pos_77)
    (next_down pos_77 pos_78) (next_down pos_78 pos_79) (next_down pos_79 pos_80) (next_down pos_80 pos_81)
    (next_down pos_81 pos_82) (next_down pos_82 pos_83) (next_down pos_83 pos_84) (next_down pos_84 pos_85)
    (next_down pos_85 pos_86) (next_down pos_86 pos_87) (next_down pos_87 pos_88) (next_down pos_88 pos_89)
    (next_down pos_89 pos_90) (next_down pos_90 pos_91) (next_down pos_91 pos_92) (next_down pos_92 pos_93)
    (next_down pos_93 pos_94) (next_down pos_94 pos_95) (next_down pos_95 pos_96) (next_down pos_96 pos_97)
    (next_down pos_97 pos_98) (next_down pos_98 pos_99) (next_down pos_99 pos_100) (next_down pos_100 pos_101)
    (next_down pos_101 pos_102) (next_down pos_102 pos_103) (next_down pos_103 pos_104) (next_down pos_104 pos_105)
    (next_down pos_105 pos_106) (next_down pos_106 pos_107) (next_down pos_107 pos_108) (next_down pos_108 pos_109)
    (next_down pos_109 pos_110) (next_down pos_110 pos_111) (next_down pos_111 pos_112) (next_down pos_112 pos_113)
    (next_down pos_113 pos_114) (next_down pos_114 pos_115) (next_down pos_115 pos_116) (next_down pos_116 pos_117)
    (next_down pos_117 pos_118) (next_down pos_118 pos_119) (next_down pos_119 pos_120) (next_down pos_120 pos_121)
    (next_down pos_121 pos_122) (next_down pos_122 pos_123) (next_down pos_123 pos_124) (next_down pos_124 pos_125)
    (next_down pos_125 pos_126) (next_down pos_126 pos_127) (next_down pos_127 pos_128) (next_down pos_128 pos_129)
    (next_down pos_129 pos_130) (next_down pos_130 pos_131) (next_down pos_131 pos_132) (next_down pos_132 pos_133)
    (next_down pos_133 pos_134) (next_down pos_134 pos_135) (next_down pos_135 pos_136) (next_down pos_136 pos_137)
    (next_down pos_137 pos_138) (next_down pos_138 pos_139) (next_down pos_139 pos_140)
  )

  (:goal (and
    (box_at box1 pos_1)
  ))
)