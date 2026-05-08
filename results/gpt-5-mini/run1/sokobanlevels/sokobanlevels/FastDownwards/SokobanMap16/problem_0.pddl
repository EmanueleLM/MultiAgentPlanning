(define (problem sokoban_instance)
  (:domain sokoban_corridor)
  (:objects
    player1 - agent
    box1 - box
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
    pos_141 pos_142 pos_143 pos_144 pos_145 pos_146 pos_147 pos_148 pos_149 pos_150
    pos_151 pos_152 pos_153 pos_154 pos_155 pos_156 pos_157 pos_158 pos_159 pos_160
    pos_161 pos_162 pos_163 pos_164 pos_165 pos_166 pos_167 pos_168 pos_169 pos_170
    pos_171 pos_172 pos_173 pos_174 pos_175 pos_176 pos_177 pos_178 pos_179 pos_180
    pos_181 pos_182 pos_183 pos_184 pos_185 pos_186 pos_187 pos_188 pos_189 pos_190
    pos_191 pos_192 pos_193 pos_194 pos_195 pos_196 pos_197 pos_198 pos_199 pos_200
    pos_201 pos_202 pos_203 pos_204 pos_205 pos_206 pos_207 pos_208 pos_209 pos_210
    pos_211 - position
  )

  (:init
    ; adjacency chain: up pos_{i+1} pos_{i} for i=1..210
    (up pos_2 pos_1) (up pos_3 pos_2) (up pos_4 pos_3) (up pos_5 pos_4) (up pos_6 pos_5)
    (up pos_7 pos_6) (up pos_8 pos_7) (up pos_9 pos_8) (up pos_10 pos_9) (up pos_11 pos_10)
    (up pos_12 pos_11) (up pos_13 pos_12) (up pos_14 pos_13) (up pos_15 pos_14) (up pos_16 pos_15)
    (up pos_17 pos_16) (up pos_18 pos_17) (up pos_19 pos_18) (up pos_20 pos_19) (up pos_21 pos_20)
    (up pos_22 pos_21) (up pos_23 pos_22) (up pos_24 pos_23) (up pos_25 pos_24) (up pos_26 pos_25)
    (up pos_27 pos_26) (up pos_28 pos_27) (up pos_29 pos_28) (up pos_30 pos_29) (up pos_31 pos_30)
    (up pos_32 pos_31) (up pos_33 pos_32) (up pos_34 pos_33) (up pos_35 pos_34) (up pos_36 pos_35)
    (up pos_37 pos_36) (up pos_38 pos_37) (up pos_39 pos_38) (up pos_40 pos_39) (up pos_41 pos_40)
    (up pos_42 pos_41) (up pos_43 pos_42) (up pos_44 pos_43) (up pos_45 pos_44) (up pos_46 pos_45)
    (up pos_47 pos_46) (up pos_48 pos_47) (up pos_49 pos_48) (up pos_50 pos_49) (up pos_51 pos_50)
    (up pos_52 pos_51) (up pos_53 pos_52) (up pos_54 pos_53) (up pos_55 pos_54) (up pos_56 pos_55)
    (up pos_57 pos_56) (up pos_58 pos_57) (up pos_59 pos_58) (up pos_60 pos_59) (up pos_61 pos_60)
    (up pos_62 pos_61) (up pos_63 pos_62) (up pos_64 pos_63) (up pos_65 pos_64) (up pos_66 pos_65)
    (up pos_67 pos_66) (up pos_68 pos_67) (up pos_69 pos_68) (up pos_70 pos_69) (up pos_71 pos_70)
    (up pos_72 pos_71) (up pos_73 pos_72) (up pos_74 pos_73) (up pos_75 pos_74) (up pos_76 pos_75)
    (up pos_77 pos_76) (up pos_78 pos_77) (up pos_79 pos_78) (up pos_80 pos_79) (up pos_81 pos_80)
    (up pos_82 pos_81) (up pos_83 pos_82) (up pos_84 pos_83) (up pos_85 pos_84) (up pos_86 pos_85)
    (up pos_87 pos_86) (up pos_88 pos_87) (up pos_89 pos_88) (up pos_90 pos_89) (up pos_91 pos_90)
    (up pos_92 pos_91) (up pos_93 pos_92) (up pos_94 pos_93) (up pos_95 pos_94) (up pos_96 pos_95)
    (up pos_97 pos_96) (up pos_98 pos_97) (up pos_99 pos_98) (up pos_100 pos_99) (up pos_101 pos_100)
    (up pos_102 pos_101) (up pos_103 pos_102) (up pos_104 pos_103) (up pos_105 pos_104) (up pos_106 pos_105)
    (up pos_107 pos_106) (up pos_108 pos_107) (up pos_109 pos_108) (up pos_110 pos_109) (up pos_111 pos_110)
    (up pos_112 pos_111) (up pos_113 pos_112) (up pos_114 pos_113) (up pos_115 pos_114) (up pos_116 pos_115)
    (up pos_117 pos_116) (up pos_118 pos_117) (up pos_119 pos_118) (up pos_120 pos_119) (up pos_121 pos_120)
    (up pos_122 pos_121) (up pos_123 pos_122) (up pos_124 pos_123) (up pos_125 pos_124) (up pos_126 pos_125)
    (up pos_127 pos_126) (up pos_128 pos_127) (up pos_129 pos_128) (up pos_130 pos_129) (up pos_131 pos_130)
    (up pos_132 pos_131) (up pos_133 pos_132) (up pos_134 pos_133) (up pos_135 pos_134) (up pos_136 pos_135)
    (up pos_137 pos_136) (up pos_138 pos_137) (up pos_139 pos_138) (up pos_140 pos_139) (up pos_141 pos_140)
    (up pos_142 pos_141) (up pos_143 pos_142) (up pos_144 pos_143) (up pos_145 pos_144) (up pos_146 pos_145)
    (up pos_147 pos_146) (up pos_148 pos_147) (up pos_149 pos_148) (up pos_150 pos_149) (up pos_151 pos_150)
    (up pos_152 pos_151) (up pos_153 pos_152) (up pos_154 pos_153) (up pos_155 pos_154) (up pos_156 pos_155)
    (up pos_157 pos_156) (up pos_158 pos_157) (up pos_159 pos_158) (up pos_160 pos_159) (up pos_161 pos_160)
    (up pos_162 pos_161) (up pos_163 pos_162) (up pos_164 pos_163) (up pos_165 pos_164) (up pos_166 pos_165)
    (up pos_167 pos_166) (up pos_168 pos_167) (up pos_169 pos_168) (up pos_170 pos_169) (up pos_171 pos_170)
    (up pos_172 pos_171) (up pos_173 pos_172) (up pos_174 pos_173) (up pos_175 pos_174) (up pos_176 pos_175)
    (up pos_177 pos_176) (up pos_178 pos_177) (up pos_179 pos_178) (up pos_180 pos_179) (up pos_181 pos_180)
    (up pos_182 pos_181) (up pos_183 pos_182) (up pos_184 pos_183) (up pos_185 pos_184) (up pos_186 pos_185)
    (up pos_187 pos_186) (up pos_188 pos_187) (up pos_189 pos_188) (up pos_190 pos_189) (up pos_191 pos_190)
    (up pos_192 pos_191) (up pos_193 pos_192) (up pos_194 pos_193) (up pos_195 pos_194) (up pos_196 pos_195)
    (up pos_197 pos_196) (up pos_198 pos_197) (up pos_199 pos_198) (up pos_200 pos_199) (up pos_201 pos_200)
    (up pos_202 pos_201) (up pos_203 pos_202) (up pos_204 pos_203) (up pos_205 pos_204) (up pos_206 pos_205)
    (up pos_207 pos_206) (up pos_208 pos_207) (up pos_209 pos_208) (up pos_210 pos_209) (up pos_211 pos_210)

    ; goal cell
    (goal_pos pos_1)

    ; initial player and box locations
    (player_at player1 pos_211)
    (box_at box1 pos_107)

    ; free positions: all except pos_107 (box occupies pos_107 so it's not free)
    (free pos_1) (free pos_2) (free pos_3) (free pos_4) (free pos_5) (free pos_6) (free pos_7) (free pos_8) (free pos_9) (free pos_10)
    (free pos_11) (free pos_12) (free pos_13) (free pos_14) (free pos_15) (free pos_16) (free pos_17) (free pos_18) (free pos_19) (free pos_20)
    (free pos_21) (free pos_22) (free pos_23) (free pos_24) (free pos_25) (free pos_26) (free pos_27) (free pos_28) (free pos_29) (free pos_30)
    (free pos_31) (free pos_32) (free pos_33) (free pos_34) (free pos_35) (free pos_36) (free pos_37) (free pos_38) (free pos_39) (free pos_40)
    (free pos_41) (free pos_42) (free pos_43) (free pos_44) (free pos_45) (free pos_46) (free pos_47) (free pos_48) (free pos_49) (free pos_50)
    (free pos_51) (free pos_52) (free pos_53) (free pos_54) (free pos_55) (free pos_56) (free pos_57) (free pos_58) (free pos_59) (free pos_60)
    (free pos_61) (free pos_62) (free pos_63) (free pos_64) (free pos_65) (free pos_66) (free pos_67) (free pos_68) (free pos_69) (free pos_70)
    (free pos_71) (free pos_72) (free pos_73) (free pos_74) (free pos_75) (free pos_76) (free pos_77) (free pos_78) (free pos_79) (free pos_80)
    (free pos_81) (free pos_82) (free pos_83) (free pos_84) (free pos_85) (free pos_86) (free pos_87) (free pos_88) (free pos_89) (free pos_90)
    (free pos_91) (free pos_92) (free pos_93) (free pos_94) (free pos_95) (free pos_96) (free pos_98) (free pos_99) (free pos_100) (free pos_101)
    (free pos_102) (free pos_103) (free pos_104) (free pos_105) (free pos_106) (free pos_108) (free pos_109) (free pos_110) (free pos_111) (free pos_112)
    (free pos_113) (free pos_114) (free pos_115) (free pos_116) (free pos_117) (free pos_118) (free pos_119) (free pos_120) (free pos_121) (free pos_122)
    (free pos_123) (free pos_124) (free pos_125) (free pos_126) (free pos_127) (free pos_128) (free pos_129) (free pos_130) (free pos_131) (free pos_132)
    (free pos_133) (free pos_134) (free pos_135) (free pos_136) (free pos_137) (free pos_138) (free pos_139) (free pos_140) (free pos_141) (free pos_142)
    (free pos_143) (free pos_144) (free pos_145) (free pos_146) (free pos_147) (free pos_148) (free pos_149) (free pos_150) (free pos_151) (free pos_152)
    (free pos_153) (free pos_154) (free pos_155) (free pos_156) (free pos_157) (free pos_158) (free pos_159) (free pos_160) (free pos_161) (free pos_162)
    (free pos_163) (free pos_164) (free pos_165) (free pos_166) (free pos_167) (free pos_168) (free pos_169) (free pos_170) (free pos_171) (free pos_172)
    (free pos_173) (free pos_174) (free pos_175) (free pos_176) (free pos_177) (free pos_178) (free pos_179) (free pos_180) (free pos_181) (free pos_182)
    (free pos_183) (free pos_184) (free pos_185) (free pos_186) (free pos_187) (free pos_188) (free pos_189) (free pos_190) (free pos_191) (free pos_192)
    (free pos_193) (free pos_194) (free pos_195) (free pos_196) (free pos_197) (free pos_198) (free pos_199) (free pos_200) (free pos_201) (free pos_202)
    (free pos_203) (free pos_204) (free pos_205) (free pos_206) (free pos_207) (free pos_208) (free pos_209) (free pos_210) (free pos_211)
  )

  (:goal (and (box_at box1 pos_1)))
)