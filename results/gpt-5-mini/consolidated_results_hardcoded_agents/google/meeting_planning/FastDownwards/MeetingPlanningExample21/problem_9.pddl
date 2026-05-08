(define (problem meet-margaret-problem)
  (:domain meet-margaret-sf)
  (:objects
    mission_district haight_ashbury - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69
    t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 t88 t89
    t90 t91 t92 t93 t94 t95 t96 t97 t98 t99
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
    t400 t401 t402 t403 t404 t405 - time
  )
  (:init
    ;; Start at Mission District at 09:00 represented by t0
    (current_time t0)
    (at mission_district)

    ;; Successor chain for contiguous 1-minute timesteps from t0 (09:00) to t405 (15:45)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35)
    (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45)
    (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49) (next t49 t50)
    (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55)
    (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59) (next t59 t60)
    (next t60 t61) (next t61 t62) (next t62 t63) (next t63 t64) (next t64 t65)
    (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69) (next t69 t70)
    (next t70 t71) (next t71 t72) (next t72 t73) (next t73 t74) (next t74 t75)
    (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79) (next t79 t80)
    (next t80 t81) (next t81 t82) (next t82 t83) (next t83 t84) (next t84 t85)
    (next t85 t86) (next t86 t87) (next t87 t88) (next t88 t89) (next t89 t90)
    (next t90 t91) (next t91 t92) (next t92 t93) (next t93 t94) (next t94 t95)
    (next t95 t96) (next t96 t97) (next t97 t98) (next t98 t99) (next t99 t100)
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

    ;; Margaret availability facts for the entire planning horizon (09:00..15:45) — Margaret present throughout this interval.
    (available_margaret t0) (available_margaret t1) (available_margaret t2) (available_margaret t3)
    (available_margaret t4) (available_margaret t5) (available_margaret t6) (available_margaret t7)
    (available_margaret t8) (available_margaret t9) (available_margaret t10) (available_margaret t11)
    (available_margaret t12) (available_margaret t13) (available_margaret t14) (available_margaret t15)
    (available_margaret t16) (available_margaret t17) (available_margaret t18) (available_margaret t19)
    (available_margaret t20) (available_margaret t21) (available_margaret t22) (available_margaret t23)
    (available_margaret t24) (available_margaret t25) (available_margaret t26) (available_margaret t27)
    (available_margaret t28) (available_margaret t29) (available_margaret t30) (available_margaret t31)
    (available_margaret t32) (available_margaret t33) (available_margaret t34) (available_margaret t35)
    (available_margaret t36) (available_margaret t37) (available_margaret t38) (available_margaret t39)
    (available_margaret t40) (available_margaret t41) (available_margaret t42) (available_margaret t43)
    (available_margaret t44) (available_margaret t45) (available_margaret t46) (available_margaret t47)
    (available_margaret t48) (available_margaret t49) (available_margaret t50) (available_margaret t51)
    (available_margaret t52) (available_margaret t53) (available_margaret t54) (available_margaret t55)
    (available_margaret t56) (available_margaret t57) (available_margaret t58) (available_margaret t59)
    (available_margaret t60) (available_margaret t61) (available_margaret t62) (available_margaret t63)
    (available_margaret t64) (available_margaret t65) (available_margaret t66) (available_margaret t67)
    (available_margaret t68) (available_margaret t69) (available_margaret t70) (available_margaret t71)
    (available_margaret t72) (available_margaret t73) (available_margaret t74) (available_margaret t75)
    (available_margaret t76) (available_margaret t77) (available_margaret t78) (available_margaret t79)
    (available_margaret t80) (available_margaret t81) (available_margaret t82) (available_margaret t83)
    (available_margaret t84) (available_margaret t85) (available_margaret t86) (available_margaret t87)
    (available_margaret t88) (available_margaret t89) (available_margaret t90) (available_margaret t91)
    (available_margaret t92) (available_margaret t93) (available_margaret t94) (available_margaret t95)
    (available_margaret t96) (available_margaret t97) (available_margaret t98) (available_margaret t99)
    (available_margaret t100) (available_margaret t101) (available_margaret t102) (available_margaret t103)
    (available_margaret t104) (available_margaret t105) (available_margaret t106) (available_margaret t107)
    (available_margaret t108) (available_margaret t109) (available_margaret t110) (available_margaret t111)
    (available_margaret t112) (available_margaret t113) (available_margaret t114) (available_margaret t115)
    (available_margaret t116) (available_margaret t117) (available_margaret t118) (available_margaret t119)
    (available_margaret t120) (available_margaret t121) (available_margaret t122) (available_margaret t123)
    (available_margaret t124) (available_margaret t125) (available_margaret t126) (available_margaret t127)
    (available_margaret t128) (available_margaret t129) (available_margaret t130) (available_margaret t131)
    (available_margaret t132) (available_margaret t133) (available_margaret t134) (available_margaret t135)
    (available_margaret t136) (available_margaret t137) (available_margaret t138) (available_margaret t139)
    (available_margaret t140) (available_margaret t141) (available_margaret t142) (available_margaret t143)
    (available_margaret t144) (available_margaret t145) (available_margaret t146) (available_margaret t147)
    (available_margaret t148) (available_margaret t149) (available_margaret t150) (available_margaret t151)
    (available_margaret t152) (available_margaret t153) (available_margaret t154) (available_margaret t155)
    (available_margaret t156) (available_margaret t157) (available_margaret t158) (available_margaret t159)
    (available_margaret t160) (available_margaret t161) (available_margaret t162) (available_margaret t163)
    (available_margaret t164) (available_margaret t165) (available_margaret t166) (available_margaret t167)
    (available_margaret t168) (available_margaret t169) (available_margaret t170) (available_margaret t171)
    (available_margaret t172) (available_margaret t173) (available_margaret t174) (available_margaret t175)
    (available_margaret t176) (available_margaret t177) (available_margaret t178) (available_margaret t179)
    (available_margaret t180) (available_margaret t181) (available_margaret t182) (available_margaret t183)
    (available_margaret t184) (available_margaret t185) (available_margaret t186) (available_margaret t187)
    (available_margaret t188) (available_margaret t189) (available_margaret t190) (available_margaret t191)
    (available_margaret t192) (available_margaret t193) (available_margaret t194) (available_margaret t195)
    (available_margaret t196) (available_margaret t197) (available_margaret t198) (available_margaret t199)
    (available_margaret t200) (available_margaret t201) (available_margaret t202) (available_margaret t203)
    (available_margaret t204) (available_margaret t205) (available_margaret t206) (available_margaret t207)
    (available_margaret t208) (available_margaret t209) (available_margaret t210) (available_margaret t211)
    (available_margaret t212) (available_margaret t213) (available_margaret t214) (available_margaret t215)
    (available_margaret t216) (available_margaret t217) (available_margaret t218) (available_margaret t219)
    (available_margaret t220) (available_margaret t221) (available_margaret t222) (available_margaret t223)
    (available_margaret t224) (available_margaret t225) (available_margaret t226) (available_margaret t227)
    (available_margaret t228) (available_margaret t229) (available_margaret t230) (available_margaret t231)
    (available_margaret t232) (available_margaret t233) (available_margaret t234) (available_margaret t235)
    (available_margaret t236) (available_margaret t237) (available_margaret t238) (available_margaret t239)
    (available_margaret t240) (available_margaret t241) (available_margaret t242) (available_margaret t243)
    (available_margaret t244) (available_margaret t245) (available_margaret t246) (available_margaret t247)
    (available_margaret t248) (available_margaret t249) (available_margaret t250) (available_margaret t251)
    (available_margaret t252) (available_margaret t253) (available_margaret t254) (available_margaret t255)
    (available_margaret t256) (available_margaret t257) (available_margaret t258) (available_margaret t259)
    (available_margaret t260) (available_margaret t261) (available_margaret t262) (available_margaret t263)
    (available_margaret t264) (available_margaret t265) (available_margaret t266) (available_margaret t267)
    (available_margaret t268) (available_margaret t269) (available_margaret t270) (available_margaret t271)
    (available_margaret t272) (available_margaret t273) (available_margaret t274) (available_margaret t275)
    (available_margaret t276) (available_margaret t277) (available_margaret t278) (available_margaret t279)
    (available_margaret t280) (available_margaret t281) (available_margaret t282) (available_margaret t283)
    (available_margaret t284) (available_margaret t285) (available_margaret t286) (available_margaret t287)
    (available_margaret t288) (available_margaret t289) (available_margaret t290) (available_margaret t291)
    (available_margaret t292) (available_margaret t293) (available_margaret t294) (available_margaret t295)
    (available_margaret t296) (available_margaret t297) (available_margaret t298) (available_margaret t299)
    (available_margaret t300) (available_margaret t301) (available_margaret t302) (available_margaret t303)
    (available_margaret t304) (available_margaret t305) (available_margaret t306) (available_margaret t307)
    (available_margaret t308) (available_margaret t309) (available_margaret t310) (available_margaret t311)
    (available_margaret t312) (available_margaret t313) (available_margaret t314) (available_margaret t315)
    (available_margaret t316) (available_margaret t317) (available_margaret t318) (available_margaret t319)
    (available_margaret t320) (available_margaret t321) (available_margaret t322) (available_margaret t323)
    (available_margaret t324) (available_margaret t325) (available_margaret t326) (available_margaret t327)
    (available_margaret t328) (available_margaret t329) (available_margaret t330) (available_margaret t331)
    (available_margaret t332) (available_margaret t333) (available_margaret t334) (available_margaret t335)
    (available_margaret t336) (available_margaret t337) (available_margaret t338) (available_margaret t339)
    (available_margaret t340) (available_margaret t341) (available_margaret t342) (available_margaret t343)
    (available_margaret t344) (available_margaret t345) (available_margaret t346) (available_margaret t347)
    (available_margaret t348) (available_margaret t349) (available_margaret t350) (available_margaret t351)
    (available_margaret t352) (available_margaret t353) (available_margaret t354) (available_margaret t355)
    (available_margaret t356) (available_margaret t357) (available_margaret t358) (available_margaret t359)
    (available_margaret t360) (available_margaret t361) (available_margaret t362) (available_margaret t363)
    (available_margaret t364) (available_margaret t365) (available_margaret t366) (available_margaret t367)
    (available_margaret t368) (available_margaret t369) (available_margaret t370) (available_margaret t371)
    (available_margaret t372) (available_margaret t373) (available_margaret t374) (available_margaret t375)
    (available_margaret t376) (available_margaret t377) (available_margaret t378) (available_margaret t379)
    (available_margaret t380) (available_margaret t381) (available_margaret t382) (available_margaret t383)
    (available_margaret t384) (available_margaret t385) (available_margaret t386) (available_margaret t387)
    (available_margaret t388) (available_margaret t389) (available_margaret t390) (available_margaret t391)
    (available_margaret t392) (available_margaret t393) (available_margaret t394) (available_margaret t395)
    (available_margaret t396) (available_margaret t397) (available_margaret t398) (available_margaret t399)
    (available_margaret t400) (available_margaret t401) (available_margaret t402) (available_margaret t403)
    (available_margaret t404) (available_margaret t405)
  )
  ;; Goal: achieve a contiguous 30-minute meeting with Margaret at Haight-Ashbury
  (:goal (and (met_margaret_30)))
)