(define (problem MeetingPlanningExample16-select)
  (:domain schedule-selection)
  (:objects
    schedule_early105 schedule_full375 - schedule
    ; Time slots representing each minute from 15:15 to 21:29 (375 minutes).
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
    t370 t371 t372 t373 t374 - time
  )

  (:init
    ;; Declare all time slots
    ; slot facts
    (slot t0) (slot t1) (slot t2) (slot t3) (slot t4) (slot t5) (slot t6) (slot t7) (slot t8) (slot t9)
    (slot t10) (slot t11) (slot t12) (slot t13) (slot t14) (slot t15) (slot t16) (slot t17) (slot t18) (slot t19)
    (slot t20) (slot t21) (slot t22) (slot t23) (slot t24) (slot t25) (slot t26) (slot t27) (slot t28) (slot t29)
    (slot t30) (slot t31) (slot t32) (slot t33) (slot t34) (slot t35) (slot t36) (slot t37) (slot t38) (slot t39)
    (slot t40) (slot t41) (slot t42) (slot t43) (slot t44) (slot t45) (slot t46) (slot t47) (slot t48) (slot t49)
    (slot t50) (slot t51) (slot t52) (slot t53) (slot t54) (slot t55) (slot t56) (slot t57) (slot t58) (slot t59)
    (slot t60) (slot t61) (slot t62) (slot t63) (slot t64) (slot t65) (slot t66) (slot t67) (slot t68) (slot t69)
    (slot t70) (slot t71) (slot t72) (slot t73) (slot t74) (slot t75) (slot t76) (slot t77) (slot t78) (slot t79)
    (slot t80) (slot t81) (slot t82) (slot t83) (slot t84) (slot t85) (slot t86) (slot t87) (slot t88) (slot t89)
    (slot t90) (slot t91) (slot t92) (slot t93) (slot t94) (slot t95) (slot t96) (slot t97) (slot t98) (slot t99)
    (slot t100) (slot t101) (slot t102) (slot t103) (slot t104) (slot t105) (slot t106) (slot t107) (slot t108) (slot t109)
    (slot t110) (slot t111) (slot t112) (slot t113) (slot t114) (slot t115) (slot t116) (slot t117) (slot t118) (slot t119)
    (slot t120) (slot t121) (slot t122) (slot t123) (slot t124) (slot t125) (slot t126) (slot t127) (slot t128) (slot t129)
    (slot t130) (slot t131) (slot t132) (slot t133) (slot t134) (slot t135) (slot t136) (slot t137) (slot t138) (slot t139)
    (slot t140) (slot t141) (slot t142) (slot t143) (slot t144) (slot t145) (slot t146) (slot t147) (slot t148) (slot t149)
    (slot t150) (slot t151) (slot t152) (slot t153) (slot t154) (slot t155) (slot t156) (slot t157) (slot t158) (slot t159)
    (slot t160) (slot t161) (slot t162) (slot t163) (slot t164) (slot t165) (slot t166) (slot t167) (slot t168) (slot t169)
    (slot t170) (slot t171) (slot t172) (slot t173) (slot t174) (slot t175) (slot t176) (slot t177) (slot t178) (slot t179)
    (slot t180) (slot t181) (slot t182) (slot t183) (slot t184) (slot t185) (slot t186) (slot t187) (slot t188) (slot t189)
    (slot t190) (slot t191) (slot t192) (slot t193) (slot t194) (slot t195) (slot t196) (slot t197) (slot t198) (slot t199)
    (slot t200) (slot t201) (slot t202) (slot t203) (slot t204) (slot t205) (slot t206) (slot t207) (slot t208) (slot t209)
    (slot t210) (slot t211) (slot t212) (slot t213) (slot t214) (slot t215) (slot t216) (slot t217) (slot t218) (slot t219)
    (slot t220) (slot t221) (slot t222) (slot t223) (slot t224) (slot t225) (slot t226) (slot t227) (slot t228) (slot t229)
    (slot t230) (slot t231) (slot t232) (slot t233) (slot t234) (slot t235) (slot t236) (slot t237) (slot t238) (slot t239)
    (slot t240) (slot t241) (slot t242) (slot t243) (slot t244) (slot t245) (slot t246) (slot t247) (slot t248) (slot t249)
    (slot t250) (slot t251) (slot t252) (slot t253) (slot t254) (slot t255) (slot t256) (slot t257) (slot t258) (slot t259)
    (slot t260) (slot t261) (slot t262) (slot t263) (slot t264) (slot t265) (slot t266) (slot t267) (slot t268) (slot t269)
    (slot t270) (slot t271) (slot t272) (slot t273) (slot t274) (slot t275) (slot t276) (slot t277) (slot t278) (slot t279)
    (slot t280) (slot t281) (slot t282) (slot t283) (slot t284) (slot t285) (slot t286) (slot t287) (slot t288) (slot t289)
    (slot t290) (slot t291) (slot t292) (slot t293) (slot t294) (slot t295) (slot t296) (slot t297) (slot t298) (slot t299)
    (slot t300) (slot t301) (slot t302) (slot t303) (slot t304) (slot t305) (slot t306) (slot t307) (slot t308) (slot t309)
    (slot t310) (slot t311) (slot t312) (slot t313) (slot t314) (slot t315) (slot t316) (slot t317) (slot t318) (slot t319)
    (slot t320) (slot t321) (slot t322) (slot t323) (slot t324) (slot t325) (slot t326) (slot t327) (slot t328) (slot t329)
    (slot t330) (slot t331) (slot t332) (slot t333) (slot t334) (slot t335) (slot t336) (slot t337) (slot t338) (slot t339)
    (slot t340) (slot t341) (slot t342) (slot t343) (slot t344) (slot t345) (slot t346) (slot t347) (slot t348) (slot t349)
    (slot t350) (slot t351) (slot t352) (slot t353) (slot t354) (slot t355) (slot t356) (slot t357) (slot t358) (slot t359)
    (slot t360) (slot t361) (slot t362) (slot t363) (slot t364) (slot t365) (slot t366) (slot t367) (slot t368) (slot t369)
    (slot t370) (slot t371) (slot t372) (slot t373) (slot t374)

    ;; Successor relations between consecutive minute slots (t0 is 15:15, t374 is 21:29)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9)
    (succ t9 t10) (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15) (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19)
    (succ t19 t20) (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25) (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29)
    (succ t29 t30) (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35) (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39)
    (succ t39 t40) (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45) (succ t45 t46) (succ t46 t47) (succ t47 t48) (succ t48 t49)
    (succ t49 t50) (succ t50 t51) (succ t51 t52) (succ t52 t53) (succ t53 t54) (succ t54 t55) (succ t55 t56) (succ t56 t57) (succ t57 t58) (succ t58 t59)
    (succ t59 t60) (succ t60 t61) (succ t61 t62) (succ t62 t63) (succ t63 t64) (succ t64 t65) (succ t65 t66) (succ t66 t67) (succ t67 t68) (succ t68 t69)
    (succ t69 t70) (succ t70 t71) (succ t71 t72) (succ t72 t73) (succ t73 t74) (succ t74 t75) (succ t75 t76) (succ t76 t77) (succ t77 t78) (succ t78 t79)
    (succ t79 t80) (succ t80 t81) (succ t81 t82) (succ t82 t83) (succ t83 t84) (succ t84 t85) (succ t85 t86) (succ t86 t87) (succ t87 t88) (succ t88 t89)
    (succ t89 t90) (succ t90 t91) (succ t91 t92) (succ t92 t93) (succ t93 t94) (succ t94 t95) (succ t95 t96) (succ t96 t97) (succ t97 t98) (succ t98 t99)
    (succ t99 t100) (succ t100 t101) (succ t101 t102) (succ t102 t103) (succ t103 t104) (succ t104 t105) (succ t105 t106) (succ t106 t107) (succ t107 t108) (succ t108 t109)
    (succ t109 t110) (succ t110 t111) (succ t111 t112) (succ t112 t113) (succ t113 t114) (succ t114 t115) (succ t115 t116) (succ t116 t117) (succ t117 t118) (succ t118 t119)
    (succ t119 t120) (succ t120 t121) (succ t121 t122) (succ t122 t123) (succ t123 t124) (succ t124 t125) (succ t125 t126) (succ t126 t127) (succ t127 t128) (succ t128 t129)
    (succ t129 t130) (succ t130 t131) (succ t131 t132) (succ t132 t133) (succ t133 t134) (succ t134 t135) (succ t135 t136) (succ t136 t137) (succ t137 t138) (succ t138 t139)
    (succ t139 t140) (succ t140 t141) (succ t141 t142) (succ t142 t143) (succ t143 t144) (succ t144 t145) (succ t145 t146) (succ t146 t147) (succ t147 t148) (succ t148 t149)
    (succ t149 t150) (succ t150 t151) (succ t151 t152) (succ t152 t153) (succ t153 t154) (succ t154 t155) (succ t155 t156) (succ t156 t157) (succ t157 t158) (succ t158 t159)
    (succ t159 t160) (succ t160 t161) (succ t161 t162) (succ t162 t163) (succ t163 t164) (succ t164 t165) (succ t165 t166) (succ t166 t167) (succ t167 t168) (succ t168 t169)
    (succ t169 t170) (succ t170 t171) (succ t171 t172) (succ t172 t173) (succ t173 t174) (succ t174 t175) (succ t175 t176) (succ t176 t177) (succ t177 t178) (succ t178 t179)
    (succ t179 t180) (succ t180 t181) (succ t181 t182) (succ t182 t183) (succ t183 t184) (succ t184 t185) (succ t185 t186) (succ t186 t187) (succ t187 t188) (succ t188 t189)
    (succ t189 t190) (succ t190 t191) (succ t191 t192) (succ t192 t193) (succ t193 t194) (succ t194 t195) (succ t195 t196) (succ t196 t197) (succ t197 t198) (succ t198 t199)
    (succ t199 t200) (succ t200 t201) (succ t201 t202) (succ t202 t203) (succ t203 t204) (succ t204 t205) (succ t205 t206) (succ t206 t207) (succ t207 t208) (succ t208 t209)
    (succ t209 t210) (succ t210 t211) (succ t211 t212) (succ t212 t213) (succ t213 t214) (succ t214 t215) (succ t215 t216) (succ t216 t217) (succ t217 t218) (succ t218 t219)
    (succ t219 t220) (succ t220 t221) (succ t221 t222) (succ t222 t223) (succ t223 t224) (succ t224 t225) (succ t225 t226) (succ t226 t227) (succ t227 t228) (succ t228 t229)
    (succ t229 t230) (succ t230 t231) (succ t231 t232) (succ t232 t233) (succ t233 t234) (succ t234 t235) (succ t235 t236) (succ t236 t237) (succ t237 t238) (succ t238 t239)
    (succ t239 t240) (succ t240 t241) (succ t241 t242) (succ t242 t243) (succ t243 t244) (succ t244 t245) (succ t245 t246) (succ t246 t247) (succ t247 t248) (succ t248 t249)
    (succ t249 t250) (succ t250 t251) (succ t251 t252) (succ t252 t253) (succ t253 t254) (succ t254 t255) (succ t255 t256) (succ t256 t257) (succ t257 t258) (succ t258 t259)
    (succ t259 t260) (succ t260 t261) (succ t261 t262) (succ t262 t263) (succ t263 t264) (succ t264 t265) (succ t265 t266) (succ t266 t267) (succ t267 t268) (succ t268 t269)
    (succ t269 t270) (succ t270 t271) (succ t271 t272) (succ t272 t273) (succ t273 t274) (succ t274 t275) (succ t275 t276) (succ t276 t277) (succ t277 t278) (succ t278 t279)
    (succ t279 t280) (succ t280 t281) (succ t281 t282) (succ t282 t283) (succ t283 t284) (succ t284 t285) (succ t285 t286) (succ t286 t287) (succ t287 t288) (succ t288 t289)
    (succ t289 t290) (succ t290 t291) (succ t291 t292) (succ t292 t293) (succ t293 t294) (succ t294 t295) (succ t295 t296) (succ t296 t297) (succ t297 t298) (succ t298 t299)
    (succ t299 t300) (succ t300 t301) (succ t301 t302) (succ t302 t303) (succ t303 t304) (succ t304 t305) (succ t305 t306) (succ t306 t307) (succ t307 t308) (succ t308 t309)
    (succ t309 t310) (succ t310 t311) (succ t311 t312) (succ t312 t313) (succ t313 t314) (succ t314 t315) (succ t315 t316) (succ t316 t317) (succ t317 t318) (succ t318 t319)
    (succ t319 t320) (succ t320 t321) (succ t321 t322) (succ t322 t323) (succ t323 t324) (succ t324 t325) (succ t325 t326) (succ t326 t327) (succ t327 t328) (succ t328 t329)
    (succ t329 t330) (succ t330 t331) (succ t331 t332) (succ t332 t333) (succ t333 t334) (succ t334 t335) (succ t335 t336) (succ t336 t337) (succ t337 t338) (succ t338 t339)
    (succ t339 t340) (succ t340 t341) (succ t341 t342) (succ t342 t343) (succ t343 t344) (succ t344 t345) (succ t345 t346) (succ t346 t347) (succ t347 t348) (succ t348 t349)
    (succ t349 t350) (succ t350 t351) (succ t351 t352) (succ t352 t353) (succ t353 t354) (succ t354 t355) (succ t355 t356) (succ t356 t357) (succ t357 t358) (succ t358 t359)
    (succ t359 t360) (succ t360 t361) (succ t361 t362) (succ t362 t363) (succ t363 t364) (succ t364 t365) (succ t365 t366) (succ t366 t367) (succ t367 t368) (succ t368 t369)
    (succ t369 t370) (succ t370 t371) (succ t371 t372) (succ t372 t373) (succ t373 t374)

    ;; Audited feasible schedules
    (feasible schedule_early105)
    (feasible schedule_full375)

    ;; Occupied slots for schedule_early105: contiguous 105 minutes starting at 15:15 -> t0..t104
    ; Mark each occupied minute for schedule_early105
    (occupied schedule_early105 t0) (occupied schedule_early105 t1) (occupied schedule_early105 t2) (occupied schedule_early105 t3) (occupied schedule_early105 t4)
    (occupied schedule_early105 t5) (occupied schedule_early105 t6) (occupied schedule_early105 t7) (occupied schedule_early105 t8) (occupied schedule_early105 t9)
    (occupied schedule_early105 t10) (occupied schedule_early105 t11) (occupied schedule_early105 t12) (occupied schedule_early105 t13) (occupied schedule_early105 t14)
    (occupied schedule_early105 t15) (occupied schedule_early105 t16) (occupied schedule_early105 t17) (occupied schedule_early105 t18) (occupied schedule_early105 t19)
    (occupied schedule_early105 t20) (occupied schedule_early105 t21) (occupied schedule_early105 t22) (occupied schedule_early105 t23) (occupied schedule_early105 t24)
    (occupied schedule_early105 t25) (occupied schedule_early105 t26) (occupied schedule_early105 t27) (occupied schedule_early105 t28) (occupied schedule_early105 t29)
    (occupied schedule_early105 t30) (occupied schedule_early105 t31) (occupied schedule_early105 t32) (occupied schedule_early105 t33) (occupied schedule_early105 t34)
    (occupied schedule_early105 t35) (occupied schedule_early105 t36) (occupied schedule_early105 t37) (occupied schedule_early105 t38) (occupied schedule_early105 t39)
    (occupied schedule_early105 t40) (occupied schedule_early105 t41) (occupied schedule_early105 t42) (occupied schedule_early105 t43) (occupied schedule_early105 t44)
    (occupied schedule_early105 t45) (occupied schedule_early105 t46) (occupied schedule_early105 t47) (occupied schedule_early105 t48) (occupied schedule_early105 t49)
    (occupied schedule_early105 t50) (occupied schedule_early105 t51) (occupied schedule_early105 t52) (occupied schedule_early105 t53) (occupied schedule_early105 t54)
    (occupied schedule_early105 t55) (occupied schedule_early105 t56) (occupied schedule_early105 t57) (occupied schedule_early105 t58) (occupied schedule_early105 t59)
    (occupied schedule_early105 t60) (occupied schedule_early105 t61) (occupied schedule_early105 t62) (occupied schedule_early105 t63) (occupied schedule_early105 t64)
    (occupied schedule_early105 t65) (occupied schedule_early105 t66) (occupied schedule_early105 t67) (occupied schedule_early105 t68) (occupied schedule_early105 t69)
    (occupied schedule_early105 t70) (occupied schedule_early105 t71) (occupied schedule_early105 t72) (occupied schedule_early105 t73) (occupied schedule_early105 t74)
    (occupied schedule_early105 t75) (occupied schedule_early105 t76) (occupied schedule_early105 t77) (occupied schedule_early105 t78) (occupied schedule_early105 t79)
    (occupied schedule_early105 t80) (occupied schedule_early105 t81) (occupied schedule_early105 t82) (occupied schedule_early105 t83) (occupied schedule_early105 t84)
    (occupied schedule_early105 t85) (occupied schedule_early105 t86) (occupied schedule_early105 t87) (occupied schedule_early105 t88) (occupied schedule_early105 t89)
    (occupied schedule_early105 t90) (occupied schedule_early105 t91) (occupied schedule_early105 t92) (occupied schedule_early105 t93) (occupied schedule_early105 t94)
    (occupied schedule_early105 t95) (occupied schedule_early105 t96) (occupied schedule_early105 t97) (occupied schedule_early105 t98) (occupied schedule_early105 t99)
    (occupied schedule_early105 t100) (occupied schedule_early105 t101) (occupied schedule_early105 t102) (occupied schedule_early105 t103) (occupied schedule_early105 t104)

    ;; Occupied slots for schedule_full375: contiguous 375 minutes starting at 15:15 -> t0..t374
    ; Mark each occupied minute for schedule_full375
    (occupied schedule_full375 t0) (occupied schedule_full375 t1) (occupied schedule_full375 t2) (occupied schedule_full375 t3) (occupied schedule_full375 t4)
    (occupied schedule_full375 t5) (occupied schedule_full375 t6) (occupied schedule_full375 t7) (occupied schedule_full375 t8) (occupied schedule_full375 t9)
    (occupied schedule_full375 t10) (occupied schedule_full375 t11) (occupied schedule_full375 t12) (occupied schedule_full375 t13) (occupied schedule_full375 t14)
    (occupied schedule_full375 t15) (occupied schedule_full375 t16) (occupied schedule_full375 t17) (occupied schedule_full375 t18) (occupied schedule_full375 t19)
    (occupied schedule_full375 t20) (occupied schedule_full375 t21) (occupied schedule_full375 t22) (occupied schedule_full375 t23) (occupied schedule_full375 t24)
    (occupied schedule_full375 t25) (occupied schedule_full375 t26) (occupied schedule_full375 t27) (occupied schedule_full375 t28) (occupied schedule_full375 t29)
    (occupied schedule_full375 t30) (occupied schedule_full375 t31) (occupied schedule_full375 t32) (occupied schedule_full375 t33) (occupied schedule_full375 t34)
    (occupied schedule_full375 t35) (occupied schedule_full375 t36) (occupied schedule_full375 t37) (occupied schedule_full375 t38) (occupied schedule_full375 t39)
    (occupied schedule_full375 t40) (occupied schedule_full375 t41) (occupied schedule_full375 t42) (occupied schedule_full375 t43) (occupied schedule_full375 t44)
    (occupied schedule_full375 t45) (occupied schedule_full375 t46) (occupied schedule_full375 t47) (occupied schedule_full375 t48) (occupied schedule_full375 t49)
    (occupied schedule_full375 t50) (occupied schedule_full375 t51) (occupied schedule_full375 t52) (occupied schedule_full375 t53) (occupied schedule_full375 t54)
    (occupied schedule_full375 t55) (occupied schedule_full375 t56) (occupied schedule_full375 t57) (occupied schedule_full375 t58) (occupied schedule_full375 t59)
    (occupied schedule_full375 t60) (occupied schedule_full375 t61) (occupied schedule_full375 t62) (occupied schedule_full375 t63) (occupied schedule_full375 t64)
    (occupied schedule_full375 t65) (occupied schedule_full375 t66) (occupied schedule_full375 t67) (occupied schedule_full375 t68) (occupied schedule_full375 t69)
    (occupied schedule_full375 t70) (occupied schedule_full375 t71) (occupied schedule_full375 t72) (occupied schedule_full375 t73) (occupied schedule_full375 t74)
    (occupied schedule_full375 t75) (occupied schedule_full375 t76) (occupied schedule_full375 t77) (occupied schedule_full375 t78) (occupied schedule_full375 t79)
    (occupied schedule_full375 t80) (occupied schedule_full375 t81) (occupied schedule_full375 t82) (occupied schedule_full375 t83) (occupied schedule_full375 t84)
    (occupied schedule_full375 t85) (occupied schedule_full375 t86) (occupied schedule_full375 t87) (occupied schedule_full375 t88) (occupied schedule_full375 t89)
    (occupied schedule_full375 t90) (occupied schedule_full375 t91) (occupied schedule_full375 t92) (occupied schedule_full375 t93) (occupied schedule_full375 t94)
    (occupied schedule_full375 t95) (occupied schedule_full375 t96) (occupied schedule_full375 t97) (occupied schedule_full375 t98) (occupied schedule_full375 t99)
    (occupied schedule_full375 t100) (occupied schedule_full375 t101) (occupied schedule_full375 t102) (occupied schedule_full375 t103) (occupied schedule_full375 t104)
    (occupied schedule_full375 t105) (occupied schedule_full375 t106) (occupied schedule_full375 t107) (occupied schedule_full375 t108) (occupied schedule_full375 t109)
    (occupied schedule_full375 t110) (occupied schedule_full375 t111) (occupied schedule_full375 t112) (occupied schedule_full375 t113) (occupied schedule_full375 t114)
    (occupied schedule_full375 t115) (occupied schedule_full375 t116) (occupied schedule_full375 t117) (occupied schedule_full375 t118) (occupied schedule_full375 t119)
    (occupied schedule_full375 t120) (occupied schedule_full375 t121) (occupied schedule_full375 t122) (occupied schedule_full375 t123) (occupied schedule_full375 t124)
    (occupied schedule_full375 t125) (occupied schedule_full375 t126) (occupied schedule_full375 t127) (occupied schedule_full375 t128) (occupied schedule_full375 t129)
    (occupied schedule_full375 t130) (occupied schedule_full375 t131) (occupied schedule_full375 t132) (occupied schedule_full375 t133) (occupied schedule_full375 t134)
    (occupied schedule_full375 t135) (occupied schedule_full375 t136) (occupied schedule_full375 t137) (occupied schedule_full375 t138) (occupied schedule_full375 t139)
    (occupied schedule_full375 t140) (occupied schedule_full375 t141) (occupied schedule_full375 t142) (occupied schedule_full375 t143) (occupied schedule_full375 t144)
    (occupied schedule_full375 t145) (occupied schedule_full375 t146) (occupied schedule_full375 t147) (occupied schedule_full375 t148) (occupied schedule_full375 t149)
    (occupied schedule_full375 t150) (occupied schedule_full375 t151) (occupied schedule_full375 t152) (occupied schedule_full375 t153) (occupied schedule_full375 t154)
    (occupied schedule_full375 t155) (occupied schedule_full375 t156) (occupied schedule_full375 t157) (occupied schedule_full375 t158) (occupied schedule_full375 t159)
    (occupied schedule_full375 t160) (occupied schedule_full375 t161) (occupied schedule_full375 t162) (occupied schedule_full375 t163) (occupied schedule_full375 t164)
    (occupied schedule_full375 t165) (occupied schedule_full375 t166) (occupied schedule_full375 t167) (occupied schedule_full375 t168) (occupied schedule_full375 t169)
    (occupied schedule_full375 t170) (occupied schedule_full375 t171) (occupied schedule_full375 t172) (occupied schedule_full375 t173) (occupied schedule_full375 t174)
    (occupied schedule_full375 t175) (occupied schedule_full375 t176) (occupied schedule_full375 t177) (occupied schedule_full375 t178) (occupied schedule_full375 t179)
    (occupied schedule_full375 t180) (occupied schedule_full375 t181) (occupied schedule_full375 t182) (occupied schedule_full375 t183) (occupied schedule_full375 t184)
    (occupied schedule_full375 t185) (occupied schedule_full375 t186) (occupied schedule_full375 t187) (occupied schedule_full375 t188) (occupied schedule_full375 t189)
    (occupied schedule_full375 t190) (occupied schedule_full375 t191) (occupied schedule_full375 t192) (occupied schedule_full375 t193) (occupied schedule_full375 t194)
    (occupied schedule_full375 t195) (occupied schedule_full375 t196) (occupied schedule_full375 t197) (occupied schedule_full375 t198) (occupied schedule_full375 t199)
    (occupied schedule_full375 t200) (occupied schedule_full375 t201) (occupied schedule_full375 t202) (occupied schedule_full375 t203) (occupied schedule_full375 t204)
    (occupied schedule_full375 t205) (occupied schedule_full375 t206) (occupied schedule_full375 t207) (occupied schedule_full375 t208) (occupied schedule_full375 t209)
    (occupied schedule_full375 t210) (occupied schedule_full375 t211) (occupied schedule_full375 t212) (occupied schedule_full375 t213) (occupied schedule_full375 t214)
    (occupied schedule_full375 t215) (occupied schedule_full375 t216) (occupied schedule_full375 t217) (occupied schedule_full375 t218) (occupied schedule_full375 t219)
    (occupied schedule_full375 t220) (occupied schedule_full375 t221) (occupied schedule_full375 t222) (occupied schedule_full375 t223) (occupied schedule_full375 t224)
    (occupied schedule_full375 t225) (occupied schedule_full375 t226) (occupied schedule_full375 t227) (occupied schedule_full375 t228) (occupied schedule_full375 t229)
    (occupied schedule_full375 t230) (occupied schedule_full375 t231) (occupied schedule_full375 t232) (occupied schedule_full375 t233) (occupied schedule_full375 t234)
    (occupied schedule_full375 t235) (occupied schedule_full375 t236) (occupied schedule_full375 t237) (occupied schedule_full375 t238) (occupied schedule_full375 t239)
    (occupied schedule_full375 t240) (occupied schedule_full375 t241) (occupied schedule_full375 t242) (occupied schedule_full375 t243) (occupied schedule_full375 t244)
    (occupied schedule_full375 t245) (occupied schedule_full375 t246) (occupied schedule_full375 t247) (occupied schedule_full375 t248) (occupied schedule_full375 t249)
    (occupied schedule_full375 t250) (occupied schedule_full375 t251) (occupied schedule_full375 t252) (occupied schedule_full375 t253) (occupied schedule_full375 t254)
    (occupied schedule_full375 t255) (occupied schedule_full375 t256) (occupied schedule_full375 t257) (occupied schedule_full375 t258) (occupied schedule_full375 t259)
    (occupied schedule_full375 t260) (occupied schedule_full375 t261) (occupied schedule_full375 t262) (occupied schedule_full375 t263) (occupied schedule_full375 t264)
    (occupied schedule_full375 t265) (occupied schedule_full375 t266) (occupied schedule_full375 t267) (occupied schedule_full375 t268) (occupied schedule_full375 t269)
    (occupied schedule_full375 t270) (occupied schedule_full375 t271) (occupied schedule_full375 t272) (occupied schedule_full375 t273) (occupied schedule_full375 t274)
    (occupied schedule_full375 t275) (occupied schedule_full375 t276) (occupied schedule_full375 t277) (occupied schedule_full375 t278) (occupied schedule_full375 t279)
    (occupied schedule_full375 t280) (occupied schedule_full375 t281) (occupied schedule_full375 t282) (occupied schedule_full375 t283) (occupied schedule_full375 t284)
    (occupied schedule_full375 t285) (occupied schedule_full375 t286) (occupied schedule_full375 t287) (occupied schedule_full375 t288) (occupied schedule_full375 t289)
    (occupied schedule_full375 t290) (occupied schedule_full375 t291) (occupied schedule_full375 t292) (occupied schedule_full375 t293) (occupied schedule_full375 t294)
    (occupied schedule_full375 t295) (occupied schedule_full375 t296) (occupied schedule_full375 t297) (occupied schedule_full375 t298) (occupied schedule_full375 t299)
    (occupied schedule_full375 t300) (occupied schedule_full375 t301) (occupied schedule_full375 t302) (occupied schedule_full375 t303) (occupied schedule_full375 t304)
    (occupied schedule_full375 t305) (occupied schedule_full375 t306) (occupied schedule_full375 t307) (occupied schedule_full375 t308) (occupied schedule_full375 t309)
    (occupied schedule_full375 t310) (occupied schedule_full375 t311) (occupied schedule_full375 t312) (occupied schedule_full375 t313) (occupied schedule_full375 t314)
    (occupied schedule_full375 t315) (occupied schedule_full375 t316) (occupied schedule_full375 t317) (occupied schedule_full375 t318) (occupied schedule_full375 t319)
    (occupied schedule_full375 t320) (occupied schedule_full375 t321) (occupied schedule_full375 t322) (occupied schedule_full375 t323) (occupied schedule_full375 t324)
    (occupied schedule_full375 t325) (occupied schedule_full375 t326) (occupied schedule_full375 t327) (occupied schedule_full375 t328) (occupied schedule_full375 t329)
    (occupied schedule_full375 t330) (occupied schedule_full375 t331) (occupied schedule_full375 t332) (occupied schedule_full375 t333) (occupied schedule_full375 t334)
    (occupied schedule_full375 t335) (occupied schedule_full375 t336) (occupied schedule_full375 t337) (occupied schedule_full375 t338) (occupied schedule_full375 t339)
    (occupied schedule_full375 t340) (occupied schedule_full375 t341) (occupied schedule_full375 t342) (occupied schedule_full375 t343) (occupied schedule_full375 t344)
    (occupied schedule_full375 t345) (occupied schedule_full375 t346) (occupied schedule_full375 t347) (occupied schedule_full375 t348) (occupied schedule_full375 t349)
    (occupied schedule_full375 t350) (occupied schedule_full375 t351) (occupied schedule_full375 t352) (occupied schedule_full375 t353) (occupied schedule_full375 t354)
    (occupied schedule_full375 t355) (occupied schedule_full375 t356) (occupied schedule_full375 t357) (occupied schedule_full375 t358) (occupied schedule_full375 t359)
    (occupied schedule_full375 t360) (occupied schedule_full375 t361) (occupied schedule_full375 t362) (occupied schedule_full375 t363) (occupied schedule_full375 t364)
    (occupied schedule_full375 t365) (occupied schedule_full375 t366) (occupied schedule_full375 t367) (occupied schedule_full375 t368) (occupied schedule_full375 t369)
    (occupied schedule_full375 t370) (occupied schedule_full375 t371) (occupied schedule_full375 t372) (occupied schedule_full375 t373) (occupied schedule_full375 t374)

    ;; Both audited schedules meet the 105-minute contiguous requirement by construction.
    (has-contiguous-105 schedule_early105)
    (has-contiguous-105 schedule_full375)

    ;; The audited schedule that maximizes continuous meeting duration is marked best.
    (best schedule_full375)

    ;; Choice is initially open.
    (choice-open)
  )

  ;; Goal: meeting executed AND the selected schedule is the audited best.
  (:goal (and (met-ronald) (selected schedule_full375)))
)