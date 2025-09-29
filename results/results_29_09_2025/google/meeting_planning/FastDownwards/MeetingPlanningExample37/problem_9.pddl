(define (problem schedule-traveler-jeffrey)
  (:domain multi-agent-meeting)
  (:objects
    traveler jeffrey - agent
    bayview financialdistrict - location
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
    t300 - time
  )

  (:init
    (connected bayview bayview)
    (connected bayview financialdistrict)
    (connected financialdistrict bayview)

    (at traveler bayview t0)

    (at jeffrey financialdistrict t195) (at jeffrey financialdistrict t196) (at jeffrey financialdistrict t197) (at jeffrey financialdistrict t198) (at jeffrey financialdistrict t199)
    (at jeffrey financialdistrict t200) (at jeffrey financialdistrict t201) (at jeffrey financialdistrict t202) (at jeffrey financialdistrict t203) (at jeffrey financialdistrict t204)
    (at jeffrey financialdistrict t205) (at jeffrey financialdistrict t206) (at jeffrey financialdistrict t207) (at jeffrey financialdistrict t208) (at jeffrey financialdistrict t209)
    (at jeffrey financialdistrict t210) (at jeffrey financialdistrict t211) (at jeffrey financialdistrict t212) (at jeffrey financialdistrict t213) (at jeffrey financialdistrict t214)
    (at jeffrey financialdistrict t215) (at jeffrey financialdistrict t216) (at jeffrey financialdistrict t217) (at jeffrey financialdistrict t218) (at jeffrey financialdistrict t219)
    (at jeffrey financialdistrict t220) (at jeffrey financialdistrict t221) (at jeffrey financialdistrict t222) (at jeffrey financialdistrict t223) (at jeffrey financialdistrict t224)
    (at jeffrey financialdistrict t225) (at jeffrey financialdistrict t226) (at jeffrey financialdistrict t227) (at jeffrey financialdistrict t228) (at jeffrey financialdistrict t229)
    (at jeffrey financialdistrict t230) (at jeffrey financialdistrict t231) (at jeffrey financialdistrict t232) (at jeffrey financialdistrict t233) (at jeffrey financialdistrict t234)
    (at jeffrey financialdistrict t235) (at jeffrey financialdistrict t236) (at jeffrey financialdistrict t237) (at jeffrey financialdistrict t238) (at jeffrey financialdistrict t239)
    (at jeffrey financialdistrict t240) (at jeffrey financialdistrict t241) (at jeffrey financialdistrict t242) (at jeffrey financialdistrict t243) (at jeffrey financialdistrict t244)
    (at jeffrey financialdistrict t245) (at jeffrey financialdistrict t246) (at jeffrey financialdistrict t247) (at jeffrey financialdistrict t248) (at jeffrey financialdistrict t249)
    (at jeffrey financialdistrict t250) (at jeffrey financialdistrict t251) (at jeffrey financialdistrict t252) (at jeffrey financialdistrict t253) (at jeffrey financialdistrict t254)
    (at jeffrey financialdistrict t255) (at jeffrey financialdistrict t256) (at jeffrey financialdistrict t257) (at jeffrey financialdistrict t258) (at jeffrey financialdistrict t259)
    (at jeffrey financialdistrict t260) (at jeffrey financialdistrict t261) (at jeffrey financialdistrict t262) (at jeffrey financialdistrict t263) (at jeffrey financialdistrict t264)
    (at jeffrey financialdistrict t265) (at jeffrey financialdistrict t266) (at jeffrey financialdistrict t267) (at jeffrey financialdistrict t268) (at jeffrey financialdistrict t269)
    (at jeffrey financialdistrict t270) (at jeffrey financialdistrict t271) (at jeffrey financialdistrict t272) (at jeffrey financialdistrict t273) (at jeffrey financialdistrict t274)
    (at jeffrey financialdistrict t275) (at jeffrey financialdistrict t276) (at jeffrey financialdistrict t277) (at jeffrey financialdistrict t278) (at jeffrey financialdistrict t279)
    (at jeffrey financialdistrict t280) (at jeffrey financialdistrict t281) (at jeffrey financialdistrict t282) (at jeffrey financialdistrict t283) (at jeffrey financialdistrict t284)
    (at jeffrey financialdistrict t285) (at jeffrey financialdistrict t286) (at jeffrey financialdistrict t287) (at jeffrey financialdistrict t288) (at jeffrey financialdistrict t289)
    (at jeffrey financialdistrict t290) (at jeffrey financialdistrict t291) (at jeffrey financialdistrict t292) (at jeffrey financialdistrict t293) (at jeffrey financialdistrict t294)
    (at jeffrey financialdistrict t295) (at jeffrey financialdistrict t296) (at jeffrey financialdistrict t297) (at jeffrey financialdistrict t298) (at jeffrey financialdistrict t299)
    (at jeffrey financialdistrict t300)

    (next1 t0 t1) (next1 t1 t2) (next1 t2 t3) (next1 t3 t4) (next1 t4 t5)
    (next1 t5 t6) (next1 t6 t7) (next1 t7 t8) (next1 t8 t9) (next1 t9 t10)
    (next1 t10 t11) (next1 t11 t12) (next1 t12 t13) (next1 t13 t14) (next1 t14 t15)
    (next1 t15 t16) (next1 t16 t17) (next1 t17 t18) (next1 t18 t19) (next1 t19 t20)
    (next1 t20 t21) (next1 t21 t22) (next1 t22 t23) (next1 t23 t24) (next1 t24 t25)
    (next1 t25 t26) (next1 t26 t27) (next1 t27 t28) (next1 t28 t29) (next1 t29 t30)
    (next1 t30 t31) (next1 t31 t32) (next1 t32 t33) (next1 t33 t34) (next1 t34 t35)
    (next1 t35 t36) (next1 t36 t37) (next1 t37 t38) (next1 t38 t39) (next1 t39 t40)
    (next1 t40 t41) (next1 t41 t42) (next1 t42 t43) (next1 t43 t44) (next1 t44 t45)
    (next1 t45 t46) (next1 t46 t47) (next1 t47 t48) (next1 t48 t49) (next1 t49 t50)
    (next1 t50 t51) (next1 t51 t52) (next1 t52 t53) (next1 t53 t54) (next1 t54 t55)
    (next1 t55 t56) (next1 t56 t57) (next1 t57 t58) (next1 t58 t59) (next1 t59 t60)
    (next1 t60 t61) (next1 t61 t62) (next1 t62 t63) (next1 t63 t64) (next1 t64 t65)
    (next1 t65 t66) (next1 t66 t67) (next1 t67 t68) (next1 t68 t69) (next1 t69 t70)
    (next1 t70 t71) (next1 t71 t72) (next1 t72 t73) (next1 t73 t74) (next1 t74 t75)
    (next1 t75 t76) (next1 t76 t77) (next1 t77 t78) (next1 t78 t79) (next1 t79 t80)
    (next1 t80 t81) (next1 t81 t82) (next1 t82 t83) (next1 t83 t84) (next1 t84 t85)
    (next1 t85 t86) (next1 t86 t87) (next1 t87 t88) (next1 t88 t89) (next1 t89 t90)
    (next1 t90 t91) (next1 t91 t92) (next1 t92 t93) (next1 t93 t94) (next1 t94 t95)
    (next1 t95 t96) (next1 t96 t97) (next1 t97 t98) (next1 t98 t99) (next1 t99 t100)
    (next1 t100 t101) (next1 t101 t102) (next1 t102 t103) (next1 t103 t104) (next1 t104 t105)
    (next1 t105 t106) (next1 t106 t107) (next1 t107 t108) (next1 t108 t109) (next1 t109 t110)
    (next1 t110 t111) (next1 t111 t112) (next1 t112 t113) (next1 t113 t114) (next1 t114 t115)
    (next1 t115 t116) (next1 t116 t117) (next1 t117 t118) (next1 t118 t119) (next1 t119 t120)
    (next1 t120 t121) (next1 t121 t122) (next1 t122 t123) (next1 t123 t124) (next1 t124 t125)
    (next1 t125 t126) (next1 t126 t127) (next1 t127 t128) (next1 t128 t129) (next1 t129 t130)
    (next1 t130 t131) (next1 t131 t132) (next1 t132 t133) (next1 t133 t134) (next1 t134 t135)
    (next1 t135 t136) (next1 t136 t137) (next1 t137 t138) (next1 t138 t139) (next1 t139 t140)
    (next1 t140 t141) (next1 t141 t142) (next1 t142 t143) (next1 t143 t144) (next1 t144 t145)
    (next1 t145 t146) (next1 t146 t147) (next1 t147 t148) (next1 t148 t149) (next1 t149 t150)
    (next1 t150 t151) (next1 t151 t152) (next1 t152 t153) (next1 t153 t154) (next1 t154 t155)
    (next1 t155 t156) (next1 t156 t157) (next1 t157 t158) (next1 t158 t159) (next1 t159 t160)
    (next1 t160 t161) (next1 t161 t162) (next1 t162 t163) (next1 t163 t164) (next1 t164 t165)
    (next1 t165 t166) (next1 t166 t167) (next1 t167 t168) (next1 t168 t169) (next1 t169 t170)
    (next1 t170 t171) (next1 t171 t172) (next1 t172 t173) (next1 t173 t174) (next1 t174 t175)
    (next1 t175 t176) (next1 t176 t177) (next1 t177 t178) (next1 t178 t179) (next1 t179 t180)
    (next1 t180 t181) (next1 t181 t182) (next1 t182 t183) (next1 t183 t184) (next1 t184 t185)
    (next1 t185 t186) (next1 t186 t187) (next1 t187 t188) (next1 t188 t189) (next1 t189 t190)
    (next1 t190 t191) (next1 t191 t192) (next1 t192 t193) (next1 t193 t194) (next1 t194 t195)
    (next1 t195 t196) (next1 t196 t197) (next1 t197 t198) (next1 t198 t199) (next1 t199 t200)
    (next1 t200 t201) (next1 t201 t202) (next1 t202 t203) (next1 t203 t204) (next1 t204 t205)
    (next1 t205 t206) (next1 t206 t207) (next1 t207 t208) (next1 t208 t209) (next1 t209 t210)
    (next1 t210 t211) (next1 t211 t212) (next1 t212 t213) (next1 t213 t214) (next1 t214 t215)
    (next1 t215 t216) (next1 t216 t217) (next1 t217 t218) (next1 t218 t219) (next1 t219 t220)
    (next1 t220 t221) (next1 t221 t222) (next1 t222 t223) (next1 t223 t224) (next1 t224 t225)
    (next1 t225 t226) (next1 t226 t227) (next1 t227 t228) (next1 t228 t229) (next1 t229 t230)
    (next1 t230 t231) (next1 t231 t232) (next1 t232 t233) (next1 t233 t234) (next1 t234 t235)
    (next1 t235 t236) (next1 t236 t237) (next1 t237 t238) (next1 t238 t239) (next1 t239 t240)
    (next1 t240 t241) (next1 t241 t242) (next1 t242 t243) (next1 t243 t244) (next1 t244 t245)
    (next1 t245 t246) (next1 t246 t247) (next1 t247 t248) (next1 t248 t249) (next1 t249 t250)
    (next1 t250 t251) (next1 t251 t252) (next1 t252 t253) (next1 t253 t254) (next1 t254 t255)
    (next1 t255 t256) (next1 t256 t257) (next1 t257 t258) (next1 t258 t259) (next1 t259 t260)
    (next1 t260 t261) (next1 t261 t262) (next1 t262 t263) (next1 t263 t264) (next1 t264 t265)
    (next1 t265 t266) (next1 t266 t267) (next1 t267 t268) (next1 t268 t269) (next1 t269 t270)
    (next1 t270 t271) (next1 t271 t272) (next1 t272 t273) (next1 t273 t274) (next1 t274 t275)
    (next1 t275 t276) (next1 t276 t277) (next1 t277 t278) (next1 t278 t279) (next1 t279 t280)
    (next1 t280 t281) (next1 t281 t282) (next1 t282 t283) (next1 t283 t284) (next1 t284 t285)
    (next1 t285 t286) (next1 t286 t287) (next1 t287 t288) (next1 t288 t289) (next1 t289 t290)
    (next1 t290 t291) (next1 t291 t292) (next1 t292 t293) (next1 t293 t294) (next1 t294 t295)
    (next1 t295 t296) (next1 t296 t297) (next1 t297 t298) (next1 t298 t299) (next1 t299 t300)

    (next19 t0 t19) (next19 t1 t20) (next19 t2 t21) (next19 t3 t22) (next19 t4 t23)
    (next19 t5 t24) (next19 t6 t25) (next19 t7 t26) (next19 t8 t27) (next19 t9 t28)
    (next19 t10 t29) (next19 t11 t30) (next19 t12 t31) (next19 t13 t32) (next19 t14 t33)
    (next19 t15 t34) (next19 t16 t35) (next19 t17 t36) (next19 t18 t37) (next19 t19 t38)
    (next19 t20 t39) (next19 t21 t40) (next19 t22 t41) (next19 t23 t42) (next19 t24 t43)
    (next19 t25 t44) (next19 t26 t45) (next19 t27 t46) (next19 t28 t47) (next19 t29 t48)
    (next19 t30 t49) (next19 t31 t50) (next19 t32 t51) (next19 t33 t52) (next19 t34 t53)
    (next19 t35 t54) (next19 t36 t55) (next19 t37 t56) (next19 t38 t57) (next19 t39 t58)
    (next19 t40 t59) (next19 t41 t60) (next19 t42 t61) (next19 t43 t62) (next19 t44 t63)
    (next19 t45 t64) (next19 t46 t65) (next19 t47 t66) (next19 t48 t67) (next19 t49 t68)
    (next19 t50 t69) (next19 t51 t70) (next19 t52 t71) (next19 t53 t72) (next19 t54 t73)
    (next19 t55 t74) (next19 t56 t75) (next19 t57 t76) (next19 t58 t77) (next19 t59 t78)
    (next19 t60 t79) (next19 t61 t80) (next19 t62 t81) (next19 t63 t82) (next19 t64 t83)
    (next19 t65 t84) (next19 t66 t85) (next19 t67 t86) (next19 t68 t87) (next19 t69 t88)
    (next19 t70 t89) (next19 t71 t90) (next19 t72 t91) (next19 t73 t92) (next19 t74 t93)
    (next19 t75 t94) (next19 t76 t95) (next19 t77 t96) (next19 t78 t97) (next19 t79 t98)
    (next19 t80 t99) (next19 t81 t100) (next19 t82 t101) (next19 t83 t102) (next19 t84 t103)
    (next19 t85 t104) (next19 t86 t105) (next19 t87 t106) (next19 t88 t107) (next19 t89 t108)
    (next19 t90 t109) (next19 t91 t110) (next19 t92 t111) (next19 t93 t112) (next19 t94 t113)
    (next19 t95 t114) (next19 t96 t115) (next19 t97 t116) (next19 t98 t117) (next19 t99 t118)
    (next19 t100 t119) (next19 t101 t120) (next19 t102 t121) (next19 t103 t122) (next19 t104 t123)
    (next19 t105 t124) (next19 t106 t125) (next19 t107 t126) (next19 t108 t127) (next19 t109 t128)
    (next19 t110 t129) (next19 t111 t130) (next19 t112 t131) (next19 t113 t132) (next19 t114 t133)
    (next19 t115 t134) (next19 t116 t135) (next19 t117 t136) (next19 t118 t137) (next19 t119 t138)
    (next19 t120 t139) (next19 t121 t140) (next19 t122 t141) (next19 t123 t142) (next19 t124 t143)
    (next19 t125 t144) (next19 t126 t145) (next19 t127 t146) (next19 t128 t147) (next19 t129 t148)
    (next19 t130 t149) (next19 t131 t150) (next19 t132 t151) (next19 t133 t152) (next19 t134 t153)
    (next19 t135 t154) (next19 t136 t155) (next19 t137 t156) (next19 t138 t157) (next19 t139 t158)
    (next19 t140 t159) (next19 t141 t160) (next19 t142 t161) (next19 t143 t162) (next19 t144 t163)
    (next19 t145 t164) (next19 t146 t165) (next19 t147 t166) (next19 t148 t167) (next19 t149 t168)
    (next19 t150 t169) (next19 t151 t170) (next19 t152 t171) (next19 t153 t172) (next19 t154 t173)
    (next19 t155 t174) (next19 t156 t175) (next19 t157 t176) (next19 t158 t177) (next19 t159 t178)
    (next19 t160 t179) (next19 t161 t180) (next19 t162 t181) (next19 t163 t182) (next19 t164 t183)
    (next19 t165 t184) (next19 t166 t185) (next19 t167 t186) (next19 t168 t187) (next19 t169 t188)
    (next19 t170 t189) (next19 t171 t190) (next19 t172 t191) (next19 t173 t192) (next19 t174 t193)
    (next19 t175 t194) (next19 t176 t195) (next19 t177 t196) (next19 t178 t197) (next19 t179 t198)
    (next19 t180 t199) (next19 t181 t200) (next19 t182 t201) (next19 t183 t202) (next19 t184 t203)
    (next19 t185 t204) (next19 t186 t205) (next19 t187 t206) (next19 t188 t207) (next19 t189 t208)
    (next19 t190 t209) (next19 t191 t210) (next19 t192 t211) (next19 t193 t212) (next19 t194 t213)
    (next19 t195 t214) (next19 t196 t215) (next19 t197 t216) (next19 t198 t217) (next19 t199 t218)
    (next19 t200 t219) (next19 t201 t220) (next19 t202 t221) (next19 t203 t222) (next19 t204 t223)
    (next19 t205 t224) (next19 t206 t225) (next19 t207 t226) (next19 t208 t227) (next19 t209 t228)
    (next19 t210 t229) (next19 t211 t230) (next19 t212 t231) (next19 t213 t232) (next19 t214 t233)
    (next19 t215 t234) (next19 t216 t235) (next19 t217 t236) (next19 t218 t237) (next19 t219 t238)
    (next19 t220 t239) (next19 t221 t240) (next19 t222 t241) (next19 t223 t242) (next19 t224 t243)
    (next19 t225 t244) (next19 t226 t245) (next19 t227 t246) (next19 t228 t247) (next19 t229 t248)
    (next19 t230 t249) (next19 t231 t250) (next19 t232 t251) (next19 t233 t252) (next19 t234 t253)
    (next19 t235 t254) (next19 t236 t255) (next19 t237 t256) (next19 t238 t257) (next19 t239 t258)
    (next19 t240 t259) (next19 t241 t260) (next19 t242 t261) (next19 t243 t262) (next19 t244 t263)
    (next19 t245 t264) (next19 t246 t265) (next19 t247 t266) (next19 t248 t267) (next19 t249 t268)
    (next19 t250 t269) (next19 t251 t270) (next19 t252 t271) (next19 t253 t272) (next19 t254 t273)
    (next19 t255 t274) (next19 t256 t275) (next19 t257 t276) (next19 t258 t277) (next19 t259 t278)
    (next19 t260 t279) (next19 t261 t280) (next19 t262 t281) (next19 t263 t282) (next19 t264 t283)
    (next19 t265 t284) (next19 t266 t285) (next19 t267 t286) (next19 t268 t287) (next19 t269 t288)
    (next19 t270 t289) (next19 t271 t290) (next19 t272 t291) (next19 t273 t292) (next19 t274 t293)
    (next19 t275 t294) (next19 t276 t295) (next19 t277 t296) (next19 t278 t297) (next19 t279 t298)
    (next19 t280 t299) (next19 t281 t300)
  )

  (:goal (and (met traveler jeffrey)))
  (:metric minimize (total-cost))
)