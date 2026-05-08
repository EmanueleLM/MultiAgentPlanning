(define (problem meet-joseph-nobhill-problem)
  (:domain meet-joseph-nobhill)

  (:objects
    ;; minutes from m0 (09:00) through m375 (15:15)
    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 m75 m76 m77 m78 m79
    m80 m81 m82 m83 m84 m85 m86 m87 m88 m89
    m90 m91 m92 m93 m94 m95 m96 m97 m98 m99
    m100 m101 m102 m103 m104 m105 m106 m107 m108 m109
    m110 m111 m112 m113 m114 m115 m116 m117 m118 m119
    m120 m121 m122 m123 m124 m125 m126 m127 m128 m129
    m130 m131 m132 m133 m134 m135 m136 m137 m138 m139
    m140 m141 m142 m143 m144 m145 m146 m147 m148 m149
    m150 m151 m152 m153 m154 m155 m156 m157 m158 m159
    m160 m161 m162 m163 m164 m165 m166 m167 m168 m169
    m170 m171 m172 m173 m174 m175 m176 m177 m178 m179
    m180 m181 m182 m183 m184 m185 m186 m187 m188 m189
    m190 m191 m192 m193 m194 m195 m196 m197 m198 m199
    m200 m201 m202 m203 m204 m205 m206 m207 m208 m209
    m210 m211 m212 m213 m214 m215 m216 m217 m218 m219
    m220 m221 m222 m223 m224 m225 m226 m227 m228 m229
    m230 m231 m232 m233 m234 m235 m236 m237 m238 m239
    m240 m241 m242 m243 m244 m245 m246 m247 m248 m249
    m250 m251 m252 m253 m254 m255 m256 m257 m258 m259
    m260 m261 m262 m263 m264 m265 m266 m267 m268 m269
    m270 m271 m272 m273 m274 m275 m276 m277 m278 m279
    m280 m281 m282 m283 m284 m285 m286 m287 m288 m289
    m290 m291 m292 m293 m294 m295 m296 m297 m298 m299
    m300 m301 m302 m303 m304 m305 m306 m307 m308 m309
    m310 m311 m312 m313 m314 m315 m316 m317 m318 m319
    m320 m321 m322 m323 m324 m325 m326 m327 m328 m329
    m330 m331 m332 m333 m334 m335 m336 m337 m338 m339
    m340 m341 m342 m343 m344 m345 m346 m347 m348 m349
    m350 m351 m352 m353 m354 m355 m356 m357 m358 m359
    m360 m361 m362 m363 m364 m365 m366 m367 m368 m369
    m370 m371 m372 m373 m374 m375 - minute
  )

  (:init
    ;; start at Chinatown at 09:00 (m0)
    (current m0)
    (at chinatown)

    ;; successor (succ1) links for each consecutive minute from m0 to m375
    (succ1 m0 m1) (succ1 m1 m2) (succ1 m2 m3) (succ1 m3 m4) (succ1 m4 m5)
    (succ1 m5 m6) (succ1 m6 m7) (succ1 m7 m8) (succ1 m8 m9) (succ1 m9 m10)
    (succ1 m10 m11) (succ1 m11 m12) (succ1 m12 m13) (succ1 m13 m14) (succ1 m14 m15)
    (succ1 m15 m16) (succ1 m16 m17) (succ1 m17 m18) (succ1 m18 m19) (succ1 m19 m20)
    (succ1 m20 m21) (succ1 m21 m22) (succ1 m22 m23) (succ1 m23 m24) (succ1 m24 m25)
    (succ1 m25 m26) (succ1 m26 m27) (succ1 m27 m28) (succ1 m28 m29) (succ1 m29 m30)
    (succ1 m30 m31) (succ1 m31 m32) (succ1 m32 m33) (succ1 m33 m34) (succ1 m34 m35)
    (succ1 m35 m36) (succ1 m36 m37) (succ1 m37 m38) (succ1 m38 m39) (succ1 m39 m40)
    (succ1 m40 m41) (succ1 m41 m42) (succ1 m42 m43) (succ1 m43 m44) (succ1 m44 m45)
    (succ1 m45 m46) (succ1 m46 m47) (succ1 m47 m48) (succ1 m48 m49) (succ1 m49 m50)
    (succ1 m50 m51) (succ1 m51 m52) (succ1 m52 m53) (succ1 m53 m54) (succ1 m54 m55)
    (succ1 m55 m56) (succ1 m56 m57) (succ1 m57 m58) (succ1 m58 m59) (succ1 m59 m60)
    (succ1 m60 m61) (succ1 m61 m62) (succ1 m62 m63) (succ1 m63 m64) (succ1 m64 m65)
    (succ1 m65 m66) (succ1 m66 m67) (succ1 m67 m68) (succ1 m68 m69) (succ1 m69 m70)
    (succ1 m70 m71) (succ1 m71 m72) (succ1 m72 m73) (succ1 m73 m74) (succ1 m74 m75)
    (succ1 m75 m76) (succ1 m76 m77) (succ1 m77 m78) (succ1 m78 m79) (succ1 m79 m80)
    (succ1 m80 m81) (succ1 m81 m82) (succ1 m82 m83) (succ1 m83 m84) (succ1 m84 m85)
    (succ1 m85 m86) (succ1 m86 m87) (succ1 m87 m88) (succ1 m88 m89) (succ1 m89 m90)
    (succ1 m90 m91) (succ1 m91 m92) (succ1 m92 m93) (succ1 m93 m94) (succ1 m94 m95)
    (succ1 m95 m96) (succ1 m96 m97) (succ1 m97 m98) (succ1 m98 m99) (succ1 m99 m100)
    (succ1 m100 m101) (succ1 m101 m102) (succ1 m102 m103) (succ1 m103 m104) (succ1 m104 m105)
    (succ1 m105 m106) (succ1 m106 m107) (succ1 m107 m108) (succ1 m108 m109) (succ1 m109 m110)
    (succ1 m110 m111) (succ1 m111 m112) (succ1 m112 m113) (succ1 m113 m114) (succ1 m114 m115)
    (succ1 m115 m116) (succ1 m116 m117) (succ1 m117 m118) (succ1 m118 m119) (succ1 m119 m120)
    (succ1 m120 m121) (succ1 m121 m122) (succ1 m122 m123) (succ1 m123 m124) (succ1 m124 m125)
    (succ1 m125 m126) (succ1 m126 m127) (succ1 m127 m128) (succ1 m128 m129) (succ1 m129 m130)
    (succ1 m130 m131) (succ1 m131 m132) (succ1 m132 m133) (succ1 m133 m134) (succ1 m134 m135)
    (succ1 m135 m136) (succ1 m136 m137) (succ1 m137 m138) (succ1 m138 m139) (succ1 m139 m140)
    (succ1 m140 m141) (succ1 m141 m142) (succ1 m142 m143) (succ1 m143 m144) (succ1 m144 m145)
    (succ1 m145 m146) (succ1 m146 m147) (succ1 m147 m148) (succ1 m148 m149) (succ1 m149 m150)
    (succ1 m150 m151) (succ1 m151 m152) (succ1 m152 m153) (succ1 m153 m154) (succ1 m154 m155)
    (succ1 m155 m156) (succ1 m156 m157) (succ1 m157 m158) (succ1 m158 m159) (succ1 m159 m160)
    (succ1 m160 m161) (succ1 m161 m162) (succ1 m162 m163) (succ1 m163 m164) (succ1 m164 m165)
    (succ1 m165 m166) (succ1 m166 m167) (succ1 m167 m168) (succ1 m168 m169) (succ1 m169 m170)
    (succ1 m170 m171) (succ1 m171 m172) (succ1 m172 m173) (succ1 m173 m174) (succ1 m174 m175)
    (succ1 m175 m176) (succ1 m176 m177) (succ1 m177 m178) (succ1 m178 m179) (succ1 m179 m180)
    (succ1 m180 m181) (succ1 m181 m182) (succ1 m182 m183) (succ1 m183 m184) (succ1 m184 m185)
    (succ1 m185 m186) (succ1 m186 m187) (succ1 m187 m188) (succ1 m188 m189) (succ1 m189 m190)
    (succ1 m190 m191) (succ1 m191 m192) (succ1 m192 m193) (succ1 m193 m194) (succ1 m194 m195)
    (succ1 m195 m196) (succ1 m196 m197) (succ1 m197 m198) (succ1 m198 m199) (succ1 m199 m200)
    (succ1 m200 m201) (succ1 m201 m202) (succ1 m202 m203) (succ1 m203 m204) (succ1 m204 m205)
    (succ1 m205 m206) (succ1 m206 m207) (succ1 m207 m208) (succ1 m208 m209) (succ1 m209 m210)
    (succ1 m210 m211) (succ1 m211 m212) (succ1 m212 m213) (succ1 m213 m214) (succ1 m214 m215)
    (succ1 m215 m216) (succ1 m216 m217) (succ1 m217 m218) (succ1 m218 m219) (succ1 m219 m220)
    (succ1 m220 m221) (succ1 m221 m222) (succ1 m222 m223) (succ1 m223 m224) (succ1 m224 m225)
    (succ1 m225 m226) (succ1 m226 m227) (succ1 m227 m228) (succ1 m228 m229) (succ1 m229 m230)
    (succ1 m230 m231) (succ1 m231 m232) (succ1 m232 m233) (succ1 m233 m234) (succ1 m234 m235)
    (succ1 m235 m236) (succ1 m236 m237) (succ1 m237 m238) (succ1 m238 m239) (succ1 m239 m240)
    (succ1 m240 m241) (succ1 m241 m242) (succ1 m242 m243) (succ1 m243 m244) (succ1 m244 m245)
    (succ1 m245 m246) (succ1 m246 m247) (succ1 m247 m248) (succ1 m248 m249) (succ1 m249 m250)
    (succ1 m250 m251) (succ1 m251 m252) (succ1 m252 m253) (succ1 m253 m254) (succ1 m254 m255)
    (succ1 m255 m256) (succ1 m256 m257) (succ1 m257 m258) (succ1 m258 m259) (succ1 m259 m260)
    (succ1 m260 m261) (succ1 m261 m262) (succ1 m262 m263) (succ1 m263 m264) (succ1 m264 m265)
    (succ1 m265 m266) (succ1 m266 m267) (succ1 m267 m268) (succ1 m268 m269) (succ1 m269 m270)
    (succ1 m270 m271) (succ1 m271 m272) (succ1 m272 m273) (succ1 m273 m274) (succ1 m274 m275)
    (succ1 m275 m276) (succ1 m276 m277) (succ1 m277 m278) (succ1 m278 m279) (succ1 m279 m280)
    (succ1 m280 m281) (succ1 m281 m282) (succ1 m282 m283) (succ1 m283 m284) (succ1 m284 m285)
    (succ1 m285 m286) (succ1 m286 m287) (succ1 m287 m288) (succ1 m288 m289) (succ1 m289 m290)
    (succ1 m290 m291) (succ1 m291 m292) (succ1 m292 m293) (succ1 m293 m294) (succ1 m294 m295)
    (succ1 m295 m296) (succ1 m296 m297) (succ1 m297 m298) (succ1 m298 m299) (succ1 m299 m300)
    (succ1 m300 m301) (succ1 m301 m302) (succ1 m302 m303) (succ1 m303 m304) (succ1 m304 m305)
    (succ1 m305 m306) (succ1 m306 m307) (succ1 m307 m308) (succ1 m308 m309) (succ1 m309 m310)
    (succ1 m310 m311) (succ1 m311 m312) (succ1 m312 m313) (succ1 m313 m314) (succ1 m314 m315)
    (succ1 m315 m316) (succ1 m316 m317) (succ1 m317 m318) (succ1 m318 m319) (succ1 m319 m320)
    (succ1 m320 m321) (succ1 m321 m322) (succ1 m322 m323) (succ1 m323 m324) (succ1 m324 m325)
    (succ1 m325 m326) (succ1 m326 m327) (succ1 m327 m328) (succ1 m328 m329) (succ1 m329 m330)
    (succ1 m330 m331) (succ1 m331 m332) (succ1 m332 m333) (succ1 m333 m334) (succ1 m334 m335)
    (succ1 m335 m336) (succ1 m336 m337) (succ1 m337 m338) (succ1 m338 m339) (succ1 m339 m340)
    (succ1 m340 m341) (succ1 m341 m342) (succ1 m342 m343) (succ1 m343 m344) (succ1 m344 m345)
    (succ1 m345 m346) (succ1 m346 m347) (succ1 m347 m348) (succ1 m348 m349) (succ1 m349 m350)
    (succ1 m350 m351) (succ1 m351 m352) (succ1 m352 m353) (succ1 m353 m354) (succ1 m354 m355)
    (succ1 m355 m356) (succ1 m356 m357) (succ1 m357 m358) (succ1 m358 m359) (succ1 m359 m360)
    (succ1 m360 m361) (succ1 m361 m362) (succ1 m362 m363) (succ1 m363 m364) (succ1 m364 m365)
    (succ1 m365 m366) (succ1 m366 m367) (succ1 m367 m368) (succ1 m368 m369) (succ1 m369 m370)
    (succ1 m370 m371) (succ1 m371 m372) (succ1 m372 m373) (succ1 m373 m374) (succ1 m374 m375)

    ;; allowed-meeting-start minutes: Joseph is available 11:30 (m150) through 15:15 (m375).
    ;; A 75-minute meeting must start no earlier than m150 and no later than m300 (so it ends at or before m375).
    (allowed-meeting-start m150) (allowed-meeting-start m151) (allowed-meeting-start m152) (allowed-meeting-start m153) (allowed-meeting-start m154)
    (allowed-meeting-start m155) (allowed-meeting-start m156) (allowed-meeting-start m157) (allowed-meeting-start m158) (allowed-meeting-start m159)
    (allowed-meeting-start m160) (allowed-meeting-start m161) (allowed-meeting-start m162) (allowed-meeting-start m163) (allowed-meeting-start m164)
    (allowed-meeting-start m165) (allowed-meeting-start m166) (allowed-meeting-start m167) (allowed-meeting-start m168) (allowed-meeting-start m169)
    (allowed-meeting-start m170) (allowed-meeting-start m171) (allowed-meeting-start m172) (allowed-meeting-start m173) (allowed-meeting-start m174)
    (allowed-meeting-start m175) (allowed-meeting-start m176) (allowed-meeting-start m177) (allowed-meeting-start m178) (allowed-meeting-start m179)
    (allowed-meeting-start m180) (allowed-meeting-start m181) (allowed-meeting-start m182) (allowed-meeting-start m183) (allowed-meeting-start m184)
    (allowed-meeting-start m185) (allowed-meeting-start m186) (allowed-meeting-start m187) (allowed-meeting-start m188) (allowed-meeting-start m189)
    (allowed-meeting-start m190) (allowed-meeting-start m191) (allowed-meeting-start m192) (allowed-meeting-start m193) (allowed-meeting-start m194)
    (allowed-meeting-start m195) (allowed-meeting-start m196) (allowed-meeting-start m197) (allowed-meeting-start m198) (allowed-meeting-start m199)
    (allowed-meeting-start m200) (allowed-meeting-start m201) (allowed-meeting-start m202) (allowed-meeting-start m203) (allowed-meeting-start m204)
    (allowed-meeting-start m205) (allowed-meeting-start m206) (allowed-meeting-start m207) (allowed-meeting-start m208) (allowed-meeting-start m209)
    (allowed-meeting-start m210) (allowed-meeting-start m211) (allowed-meeting-start m212) (allowed-meeting-start m213) (allowed-meeting-start m214)
    (allowed-meeting-start m215) (allowed-meeting-start m216) (allowed-meeting-start m217) (allowed-meeting-start m218) (allowed-meeting-start m219)
    (allowed-meeting-start m220) (allowed-meeting-start m221) (allowed-meeting-start m222) (allowed-meeting-start m223) (allowed-meeting-start m224)
    (allowed-meeting-start m225) (allowed-meeting-start m226) (allowed-meeting-start m227) (allowed-meeting-start m228) (allowed-meeting-start m229)
    (allowed-meeting-start m230) (allowed-meeting-start m231) (allowed-meeting-start m232) (allowed-meeting-start m233) (allowed-meeting-start m234)
    (allowed-meeting-start m235) (allowed-meeting-start m236) (allowed-meeting-start m237) (allowed-meeting-start m238) (allowed-meeting-start m239)
    (allowed-meeting-start m240) (allowed-meeting-start m241) (allowed-meeting-start m242) (allowed-meeting-start m243) (allowed-meeting-start m244)
    (allowed-meeting-start m245) (allowed-meeting-start m246) (allowed-meeting-start m247) (allowed-meeting-start m248) (allowed-meeting-start m249)
    (allowed-meeting-start m250) (allowed-meeting-start m251) (allowed-meeting-start m252) (allowed-meeting-start m253) (allowed-meeting-start m254)
    (allowed-meeting-start m255) (allowed-meeting-start m256) (allowed-meeting-start m257) (allowed-meeting-start m258) (allowed-meeting-start m259)
    (allowed-meeting-start m260) (allowed-meeting-start m261) (allowed-meeting-start m262) (allowed-meeting-start m263) (allowed-meeting-start m264)
    (allowed-meeting-start m265) (allowed-meeting-start m266) (allowed-meeting-start m267) (allowed-meeting-start m268) (allowed-meeting-start m269)
    (allowed-meeting-start m270) (allowed-meeting-start m271) (allowed-meeting-start m272) (allowed-meeting-start m273) (allowed-meeting-start m274)
    (allowed-meeting-start m275) (allowed-meeting-start m276) (allowed-meeting-start m277) (allowed-meeting-start m278) (allowed-meeting-start m279)
    (allowed-meeting-start m280) (allowed-meeting-start m281) (allowed-meeting-start m282) (allowed-meeting-start m283) (allowed-meeting-start m284)
    (allowed-meeting-start m285) (allowed-meeting-start m286) (allowed-meeting-start m287) (allowed-meeting-start m288) (allowed-meeting-start m289)
    (allowed-meeting-start m290) (allowed-meeting-start m291) (allowed-meeting-start m292) (allowed-meeting-start m293) (allowed-meeting-start m294)
    (allowed-meeting-start m295) (allowed-meeting-start m296) (allowed-meeting-start m297) (allowed-meeting-start m298) (allowed-meeting-start m299)
    (allowed-meeting-start m300)
  )

  (:goal (and
           (met-joseph)
           (at nobhill)
         )
  )
)