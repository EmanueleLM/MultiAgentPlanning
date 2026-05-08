(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player - movable
    box1 - movable
    cell_1_1 cell_1_2 cell_1_3 cell_1_4 cell_1_5 cell_1_6 cell_1_7 cell_1_8 cell_1_9 cell_1_10 cell_1_11 cell_1_12 cell_1_13 cell_1_14 cell_1_15 cell_1_16 cell_1_17 cell_1_18 cell_1_19 cell_1_20 cell_1_21 cell_1_22 cell_1_23 cell_1_24 cell_1_25 cell_1_26 cell_1_27 cell_1_28 cell_1_29 cell_1_30 cell_1_31 cell_1_32 cell_1_33 cell_1_34 cell_1_35 cell_1_36 cell_1_37 cell_1_38 cell_1_39 cell_1_40 cell_1_41 cell_1_42 cell_1_43 cell_1_44 cell_1_45 cell_1_46 cell_1_47 cell_1_48 cell_1_49 cell_1_50 cell_1_51 cell_1_52 cell_1_53 cell_1_54 cell_1_55 cell_1_56 cell_1_57 cell_1_58 cell_1_59 cell_1_60 cell_1_61 cell_1_62 cell_1_63 cell_1_64 cell_1_65 cell_1_66 cell_1_67 cell_1_68 cell_1_69 cell_1_70 cell_1_71 cell_1_72 cell_1_73 cell_1_74 cell_1_75 cell_1_76 cell_1_77 cell_1_78 cell_1_79 cell_1_80 cell_1_81 cell_1_82 cell_1_83 cell_1_84 cell_1_85 cell_1_86 cell_1_87 cell_1_88 cell_1_89 cell_1_90 cell_1_91 cell_1_92 cell_1_93 cell_1_94 cell_1_95 cell_1_96 cell_1_97 cell_1_98 cell_1_99 cell_1_100 cell_1_101 cell_1_102 cell_1_103 cell_1_104 cell_1_105 cell_1_106 cell_1_107 cell_1_108 cell_1_109 cell_1_110 cell_1_111 cell_1_112 cell_1_113 cell_1_114 cell_1_115 cell_1_116 cell_1_117 cell_1_118 cell_1_119 cell_1_120 cell_1_121 cell_1_122 cell_1_123 cell_1_124 cell_1_125 cell_1_126 cell_1_127 cell_1_128 cell_1_129 cell_1_130 cell_1_131 cell_1_132 cell_1_133 cell_1_134 cell_1_135 cell_1_136 cell_1_137 cell_1_138 cell_1_139 cell_1_140 cell_1_141 cell_1_142 cell_1_143 cell_1_144 cell_1_145 cell_1_146 cell_1_147 cell_1_148 cell_1_149 cell_1_150 cell_1_151 cell_1_152 cell_1_153 cell_1_154 cell_1_155 cell_1_156 cell_1_157 cell_1_158 cell_1_159 cell_1_160 cell_1_161 cell_1_162 cell_1_163 cell_1_164 cell_1_165 cell_1_166 cell_1_167 cell_1_168 cell_1_169 cell_1_170 cell_1_171 cell_1_172 cell_1_173 cell_1_174 cell_1_175 cell_1_176 cell_1_177 cell_1_178 cell_1_179 cell_1_180 cell_1_181 cell_1_182 cell_1_183 cell_1_184 cell_1_185 cell_1_186 cell_1_187 cell_1_188 cell_1_189 cell_1_190 cell_1_191 cell_1_192 cell_1_193 cell_1_194 cell_1_195 cell_1_196 cell_1_197 cell_1_198 cell_1_199 cell_1_200 - cell
  )
  (:init
    (at player cell_1_200)
    (at box1 cell_1_49)
    (is_goal cell_1_2)
    (adjacent cell_1_1 cell_1_2) (adjacent cell_1_2 cell_1_1)
    (adjacent cell_1_2 cell_1_3) (adjacent cell_1_3 cell_1_2)
    (adjacent cell_1_3 cell_1_4) (adjacent cell_1_4 cell_1_3)
    (adjacent cell_1_3 cell_1_5) (adjacent cell_1_5 cell_1_3)
    ; all relevant adjacencies
    (clear cell_1_2) (clear cell_1_4) (clear cell_1_5) 
    (clear cell_1_3) (clear cell_1_48)
    (clear cell_1_50) (clear cell_1_199)
    ; and more clears for free spaces, excluding initial box cell
  )
  (:goal
    (at box1 cell_1_2)
  )
)