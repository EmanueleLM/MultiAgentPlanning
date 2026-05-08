(define (problem sokoban_map12_problem)
  (:domain sokoban_map12)

  (:objects
    pos_r2 pos_r3 pos_r4 pos_r5 pos_r6 pos_r7 pos_r8 pos_r9 pos_r10 pos_r11
    pos_r12 pos_r13 pos_r14 pos_r15 pos_r16 pos_r17 pos_r18 pos_r19 pos_r20 pos_r21
    pos_r22 pos_r23 pos_r24 pos_r25 pos_r26 pos_r27 pos_r28 pos_r29 pos_r30 pos_r31
    pos_r32 pos_r33 pos_r34 pos_r35 pos_r36 pos_r37 pos_r38 pos_r39 pos_r40 pos_r41
    pos_r42 pos_r43 pos_r44 pos_r45 pos_r46 pos_r47 pos_r48 pos_r49 pos_r50 pos_r51
    pos_r52 pos_r53 pos_r54 pos_r55 pos_r56 pos_r57 pos_r58 pos_r59 pos_r60 pos_r61
    pos_r62 pos_r63 pos_r64 pos_r65 pos_r66 pos_r67 pos_r68 pos_r69 pos_r70 pos_r71
    pos_r72 pos_r73 pos_r74 pos_r75 pos_r76 pos_r77 pos_r78 pos_r79 pos_r80 pos_r81
    pos_r82 pos_r83 pos_r84 pos_r85 pos_r86 pos_r87 pos_r88 pos_r89 pos_r90 pos_r91
    pos_r92 pos_r93 pos_r94 pos_r95 pos_r96 pos_r97 pos_r98 pos_r99 pos_r100 pos_r101
    pos_r102 pos_r103 pos_r104 pos_r105 pos_r106 pos_r107 pos_r108 pos_r109 pos_r110 pos_r111
    pos_r112 pos_r113 pos_r114 pos_r115 pos_r116 pos_r117 pos_r118 pos_r119 pos_r120 pos_r121
    pos_r122 pos_r123 pos_r124 pos_r125 pos_r126 pos_r127 pos_r128 pos_r129 pos_r130 pos_r131
    pos_r132 pos_r133 pos_r134 pos_r135 pos_r136 pos_r137 pos_r138 pos_r139 pos_r140 pos_r141
    pos_r142 pos_r143 pos_r144 pos_r145 pos_r146 pos_r147 pos_r148 pos_r149 pos_r150 pos_r151
    pos_r152 pos_r153 pos_r154 pos_r155 pos_r156 pos_r157 pos_r158 pos_r159 pos_r160 pos_r161
    pos_r162 pos_r163 pos_r164 pos_r165 pos_r166 pos_r167 pos_r168 pos_r169 pos_r170 pos_r171
    pos_r172 pos_r173 pos_r174 pos_r175 pos_r176 pos_r177 pos_r178 pos_r179 pos_r180 pos_r181
    pos_r182 pos_r183 pos_r184 pos_r185 pos_r186 pos_r187 pos_r188 pos_r189 pos_r190 pos_r191
    pos_r192 pos_r193 pos_r194 pos_r195 pos_r196 pos_r197 pos_r198 pos_r199 pos_r200 pos_r201
    pos_r202 pos_r203 pos_r204 pos_r205 pos_r206 pos_r207 pos_r208 pos_r209 pos_r210 pos_r211
    pos_r212 pos_r213 pos_r214 pos_r215 pos_r216 pos_r217 pos_r218 pos_r219 pos_r220 pos_r221
    pos_r222 pos_r223 pos_r224 pos_r225 pos_r226 pos_r227 pos_r228 pos_r229 pos_r230 pos_r231
    pos_r232 pos_r233 pos_r234 pos_r235 pos_r236 pos_r237 pos_r238 pos_r239 pos_r240 pos_r241
    pos_r242 pos_r243 pos_r244 pos_r245 pos_r246 pos_r247 pos_r248 pos_r249 pos_r250 pos_r251
    pos_r252 pos_r253 pos_r254 pos_r255 pos_r256 pos_r257 pos_r258 pos_r259 pos_r260 pos_r261
    pos_r262 pos_r263 pos_r264 - cell

    box1 - box
    player1 - player
  )

  (:init
    ;; adjacency chain: pos_r2 is above pos_r3, pos_r3 above pos_r4, ..., pos_r263 above pos_r264
    (adjacent_up pos_r2 pos_r3)  (adjacent_up pos_r3 pos_r4)  (adjacent_up pos_r4 pos_r5)
    (adjacent_up pos_r5 pos_r6)  (adjacent_up pos_r6 pos_r7)  (adjacent_up pos_r7 pos_r8)
    (adjacent_up pos_r8 pos_r9)  (adjacent_up pos_r9 pos_r10) (adjacent_up pos_r10 pos_r11)
    (adjacent_up pos_r11 pos_r12) (adjacent_up pos_r12 pos_r13) (adjacent_up pos_r13 pos_r14)
    (adjacent_up pos_r14 pos_r15) (adjacent_up pos_r15 pos_r16) (adjacent_up pos_r16 pos_r17)
    (adjacent_up pos_r17 pos_r18) (adjacent_up pos_r18 pos_r19) (adjacent_up pos_r19 pos_r20)
    (adjacent_up pos_r20 pos_r21) (adjacent_up pos_r21 pos_r22) (adjacent_up pos_r22 pos_r23)
    (adjacent_up pos_r23 pos_r24) (adjacent_up pos_r24 pos_r25) (adjacent_up pos_r25 pos_r26)
    (adjacent_up pos_r26 pos_r27) (adjacent_up pos_r27 pos_r28) (adjacent_up pos_r28 pos_r29)
    (adjacent_up pos_r29 pos_r30) (adjacent_up pos_r30 pos_r31) (adjacent_up pos_r31 pos_r32)
    (adjacent_up pos_r32 pos_r33) (adjacent_up pos_r33 pos_r34) (adjacent_up pos_r34 pos_r35)
    (adjacent_up pos_r35 pos_r36) (adjacent_up pos_r36 pos_r37) (adjacent_up pos_r37 pos_r38)
    (adjacent_up pos_r38 pos_r39) (adjacent_up pos_r39 pos_r40) (adjacent_up pos_r40 pos_r41)
    (adjacent_up pos_r41 pos_r42) (adjacent_up pos_r42 pos_r43) (adjacent_up pos_r43 pos_r44)
    (adjacent_up pos_r44 pos_r45) (adjacent_up pos_r45 pos_r46) (adjacent_up pos_r46 pos_r47)
    (adjacent_up pos_r47 pos_r48) (adjacent_up pos_r48 pos_r49) (adjacent_up pos_r49 pos_r50)
    (adjacent_up pos_r50 pos_r51) (adjacent_up pos_r51 pos_r52) (adjacent_up pos_r52 pos_r53)
    (adjacent_up pos_r53 pos_r54) (adjacent_up pos_r54 pos_r55) (adjacent_up pos_r55 pos_r56)
    (adjacent_up pos_r56 pos_r57) (adjacent_up pos_r57 pos_r58) (adjacent_up pos_r58 pos_r59)
    (adjacent_up pos_r59 pos_r60) (adjacent_up pos_r60 pos_r61) (adjacent_up pos_r61 pos_r62)
    (adjacent_up pos_r62 pos_r63) (adjacent_up pos_r63 pos_r64) (adjacent_up pos_r64 pos_r65)
    (adjacent_up pos_r65 pos_r66) (adjacent_up pos_r66 pos_r67) (adjacent_up pos_r67 pos_r68)
    (adjacent_up pos_r68 pos_r69) (adjacent_up pos_r69 pos_r70) (adjacent_up pos_r70 pos_r71)
    (adjacent_up pos_r71 pos_r72) (adjacent_up pos_r72 pos_r73) (adjacent_up pos_r73 pos_r74)
    (adjacent_up pos_r74 pos_r75) (adjacent_up pos_r75 pos_r76) (adjacent_up pos_r76 pos_r77)
    (adjacent_up pos_r77 pos_r78) (adjacent_up pos_r78 pos_r79) (adjacent_up pos_r79 pos_r80)
    (adjacent_up pos_r80 pos_r81) (adjacent_up pos_r81 pos_r82) (adjacent_up pos_r82 pos_r83)
    (adjacent_up pos_r83 pos_r84) (adjacent_up pos_r84 pos_r85) (adjacent_up pos_r85 pos_r86)
    (adjacent_up pos_r86 pos_r87) (adjacent_up pos_r87 pos_r88) (adjacent_up pos_r88 pos_r89)
    (adjacent_up pos_r89 pos_r90) (adjacent_up pos_r90 pos_r91) (adjacent_up pos_r91 pos_r92)
    (adjacent_up pos_r92 pos_r93) (adjacent_up pos_r93 pos_r94) (adjacent_up pos_r94 pos_r95)
    (adjacent_up pos_r95 pos_r96) (adjacent_up pos_r96 pos_r97) (adjacent_up pos_r97 pos_r98)
    (adjacent_up pos_r98 pos_r99) (adjacent_up pos_r99 pos_r100) (adjacent_up pos_r100 pos_r101)
    (adjacent_up pos_r101 pos_r102) (adjacent_up pos_r102 pos_r103) (adjacent_up pos_r103 pos_r104)
    (adjacent_up pos_r104 pos_r105) (adjacent_up pos_r105 pos_r106) (adjacent_up pos_r106 pos_r107)
    (adjacent_up pos_r107 pos_r108) (adjacent_up pos_r108 pos_r109) (adjacent_up pos_r109 pos_r110)
    (adjacent_up pos_r110 pos_r111) (adjacent_up pos_r111 pos_r112) (adjacent_up pos_r112 pos_r113)
    (adjacent_up pos_r113 pos_r114) (adjacent_up pos_r114 pos_r115) (adjacent_up pos_r115 pos_r116)
    (adjacent_up pos_r116 pos_r117) (adjacent_up pos_r117 pos_r118) (adjacent_up pos_r118 pos_r119)
    (adjacent_up pos_r119 pos_r120) (adjacent_up pos_r120 pos_r121) (adjacent_up pos_r121 pos_r122)
    (adjacent_up pos_r122 pos_r123) (adjacent_up pos_r123 pos_r124) (adjacent_up pos_r124 pos_r125)
    (adjacent_up pos_r125 pos_r126) (adjacent_up pos_r126 pos_r127) (adjacent_up pos_r127 pos_r128)
    (adjacent_up pos_r128 pos_r129) (adjacent_up pos_r129 pos_r130) (adjacent_up pos_r130 pos_r131)
    (adjacent_up pos_r131 pos_r132) (adjacent_up pos_r132 pos_r133) (adjacent_up pos_r133 pos_r134)
    (adjacent_up pos_r134 pos_r135) (adjacent_up pos_r135 pos_r136) (adjacent_up pos_r136 pos_r137)
    (adjacent_up pos_r137 pos_r138) (adjacent_up pos_r138 pos_r139) (adjacent_up pos_r139 pos_r140)
    (adjacent_up pos_r140 pos_r141) (adjacent_up pos_r141 pos_r142) (adjacent_up pos_r142 pos_r143)
    (adjacent_up pos_r143 pos_r144) (adjacent_up pos_r144 pos_r145) (adjacent_up pos_r145 pos_r146)
    (adjacent_up pos_r146 pos_r147) (adjacent_up pos_r147 pos_r148) (adjacent_up pos_r148 pos_r149)
    (adjacent_up pos_r149 pos_r150) (adjacent_up pos_r150 pos_r151) (adjacent_up pos_r151 pos_r152)
    (adjacent_up pos_r152 pos_r153) (adjacent_up pos_r153 pos_r154) (adjacent_up pos_r154 pos_r155)
    (adjacent_up pos_r155 pos_r156) (adjacent_up pos_r156 pos_r157) (adjacent_up pos_r157 pos_r158)
    (adjacent_up pos_r158 pos_r159) (adjacent_up pos_r159 pos_r160) (adjacent_up pos_r160 pos_r161)
    (adjacent_up pos_r161 pos_r162) (adjacent_up pos_r162 pos_r163) (adjacent_up pos_r163 pos_r164)
    (adjacent_up pos_r164 pos_r165) (adjacent_up pos_r165 pos_r166) (adjacent_up pos_r166 pos_r167)
    (adjacent_up pos_r167 pos_r168) (adjacent_up pos_r168 pos_r169) (adjacent_up pos_r169 pos_r170)
    (adjacent_up pos_r170 pos_r171) (adjacent_up pos_r171 pos_r172) (adjacent_up pos_r172 pos_r173)
    (adjacent_up pos_r173 pos_r174) (adjacent_up pos_r174 pos_r175) (adjacent_up pos_r175 pos_r176)
    (adjacent_up pos_r176 pos_r177) (adjacent_up pos_r177 pos_r178) (adjacent_up pos_r178 pos_r179)
    (adjacent_up pos_r179 pos_r180) (adjacent_up pos_r180 pos_r181) (adjacent_up pos_r181 pos_r182)
    (adjacent_up pos_r182 pos_r183) (adjacent_up pos_r183 pos_r184) (adjacent_up pos_r184 pos_r185)
    (adjacent_up pos_r185 pos_r186) (adjacent_up pos_r186 pos_r187) (adjacent_up pos_r187 pos_r188)
    (adjacent_up pos_r188 pos_r189) (adjacent_up pos_r189 pos_r190) (adjacent_up pos_r190 pos_r191)
    (adjacent_up pos_r191 pos_r192) (adjacent_up pos_r192 pos_r193) (adjacent_up pos_r193 pos_r194)
    (adjacent_up pos_r194 pos_r195) (adjacent_up pos_r195 pos_r196) (adjacent_up pos_r196 pos_r197)
    (adjacent_up pos_r197 pos_r198) (adjacent_up pos_r198 pos_r199) (adjacent_up pos_r199 pos_r200)
    (adjacent_up pos_r200 pos_r201) (adjacent_up pos_r201 pos_r202) (adjacent_up pos_r202 pos_r203)
    (adjacent_up pos_r203 pos_r204) (adjacent_up pos_r204 pos_r205) (adjacent_up pos_r205 pos_r206)
    (adjacent_up pos_r206 pos_r207) (adjacent_up pos_r207 pos_r208) (adjacent_up pos_r208 pos_r209)
    (adjacent_up pos_r209 pos_r210) (adjacent_up pos_r210 pos_r211) (adjacent_up pos_r211 pos_r212)
    (adjacent_up pos_r212 pos_r213) (adjacent_up pos_r213 pos_r214) (adjacent_up pos_r214 pos_r215)
    (adjacent_up pos_r215 pos_r216) (adjacent_up pos_r216 pos_r217) (adjacent_up pos_r217 pos_r218)
    (adjacent_up pos_r218 pos_r219) (adjacent_up pos_r219 pos_r220) (adjacent_up pos_r220 pos_r221)
    (adjacent_up pos_r221 pos_r222) (adjacent_up pos_r222 pos_r223) (adjacent_up pos_r223 pos_r224)
    (adjacent_up pos_r224 pos_r225) (adjacent_up pos_r225 pos_r226) (adjacent_up pos_r226 pos_r227)
    (adjacent_up pos_r227 pos_r228) (adjacent_up pos_r228 pos_r229) (adjacent_up pos_r229 pos_r230)
    (adjacent_up pos_r230 pos_r231) (adjacent_up pos_r231 pos_r232) (adjacent_up pos_r232 pos_r233)
    (adjacent_up pos_r233 pos_r234) (adjacent_up pos_r234 pos_r235) (adjacent_up pos_r235 pos_r236)
    (adjacent_up pos_r236 pos_r237) (adjacent_up pos_r237 pos_r238) (adjacent_up pos_r238 pos_r239)
    (adjacent_up pos_r239 pos_r240) (adjacent_up pos_r240 pos_r241) (adjacent_up pos_r241 pos_r242)
    (adjacent_up pos_r242 pos_r243) (adjacent_up pos_r243 pos_r244) (adjacent_up pos_r244 pos_r245)
    (adjacent_up pos_r245 pos_r246) (adjacent_up pos_r246 pos_r247) (adjacent_up pos_r247 pos_r248)
    (adjacent_up pos_r248 pos_r249) (adjacent_up pos_r249 pos_r250) (adjacent_up pos_r250 pos_r251)
    (adjacent_up pos_r251 pos_r252) (adjacent_up pos_r252 pos_r253) (adjacent_up pos_r253 pos_r254)
    (adjacent_up pos_r254 pos_r255) (adjacent_up pos_r255 pos_r256) (adjacent_up pos_r256 pos_r257)
    (adjacent_up pos_r257 pos_r258) (adjacent_up pos_r258 pos_r259) (adjacent_up pos_r259 pos_r260)
    (adjacent_up pos_r260 pos_r261) (adjacent_up pos_r261 pos_r262) (adjacent_up pos_r262 pos_r263)
    (adjacent_up pos_r263 pos_r264)

    ;; initial placements
    (at_box box1 pos_r219)
    (at_player player1 pos_r264)

    ;; free cells: every interior cell except where the box currently is
    ;; (player presence does not affect 'free' which tracks box occupancy)
    (free pos_r2) (free pos_r3) (free pos_r4) (free pos_r5) (free pos_r6) (free pos_r7)
    (free pos_r8) (free pos_r9) (free pos_r10) (free pos_r11) (free pos_r12) (free pos_r13)
    (free pos_r14) (free pos_r15) (free pos_r16) (free pos_r17) (free pos_r18) (free pos_r19)
    (free pos_r20) (free pos_r21) (free pos_r22) (free pos_r23) (free pos_r24) (free pos_r25)
    (free pos_r26) (free pos_r27) (free pos_r28) (free pos_r29) (free pos_r30) (free pos_r31)
    (free pos_r32) (free pos_r33) (free pos_r34) (free pos_r35) (free pos_r36) (free pos_r37)
    (free pos_r38) (free pos_r39) (free pos_r40) (free pos_r41) (free pos_r42) (free pos_r43)
    (free pos_r44) (free pos_r45) (free pos_r46) (free pos_r47) (free pos_r48) (free pos_r49)
    (free pos_r50) (free pos_r51) (free pos_r52) (free pos_r53) (free pos_r54) (free pos_r55)
    (free pos_r56) (free pos_r57) (free pos_r58) (free pos_r59) (free pos_r60) (free pos_r61)
    (free pos_r62) (free pos_r63) (free pos_r64) (free pos_r65) (free pos_r66) (free pos_r67)
    (free pos_r68) (free pos_r69) (free pos_r70) (free pos_r71) (free pos_r72) (free pos_r73)
    (free pos_r74) (free pos_r75) (free pos_r76) (free pos_r77) (free pos_r78) (free pos_r79)
    (free pos_r80) (free pos_r81) (free pos_r82) (free pos_r83) (free pos_r84) (free pos_r85)
    (free pos_r86) (free pos_r87) (free pos_r88) (free pos_r89) (free pos_r90) (free pos_r91)
    (free pos_r92) (free pos_r93) (free pos_r94) (free pos_r95) (free pos_r96) (free pos_r97)
    (free pos_r98) (free pos_r99) (free pos_r100) (free pos_r101) (free pos_r102) (free pos_r103)
    (free pos_r104) (free pos_r105) (free pos_r106) (free pos_r107) (free pos_r108) (free pos_r109)
    (free pos_r110) (free pos_r111) (free pos_r112) (free pos_r113) (free pos_r114) (free pos_r115)
    (free pos_r116) (free pos_r117) (free pos_r118) (free pos_r119) (free pos_r120) (free pos_r121)
    (free pos_r122) (free pos_r123) (free pos_r124) (free pos_r125) (free pos_r126) (free pos_r127)
    (free pos_r128) (free pos_r129) (free pos_r130) (free pos_r131) (free pos_r132) (free pos_r133)
    (free pos_r134) (free pos_r135) (free pos_r136) (free pos_r137) (free pos_r138) (free pos_r139)
    (free pos_r140) (free pos_r141) (free pos_r142) (free pos_r143) (free pos_r144) (free pos_r145)
    (free pos_r146) (free pos_r147) (free pos_r148) (free pos_r149) (free pos_r150) (free pos_r151)
    (free pos_r152) (free pos_r153) (free pos_r154) (free pos_r155) (free pos_r156) (free pos_r157)
    (free pos_r158) (free pos_r159) (free pos_r160) (free pos_r161) (free pos_r162) (free pos_r163)
    (free pos_r164) (free pos_r165) (free pos_r166) (free pos_r167) (free pos_r168) (free pos_r169)
    (free pos_r170) (free pos_r171) (free pos_r172) (free pos_r173) (free pos_r174) (free pos_r175)
    (free pos_r176) (free pos_r177) (free pos_r178) (free pos_r179) (free pos_r180) (free pos_r181)
    (free pos_r182) (free pos_r183) (free pos_r184) (free pos_r185) (free pos_r186) (free pos_r187)
    (free pos_r188) (free pos_r189) (free pos_r190) (free pos_r191) (free pos_r192) (free pos_r193)
    (free pos_r194) (free pos_r195) (free pos_r196) (free pos_r197) (free pos_r198) (free pos_r199)
    (free pos_r200) (free pos_r201) (free pos_r202) (free pos_r203) (free pos_r204) (free pos_r205)
    (free pos_r206) (free pos_r207) (free pos_r208) (free pos_r209) (free pos_r210) (free pos_r211)
    (free pos_r212) (free pos_r213) (free pos_r214) (free pos_r215) (free pos_r216) (free pos_r217)
    (free pos_r218) ; pos_r219 is occupied by the box initially
    (free pos_r220) (free pos_r221) (free pos_r222) (free pos_r223) (free pos_r224) (free pos_r225)
    (free pos_r226) (free pos_r227) (free pos_r228) (free pos_r229) (free pos_r230) (free pos_r231)
    (free pos_r232) (free pos_r233) (free pos_r234) (free pos_r235) (free pos_r236) (free pos_r237)
    (free pos_r238) (free pos_r239) (free pos_r240) (free pos_r241) (free pos_r242) (free pos_r243)
    (free pos_r244) (free pos_r245) (free pos_r246) (free pos_r247) (free pos_r248) (free pos_r249)
    (free pos_r250) (free pos_r251) (free pos_r252) (free pos_r253) (free pos_r254) (free pos_r255)
    (free pos_r256) (free pos_r257) (free pos_r258) (free pos_r259) (free pos_r260) (free pos_r261)
    (free pos_r262) (free pos_r263) (free pos_r264)
  )

  (:goal (and
    (at_box box1 pos_r2)
  ))
)