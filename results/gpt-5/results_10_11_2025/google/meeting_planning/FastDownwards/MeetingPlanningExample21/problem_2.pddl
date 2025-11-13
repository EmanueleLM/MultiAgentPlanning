(define (problem meeting_planning_sf_margaret_instance)
  (:domain meeting_planning_sf_margaret)
  (:objects
    mission_district haight_ashbury - location
    margaret - person
    t000 t001 t002 t003 t004 t005 t006 t007 t008 t009
    t010 t011 t012 t013 t014 t015 t016 t017 t018 t019
    t020 t021 t022 t023 t024 t025 t026 t027 t028 t029
    t030 t031 t032 t033 t034 t035 t036 t037 t038 t039
    t040 t041 t042 t043 t044 t045 t046 t047 t048 t049
    t050 t051 t052 t053 t054 t055 t056 t057 t058 t059
    t060 t061 t062 t063 t064 t065 t066 t067 t068 t069
    t070 t071 t072 t073 t074 t075 t076 t077 t078 t079
    t080 t081 t082 t083 t084 t085 t086 t087 t088 t089
    t090 t091 t092 t093 t094 t095 t096 t097 t098 t099
    t100 t101 t102 t103 t104 t105 t106 t107 t108 t109
    t110 t111 t112 t113 t114 t115 t116 t117 t118 t119
    t120 t121 t122 t123 t124 t125 t126 t127 t128 t129
    t130 t131 t132 t133 t134 t135 t136 t137 t138 t139
    t140 t141 t142 t143 t144 t145 t146 t147 t148 t149
    t150 t151 t152 t153 t154 t155 t156 t157 t158 t159
    t160 t161 t162 t163 t164 t165 t166 t167 t168 t169
    t170 t171 t172 t173 t174 t175 t176 t177 t178 t179
    t180 t181 t182 t183 t184 t185 t186 t187 t188 t189
    t190 t191 t192 t193 t194 t195 t196 t197 t198 t199
    t200 t201 t202 t203 t204 t205 t206 t207 t208 t209
    t210 t211 t212 t213 t214 t215 t216 t217 t218 t219
    t220 t221 t222 t223 t224 t225 t226 t227 t228 t229
    t230 t231 t232 t233 t234 t235 t236 t237 t238 t239
    t240 t241 t242 t243 t244 t245 t246 t247 t248 t249
    t250 t251 t252 t253 t254 t255 t256 t257 t258 t259
    t260 t261 t262 t263 t264 t265 t266 t267 t268 t269
    t270 t271 t272 t273 t274 t275 t276 t277 t278 t279
    t280 t281 t282 t283 t284 t285 t286 t287 t288 t289
    t290 t291 t292 t293 t294 t295 t296 t297 t298 t299
    t300 t301 t302 t303 t304 t305 t306 t307 t308 t309
    t310 t311 t312 t313 t314 t315 t316 t317 t318 t319
    t320 t321 t322 t323 t324 t325 t326 t327 t328 t329
    t330 t331 t332 t333 t334 t335 t336 t337 t338 t339
    t340 t341 t342 t343 t344 t345 t346 t347 t348 t349
    t350 t351 t352 t353 t354 t355 t356 t357 t358 t359
    t360 t361 t362 t363 t364 t365 t366 t367 t368 t369
    t370 t371 t372 t373 t374 t375 t376 t377 t378 t379
    t380 t381 t382 t383 t384 t385 t386 t387 t388 t389
    t390 t391 t392 t393 t394 t395 t396 t397 t398 t399
    t400 t401 t402 t403 t404 t405 - timepoint
  )
  (:init
    (at mission_district)
    (time t000)
    (minute-open)
    (next t000 t001) (next t001 t002) (next t002 t003) (next t003 t004) (next t004 t005)
    (next t005 t006) (next t006 t007) (next t007 t008) (next t008 t009) (next t009 t010)
    (next t010 t011) (next t011 t012) (next t012 t013) (next t013 t014) (next t014 t015)
    (next t015 t016) (next t016 t017) (next t017 t018) (next t018 t019) (next t019 t020)
    (next t020 t021) (next t021 t022) (next t022 t023) (next t023 t024) (next t024 t025)
    (next t025 t026) (next t026 t027) (next t027 t028) (next t028 t029) (next t029 t030)
    (next t030 t031) (next t031 t032) (next t032 t033) (next t033 t034) (next t034 t035)
    (next t035 t036) (next t036 t037) (next t037 t038) (next t038 t039) (next t039 t040)
    (next t040 t041) (next t041 t042) (next t042 t043) (next t043 t044) (next t044 t045)
    (next t045 t046) (next t046 t047) (next t047 t048) (next t048 t049) (next t049 t050)
    (next t050 t051) (next t051 t052) (next t052 t053) (next t053 t054) (next t054 t055)
    (next t055 t056) (next t056 t057) (next t057 t058) (next t058 t059) (next t059 t060)
    (next t060 t061) (next t061 t062) (next t062 t063) (next t063 t064) (next t064 t065)
    (next t065 t066) (next t066 t067) (next t067 t068) (next t068 t069) (next t069 t070)
    (next t070 t071) (next t071 t072) (next t072 t073) (next t073 t074) (next t074 t075)
    (next t075 t076) (next t076 t077) (next t077 t078) (next t078 t079) (next t079 t080)
    (next t080 t081) (next t081 t082) (next t082 t083) (next t083 t084) (next t084 t085)
    (next t085 t086) (next t086 t087) (next t087 t088) (next t088 t089) (next t089 t090)
    (next t090 t091) (next t091 t092) (next t092 t093) (next t093 t094) (next t094 t095)
    (next t095 t096) (next t096 t097) (next t097 t098) (next t098 t099) (next t099 t100)
    (next t100 t101) (next t101 t102) (next t102 t103) (next t103 t104) (next t104 t105)
    (next t105 t106) (next t106 t107) (next t107 t108) (next t108 t109) (next t109 t110)
    (next t110 t111) (next t111 t112) (next t112 t113) (next t113 t114) (next t114 t115)
    (next t115 t116) (next t116 t117) (next t117 t118) (next t118 t119) (next t119 t120)
    (next t120 t121) (next t121 t122) (next t122 t123) (next t123 t124) (next t124 t125)
    (next t125 t126) (next t126 t127) (next t127 t128) (next t128 t129) (next t129 t130)
    (next t130 t131) (next t131 t132) (next t132 t133) (next t133 t134) (next t134 t135)
    (next t135 t136) (next t136 t137) (next t137 t138) (next t138 t139) (next t139 t140)
    (next t140 t141) (next t141 t142) (next t142 t143) (next t143 t144) (next t144 t145)
    (next t145 t146) (next t146 t147) (next t147 t148) (next t148 t149) (next t149 t150)
    (next t150 t151) (next t151 t152) (next t152 t153) (next t153 t154) (next t154 t155)
    (next t155 t156) (next t156 t157) (next t157 t158) (next t158 t159) (next t159 t160)
    (next t160 t161) (next t161 t162) (next t162 t163) (next t163 t164) (next t164 t165)
    (next t165 t166) (next t166 t167) (next t167 t168) (next t168 t169) (next t169 t170)
    (next t170 t171) (next t171 t172) (next t172 t173) (next t173 t174) (next t174 t175)
    (next t175 t176) (next t176 t177) (next t177 t178) (next t178 t179) (next t179 t180)
    (next t180 t181) (next t181 t182) (next t182 t183) (next t183 t184) (next t184 t185)
    (next t185 t186) (next t186 t187) (next t187 t188) (next t188 t189) (next t189 t190)
    (next t190 t191) (next t191 t192) (next t192 t193) (next t193 t194) (next t194 t195)
    (next t195 t196) (next t196 t197) (next t197 t198) (next t198 t199) (next t199 t200)
    (next t200 t201) (next t201 t202) (next t202 t203) (next t203 t204) (next t204 t205)
    (next t205 t206) (next t206 t207) (next t207 t208) (next t208 t209) (next t209 t210)
    (next t210 t211) (next t211 t212) (next t212 t213) (next t213 t214) (next t214 t215)
    (next t215 t216) (next t216 t217) (next t217 t218) (next t218 t219) (next t219 t220)
    (next t220 t221) (next t221 t222) (next t222 t223) (next t223 t224) (next t224 t225)
    (next t225 t226) (next t226 t227) (next t227 t228) (next t228 t229) (next t229 t230)
    (next t230 t231) (next t231 t232) (next t232 t233) (next t233 t234) (next t234 t235)
    (next t235 t236) (next t236 t237) (next t237 t238) (next t238 t239) (next t239 t240)
    (next t240 t241) (next t241 t242) (next t242 t243) (next t243 t244) (next t244 t245)
    (next t245 t246) (next t246 t247) (next t247 t248) (next t248 t249) (next t249 t250)
    (next t250 t251) (next t251 t252) (next t252 t253) (next t253 t254) (next t254 t255)
    (next t255 t256) (next t256 t257) (next t257 t258) (next t258 t259) (next t259 t260)
    (next t260 t261) (next t261 t262) (next t262 t263) (next t263 t264) (next t264 t265)
    (next t265 t266) (next t266 t267) (next t267 t268) (next t268 t269) (next t269 t270)
    (next t270 t271) (next t271 t272) (next t272 t273) (next t273 t274) (next t274 t275)
    (next t275 t276) (next t276 t277) (next t277 t278) (next t278 t279) (next t279 t280)
    (next t280 t281) (next t281 t282) (next t282 t283) (next t283 t284) (next t284 t285)
    (next t285 t286) (next t286 t287) (next t287 t288) (next t288 t289) (next t289 t290)
    (next t290 t291) (next t291 t292) (next t292 t293) (next t293 t294) (next t294 t295)
    (next t295 t296) (next t296 t297) (next t297 t298) (next t298 t299) (next t299 t300)
    (next t300 t301) (next t301 t302) (next t302 t303) (next t303 t304) (next t304 t305)
    (next t305 t306) (next t306 t307) (next t307 t308) (next t308 t309) (next t309 t310)
    (next t310 t311) (next t311 t312) (next t312 t313) (next t313 t314) (next t314 t315)
    (next t315 t316) (next t316 t317) (next t317 t318) (next t318 t319) (next t319 t320)
    (next t320 t321) (next t321 t322) (next t322 t323) (next t323 t324) (next t324 t325)
    (next t325 t326) (next t326 t327) (next t327 t328) (next t328 t329) (next t329 t330)
    (next t330 t331) (next t331 t332) (next t332 t333) (next t333 t334) (next t334 t335)
    (next t335 t336) (next t336 t337) (next t337 t338) (next t338 t339) (next t339 t340)
    (next t340 t341) (next t341 t342) (next t342 t343) (next t343 t344) (next t344 t345)
    (next t345 t346) (next t346 t347) (next t347 t348) (next t348 t349) (next t349 t350)
    (next t350 t351) (next t351 t352) (next t352 t353) (next t353 t354) (next t354 t355)
    (next t355 t356) (next t356 t357) (next t357 t358) (next t358 t359) (next t359 t360)
    (next t360 t361) (next t361 t362) (next t362 t363) (next t363 t364) (next t364 t365)
    (next t365 t366) (next t366 t367) (next t367 t368) (next t368 t369) (next t369 t370)
    (next t370 t371) (next t371 t372) (next t372 t373) (next t373 t374) (next t374 t375)
    (next t375 t376) (next t376 t377) (next t377 t378) (next t378 t379) (next t379 t380)
    (next t380 t381) (next t381 t382) (next t382 t383) (next t383 t384) (next t384 t385)
    (next t385 t386) (next t386 t387) (next t387 t388) (next t388 t389) (next t389 t390)
    (next t390 t391) (next t391 t392) (next t392 t393) (next t393 t394) (next t394 t395)
    (next t395 t396) (next t396 t397) (next t397 t398) (next t398 t399) (next t399 t400)
    (next t400 t401) (next t401 t402) (next t402 t403) (next t403 t404) (next t404 t405)
    (available-margaret t000) (available-margaret t001) (available-margaret t002) (available-margaret t003) (available-margaret t004)
    (available-margaret t005) (available-margaret t006) (available-margaret t007) (available-margaret t008) (available-margaret t009)
    (available-margaret t010) (available-margaret t011) (available-margaret t012) (available-margaret t013) (available-margaret t014)
    (available-margaret t015) (available-margaret t016) (available-margaret t017) (available-margaret t018) (available-margaret t019)
    (available-margaret t020) (available-margaret t021) (available-margaret t022) (available-margaret t023) (available-margaret t024)
    (available-margaret t025) (available-margaret t026) (available-margaret t027) (available-margaret t028) (available-margaret t029)
    (available-margaret t030) (available-margaret t031) (available-margaret t032) (available-margaret t033) (available-margaret t034)
    (available-margaret t035) (available-margaret t036) (available-margaret t037) (available-margaret t038) (available-margaret t039)
    (available-margaret t040) (available-margaret t041) (available-margaret t042) (available-margaret t043) (available-margaret t044)
    (available-margaret t045) (available-margaret t046) (available-margaret t047) (available-margaret t048) (available-margaret t049)
    (available-margaret t050) (available-margaret t051) (available-margaret t052) (available-margaret t053) (available-margaret t054)
    (available-margaret t055) (available-margaret t056) (available-margaret t057) (available-margaret t058) (available-margaret t059)
    (available-margaret t060) (available-margaret t061) (available-margaret t062) (available-margaret t063) (available-margaret t064)
    (available-margaret t065) (available-margaret t066) (available-margaret t067) (available-margaret t068) (available-margaret t069)
    (available-margaret t070) (available-margaret t071) (available-margaret t072) (available-margaret t073) (available-margaret t074)
    (available-margaret t075) (available-margaret t076) (available-margaret t077) (available-margaret t078) (available-margaret t079)
    (available-margaret t080) (available-margaret t081) (available-margaret t082) (available-margaret t083) (available-margaret t084)
    (available-margaret t085) (available-margaret t086) (available-margaret t087) (available-margaret t088) (available-margaret t089)
    (available-margaret t090) (available-margaret t091) (available-margaret t092) (available-margaret t093) (available-margaret t094)
    (available-margaret t095) (available-margaret t096) (available-margaret t097) (available-margaret t098) (available-margaret t099)
    (available-margaret t100) (available-margaret t101) (available-margaret t102) (available-margaret t103) (available-margaret t104)
    (available-margaret t105) (available-margaret t106) (available-margaret t107) (available-margaret t108) (available-margaret t109)
    (available-margaret t110) (available-margaret t111) (available-margaret t112) (available-margaret t113) (available-margaret t114)
    (available-margaret t115) (available-margaret t116) (available-margaret t117) (available-margaret t118) (available-margaret t119)
    (available-margaret t120) (available-margaret t121) (available-margaret t122) (available-margaret t123) (available-margaret t124)
    (available-margaret t125) (available-margaret t126) (available-margaret t127) (available-margaret t128) (available-margaret t129)
    (available-margaret t130) (available-margaret t131) (available-margaret t132) (available-margaret t133) (available-margaret t134)
    (available-margaret t135) (available-margaret t136) (available-margaret t137) (available-margaret t138) (available-margaret t139)
    (available-margaret t140) (available-margaret t141) (available-margaret t142) (available-margaret t143) (available-margaret t144)
    (available-margaret t145) (available-margaret t146) (available-margaret t147) (available-margaret t148) (available-margaret t149)
    (available-margaret t150) (available-margaret t151) (available-margaret t152) (available-margaret t153) (available-margaret t154)
    (available-margaret t155) (available-margaret t156) (available-margaret t157) (available-margaret t158) (available-margaret t159)
    (available-margaret t160) (available-margaret t161) (available-margaret t162) (available-margaret t163) (available-margaret t164)
    (available-margaret t165) (available-margaret t166) (available-margaret t167) (available-margaret t168) (available-margaret t169)
    (available-margaret t170) (available-margaret t171) (available-margaret t172) (available-margaret t173) (available-margaret t174)
    (available-margaret t175) (available-margaret t176) (available-margaret t177) (available-margaret t178) (available-margaret t179)
    (available-margaret t180) (available-margaret t181) (available-margaret t182) (available-margaret t183) (available-margaret t184)
    (available-margaret t185) (available-margaret t186) (available-margaret t187) (available-margaret t188) (available-margaret t189)
    (available-margaret t190) (available-margaret t191) (available-margaret t192) (available-margaret t193) (available-margaret t194)
    (available-margaret t195) (available-margaret t196) (available-margaret t197) (available-margaret t198) (available-margaret t199)
    (available-margaret t200) (available-margaret t201) (available-margaret t202) (available-margaret t203) (available-margaret t204)
    (available-margaret t205) (available-margaret t206) (available-margaret t207) (available-margaret t208) (available-margaret t209)
    (available-margaret t210) (available-margaret t211) (available-margaret t212) (available-margaret t213) (available-margaret t214)
    (available-margaret t215) (available-margaret t216) (available-margaret t217) (available-margaret t218) (available-margaret t219)
    (available-margaret t220) (available-margaret t221) (available-margaret t222) (available-margaret t223) (available-margaret t224)
    (available-margaret t225) (available-margaret t226) (available-margaret t227) (available-margaret t228) (available-margaret t229)
    (available-margaret t230) (available-margaret t231) (available-margaret t232) (available-margaret t233) (available-margaret t234)
    (available-margaret t235) (available-margaret t236) (available-margaret t237) (available-margaret t238) (available-margaret t239)
    (available-margaret t240) (available-margaret t241) (available-margaret t242) (available-margaret t243) (available-margaret t244)
    (available-margaret t245) (available-margaret t246) (available-margaret t247) (available-margaret t248) (available-margaret t249)
    (available-margaret t250) (available-margaret t251) (available-margaret t252) (available-margaret t253) (available-margaret t254)
    (available-margaret t255) (available-margaret t256) (available-margaret t257) (available-margaret t258) (available-margaret t259)
    (available-margaret t260) (available-margaret t261) (available-margaret t262) (available-margaret t263) (available-margaret t264)
    (available-margaret t265) (available-margaret t266) (available-margaret t267) (available-margaret t268) (available-margaret t269)
    (available-margaret t270) (available-margaret t271) (available-margaret t272) (available-margaret t273) (available-margaret t274)
    (available-margaret t275) (available-margaret t276) (available-margaret t277) (available-margaret t278) (available-margaret t279)
    (available-margaret t280) (available-margaret t281) (available-margaret t282) (available-margaret t283) (available-margaret t284)
    (available-margaret t285) (available-margaret t286) (available-margaret t287) (available-margaret t288) (available-margaret t289)
    (available-margaret t290) (available-margaret t291) (available-margaret t292) (available-margaret t293) (available-margaret t294)
    (available-margaret t295) (available-margaret t296) (available-margaret t297) (available-margaret t298) (available-margaret t299)
    (available-margaret t300) (available-margaret t301) (available-margaret t302) (available-margaret t303) (available-margaret t304)
    (available-margaret t305) (available-margaret t306) (available-margaret t307) (available-margaret t308) (available-margaret t309)
    (available-margaret t310) (available-margaret t311) (available-margaret t312) (available-margaret t313) (available-margaret t314)
    (available-margaret t315) (available-margaret t316) (available-margaret t317) (available-margaret t318) (available-margaret t319)
    (available-margaret t320) (available-margaret t321) (available-margaret t322) (available-margaret t323) (available-margaret t324)
    (available-margaret t325) (available-margaret t326) (available-margaret t327) (available-margaret t328) (available-margaret t329)
    (available-margaret t330) (available-margaret t331) (available-margaret t332) (available-margaret t333) (available-margaret t334)
    (available-margaret t335) (available-margaret t336) (available-margaret t337) (available-margaret t338) (available-margaret t339)
    (available-margaret t340) (available-margaret t341) (available-margaret t342) (available-margaret t343) (available-margaret t344)
    (available-margaret t345) (available-margaret t346) (available-margaret t347) (available-margaret t348) (available-margaret t349)
    (available-margaret t350) (available-margaret t351) (available-margaret t352) (available-margaret t353) (available-margaret t354)
    (available-margaret t355) (available-margaret t356) (available-margaret t357) (available-margaret t358) (available-margaret t359)
    (available-margaret t360) (available-margaret t361) (available-margaret t362) (available-margaret t363) (available-margaret t364)
    (available-margaret t365) (available-margaret t366) (available-margaret t367) (available-margaret t368) (available-margaret t369)
    (available-margaret t370) (available-margaret t371) (available-margaret t372) (available-margaret t373) (available-margaret t374)
    (available-margaret t375) (available-margaret t376) (available-margaret t377) (available-margaret t378) (available-margaret t379)
    (available-margaret t380) (available-margaret t381) (available-margaret t382) (available-margaret t383) (available-margaret t384)
    (available-margaret t385) (available-margaret t386) (available-margaret t387) (available-margaret t388) (available-margaret t389)
    (available-margaret t390) (available-margaret t391) (available-margaret t392) (available-margaret t393) (available-margaret t394)
    (available-margaret t395) (available-margaret t396) (available-margaret t397) (available-margaret t398) (available-margaret t399)
    (available-margaret t400) (available-margaret t401) (available-margaret t402) (available-margaret t403) (available-margaret t404)
    (= (total-cost) 0)
  )
  (:goal
    (and
      (met-margaret-30)
    )
  )
  (:metric minimize (total-cost))
)