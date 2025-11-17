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
  )
  ;; Goal: achieve a contiguous 30-minute meeting with Margaret at Haight-Ashbury
  (:goal (and (met_margaret_30)))
)