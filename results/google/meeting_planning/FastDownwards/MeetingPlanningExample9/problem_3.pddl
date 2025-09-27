(define (problem meeting-with-mary)
  (:domain meeting-planning)
  (:objects
    visitor mary - agent
    union-square nob-hill - location
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
    t260 - time
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
    c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
    c20 c21 c22 c23 c24 c25 c26 c27 c28 c29
    c30 c31 c32 c33 c34 c35 c36 c37 c38 c39
    c40 c41 c42 c43 c44 c45 c46 c47 c48 c49
    c50 c51 c52 c53 c54 c55 c56 c57 c58 c59
    c60 c61 c62 c63 c64 c65 c66 c67 c68 c69
    c70 c71 c72 c73 c74 c75 - count
  )

  (:init
    (time t0)
    (at visitor union-square)
    (at mary nob-hill)

    ; next relations (minutes)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9)
    (next t9 t10) (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19)
    (next t19 t20) (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29)
    (next t29 t30) (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39)
    (next t39 t40) (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49)
    (next t49 t50) (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59)
    (next t59 t60) (next t60 t61) (next t61 t62) (next t62 t63) (next t63 t64) (next t64 t65) (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69)
    (next t69 t70) (next t70 t71) (next t71 t72) (next t72 t73) (next t73 t74) (next t74 t75) (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79)
    (next t79 t80) (next t80 t81) (next t81 t82) (next t82 t83) (next t83 t84) (next t84 t85) (next t85 t86) (next t86 t87) (next t87 t88) (next t88 t89)
    (next t89 t90) (next t90 t91) (next t91 t92) (next t92 t93) (next t93 t94) (next t94 t95) (next t95 t96) (next t96 t97) (next t97 t98) (next t98 t99)
    (next t99 t100) (next t100 t101) (next t101 t102) (next t102 t103) (next t103 t104) (next t104 t105) (next t105 t106) (next t106 t107) (next t107 t108) (next t108 t109)
    (next t109 t110) (next t110 t111) (next t111 t112) (next t112 t113) (next t113 t114) (next t114 t115) (next t115 t116) (next t116 t117) (next t117 t118) (next t118 t119)
    (next t119 t120) (next t120 t121) (next t121 t122) (next t122 t123) (next t123 t124) (next t124 t125) (next t125 t126) (next t126 t127) (next t127 t128) (next t128 t129)
    (next t129 t130) (next t130 t131) (next t131 t132) (next t132 t133) (next t133 t134) (next t134 t135) (next t135 t136) (next t136 t137) (next t137 t138) (next t138 t139)
    (next t139 t140) (next t140 t141) (next t141 t142) (next t142 t143) (next t143 t144) (next t144 t145) (next t145 t146) (next t146 t147) (next t147 t148) (next t148 t149)
    (next t149 t150) (next t150 t151) (next t151 t152) (next t152 t153) (next t153 t154) (next t154 t155) (next t155 t156) (next t156 t157) (next t157 t158) (next t158 t159)
    (next t159 t160) (next t160 t161) (next t161 t162) (next t162 t163) (next t163 t164) (next t164 t165) (next t165 t166) (next t166 t167) (next t167 t168) (next t168 t169)
    (next t169 t170) (next t170 t171) (next t171 t172) (next t172 t173) (next t173 t174) (next t174 t175) (next t175 t176) (next t176 t177) (next t177 t178) (next t178 t179)
    (next t179 t180) (next t180 t181) (next t181 t182) (next t182 t183) (next t183 t184) (next t184 t185) (next t185 t186) (next t186 t187) (next t187 t188) (next t188 t189)
    (next t189 t190) (next t190 t191) (next t191 t192) (next t192 t193) (next t193 t194) (next t194 t195) (next t195 t196) (next t196 t197) (next t197 t198) (next t198 t199)
    (next t199 t200) (next t200 t201) (next t201 t202) (next t202 t203) (next t203 t204) (next t204 t205) (next t205 t206) (next t206 t207) (next t207 t208) (next t208 t209)
    (next t209 t210) (next t210 t211) (next t211 t212) (next t212 t213) (next t213 t214) (next t214 t215) (next t215 t216) (next t216 t217) (next t217 t218) (next t218 t219)
    (next t219 t220) (next t220 t221) (next t221 t222) (next t222 t223) (next t223 t224) (next t224 t225) (next t225 t226) (next t226 t227) (next t227 t228) (next t228 t229)
    (next t229 t230) (next t230 t231) (next t231 t232) (next t232 t233) (next t233 t234) (next t234 t235) (next t235 t236) (next t236 t237) (next t237 t238) (next t238 t239)
    (next t239 t240) (next t240 t241) (next t241 t242) (next t242 t243) (next t243 t244) (next t244 t245) (next t245 t246) (next t246 t247) (next t247 t248) (next t248 t249)
    (next t249 t250) (next t250 t251) (next t251 t252) (next t252 t253) (next t253 t254) (next t254 t255) (next t255 t256) (next t256 t257) (next t257 t258) (next t258 t259)
    (next t259 t260)

    ; plus9 relations (travel from union-square to nob-hill takes 9 minutes)
    (plus9 t0 t9) (plus9 t1 t10) (plus9 t2 t11) (plus9 t3 t12) (plus9 t4 t13) (plus9 t5 t14) (plus9 t6 t15) (plus9 t7 t16) (plus9 t8 t17) (plus9 t9 t18)
    (plus9 t10 t19) (plus9 t11 t20) (plus9 t12 t21) (plus9 t13 t22) (plus9 t14 t23) (plus9 t15 t24) (plus9 t16 t25) (plus9 t17 t26) (plus9 t18 t27) (plus9 t19 t28)
    (plus9 t20 t29) (plus9 t21 t30) (plus9 t22 t31) (plus9 t23 t32) (plus9 t24 t33) (plus9 t25 t34) (plus9 t26 t35) (plus9 t27 t36) (plus9 t28 t37) (plus9 t29 t38)
    (plus9 t30 t39) (plus9 t31 t40) (plus9 t32 t41) (plus9 t33 t42) (plus9 t34 t43) (plus9 t35 t44) (plus9 t36 t45) (plus9 t37 t46) (plus9 t38 t47) (plus9 t39 t48)
    (plus9 t40 t49) (plus9 t41 t50) (plus9 t42 t51) (plus9 t43 t52) (plus9 t44 t53) (plus9 t45 t54) (plus9 t46 t55) (plus9 t47 t56) (plus9 t48 t57) (plus9 t49 t58)
    (plus9 t50 t59) (plus9 t51 t60) (plus9 t52 t61) (plus9 t53 t62) (plus9 t54 t63) (plus9 t55 t64) (plus9 t56 t65) (plus9 t57 t66) (plus9 t58 t67) (plus9 t59 t68)
    (plus9 t60 t69) (plus9 t61 t70) (plus9 t62 t71) (plus9 t63 t72) (plus9 t64 t73) (plus9 t65 t74) (plus9 t66 t75) (plus9 t67 t76) (plus9 t68 t77) (plus9 t69 t78)
    (plus9 t70 t79) (plus9 t71 t80) (plus9 t72 t81) (plus9 t73 t82) (plus9 t74 t83) (plus9 t75 t84) (plus9 t76 t85) (plus9 t77 t86) (plus9 t78 t87) (plus9 t79 t88)
    (plus9 t80 t89) (plus9 t81 t90) (plus9 t82 t91) (plus9 t83 t92) (plus9 t84 t93) (plus9 t85 t94) (plus9 t86 t95) (plus9 t87 t96) (plus9 t88 t97) (plus9 t89 t98)
    (plus9 t90 t99) (plus9 t91 t100) (plus9 t92 t101) (plus9 t93 t102) (plus9 t94 t103) (plus9 t95 t104) (plus9 t96 t105) (plus9 t97 t106) (plus9 t98 t107) (plus9 t99 t108)
    (plus9 t100 t109) (plus9 t101 t110) (plus9 t102 t111) (plus9 t103 t112) (plus9 t104 t113) (plus9 t105 t114) (plus9 t106 t115) (plus9 t107 t116) (plus9 t108 t117) (plus9 t109 t118)
    (plus9 t110 t119) (plus9 t111 t120) (plus9 t112 t121) (plus9 t113 t122) (plus9 t114 t123) (plus9 t115 t124) (plus9 t116 t125) (plus9 t117 t126) (plus9 t118 t127) (plus9 t119 t128)
    (plus9 t120 t129) (plus9 t121 t130) (plus9 t122 t131) (plus9 t123 t132) (plus9 t124 t133) (plus9 t125 t134) (plus9 t126 t135) (plus9 t127 t136) (plus9 t128 t137) (plus9 t129 t138)
    (plus9 t130 t139) (plus9 t131 t140) (plus9 t132 t141) (plus9 t133 t142) (plus9 t134 t143) (plus9 t135 t144) (plus9 t136 t145) (plus9 t137 t146) (plus9 t138 t147) (plus9 t139 t148)
    (plus9 t140 t149) (plus9 t141 t150) (plus9 t142 t151) (plus9 t143 t152) (plus9 t144 t153) (plus9 t145 t154) (plus9 t146 t155) (plus9 t147 t156) (plus9 t148 t157) (plus9 t149 t158)
    (plus9 t150 t159) (plus9 t151 t160) (plus9 t152 t161) (plus9 t153 t162) (plus9 t154 t163) (plus9 t155 t164) (plus9 t156 t165) (plus9 t157 t166) (plus9 t158 t167) (plus9 t159 t168)
    (plus9 t160 t169) (plus9 t161 t170) (plus9 t162 t171) (plus9 t163 t172) (plus9 t164 t173) (plus9 t165 t174) (plus9 t166 t175) (plus9 t167 t176) (plus9 t168 t177) (plus9 t169 t178)
    (plus9 t170 t179) (plus9 t171 t180) (plus9 t172 t181) (plus9 t173 t182) (plus9 t174 t183) (plus9 t175 t184) (plus9 t176 t185) (plus9 t177 t186) (plus9 t178 t187) (plus9 t179 t188)
    (plus9 t180 t189) (plus9 t181 t190) (plus9 t182 t191) (plus9 t183 t192) (plus9 t184 t193) (plus9 t185 t194) (plus9 t186 t195) (plus9 t187 t196) (plus9 t188 t197) (plus9 t189 t198)
    (plus9 t190 t199) (plus9 t191 t200) (plus9 t192 t201) (plus9 t193 t202) (plus9 t194 t203) (plus9 t195 t204) (plus9 t196 t205) (plus9 t197 t206) (plus9 t198 t207) (plus9 t199 t208)
    (plus9 t200 t209) (plus9 t201 t210) (plus9 t202 t211) (plus9 t203 t212) (plus9 t204 t213) (plus9 t205 t214) (plus9 t206 t215) (plus9 t207 t216) (plus9 t208 t217) (plus9 t209 t218)
    (plus9 t210 t219) (plus9 t211 t220) (plus9 t212 t221) (plus9 t213 t222) (plus9 t214 t223) (plus9 t215 t224) (plus9 t216 t225) (plus9 t217 t226) (plus9 t218 t227) (plus9 t219 t228)
    (plus9 t220 t229) (plus9 t221 t230) (plus9 t222 t231) (plus9 t223 t232) (plus9 t224 t233) (plus9 t225 t234) (plus9 t226 t235) (plus9 t227 t236) (plus9 t228 t237) (plus9 t229 t238)
    (plus9 t230 t239) (plus9 t231 t240) (plus9 t232 t241) (plus9 t233 t242) (plus9 t234 t243) (plus9 t235 t244) (plus9 t236 t245) (plus9 t237 t246) (plus9 t238 t247) (plus9 t239 t248)
    (plus9 t240 t249) (plus9 t241 t250) (plus9 t242 t251) (plus9 t243 t252) (plus9 t244 t253) (plus9 t245 t254) (plus9 t246 t255) (plus9 t247 t256) (plus9 t248 t257) (plus9 t249 t258)
    (plus9 t250 t259) (plus9 t251 t260)

    ; plus7 relations (travel back takes 7 minutes)
    (plus7 t0 t7) (plus7 t1 t8) (plus7 t2 t9) (plus7 t3 t10) (plus7 t4 t11) (plus7 t5 t12) (plus7 t6 t13) (plus7 t7 t14) (plus7 t8 t15) (plus7 t9 t16)
    (plus7 t10 t17) (plus7 t11 t18) (plus7 t12 t19) (plus7 t13 t20) (plus7 t14 t21) (plus7 t15 t22) (plus7 t16 t23) (plus7 t17 t24) (plus7 t18 t25) (plus7 t19 t26)
    (plus7 t20 t27) (plus7 t21 t28) (plus7 t22 t29) (plus7 t23 t30) (plus7 t24 t31) (plus7 t25 t32) (plus7 t26 t33) (plus7 t27 t34) (plus7 t28 t35) (plus7 t29 t36)
    (plus7 t30 t37) (plus7 t31 t38) (plus7 t32 t39) (plus7 t33 t40) (plus7 t34 t41) (plus7 t35 t42) (plus7 t36 t43) (plus7 t37 t44) (plus7 t38 t45) (plus7 t39 t46)
    (plus7 t40 t47) (plus7 t41 t48) (plus7 t42 t49) (plus7 t43 t50) (plus7 t44 t51) (plus7 t45 t52) (plus7 t46 t53) (plus7 t47 t54) (plus7 t48 t55) (plus7 t49 t56)
    (plus7 t50 t57) (plus7 t51 t58) (plus7 t52 t59) (plus7 t53 t60) (plus7 t54 t61) (plus7 t55 t62) (plus7 t56 t63) (plus7 t57 t64) (plus7 t58 t65) (plus7 t59 t66)
    (plus7 t60 t67) (plus7 t61 t68) (plus7 t62 t69) (plus7 t63 t70) (plus7 t64 t71) (plus7 t65 t72) (plus7 t66 t73) (plus7 t67 t74) (plus7 t68 t75) (plus7 t69 t76)
    (plus7 t70 t77) (plus7 t71 t78) (plus7 t72 t79) (plus7 t73 t80) (plus7 t74 t81) (plus7 t75 t82) (plus7 t76 t83) (plus7 t77 t84) (plus7 t78 t85) (plus7 t79 t86)
    (plus7 t80 t87) (plus7 t81 t88) (plus7 t82 t89) (plus7 t83 t90) (plus7 t84 t91) (plus7 t85 t92) (plus7 t86 t93) (plus7 t87 t94) (plus7 t88 t95) (plus7 t89 t96)
    (plus7 t90 t97) (plus7 t91 t98) (plus7 t92 t99) (plus7 t93 t100) (plus7 t94 t101) (plus7 t95 t102) (plus7 t96 t103) (plus7 t97 t104) (plus7 t98 t105) (plus7 t99 t106)
    (plus7 t100 t107) (plus7 t101 t108) (plus7 t102 t109) (plus7 t103 t110) (plus7 t104 t111) (plus7 t105 t112) (plus7 t106 t113) (plus7 t107 t114) (plus7 t108 t115) (plus7 t109 t116)
    (plus7 t110 t117) (plus7 t111 t118) (plus7 t112 t119) (plus7 t113 t120) (plus7 t114 t121) (plus7 t115 t122) (plus7 t116 t123) (plus7 t117 t124) (plus7 t118 t125) (plus7 t119 t126)
    (plus7 t120 t127) (plus7 t121 t128) (plus7 t122 t129) (plus7 t123 t130) (plus7 t124 t131) (plus7 t125 t132) (plus7 t126 t133) (plus7 t127 t134) (plus7 t128 t135) (plus7 t129 t136)
    (plus7 t130 t137) (plus7 t131 t138) (plus7 t132 t139) (plus7 t133 t140) (plus7 t134 t141) (plus7 t135 t142) (plus7 t136 t143) (plus7 t137 t144) (plus7 t138 t145) (plus7 t139 t146)
    (plus7 t140 t147) (plus7 t141 t148) (plus7 t142 t149) (plus7 t143 t150) (plus7 t144 t151) (plus7 t145 t152) (plus7 t146 t153) (plus7 t147 t154) (plus7 t148 t155) (plus7 t149 t156)
    (plus7 t150 t157) (plus7 t151 t158) (plus7 t152 t159) (plus7 t153 t160) (plus7 t154 t161) (plus7 t155 t162) (plus7 t156 t163) (plus7 t157 t164) (plus7 t158 t165) (plus7 t159 t166)
    (plus7 t160 t167) (plus7 t161 t168) (plus7 t162 t169) (plus7 t163 t170) (plus7 t164 t171) (plus7 t165 t172) (plus7 t166 t173) (plus7 t167 t174) (plus7 t168 t175) (plus7 t169 t176)
    (plus7 t170 t177) (plus7 t171 t178) (plus7 t172 t179) (plus7 t173 t180) (plus7 t174 t181) (plus7 t175 t182) (plus7 t176 t183) (plus7 t177 t184) (plus7 t178 t185) (plus7 t179 t186)
    (plus7 t180 t187) (plus7 t181 t188) (plus7 t182 t189) (plus7 t183 t190) (plus7 t184 t191) (plus7 t185 t192) (plus7 t186 t193) (plus7 t187 t194) (plus7 t188 t195) (plus7 t189 t196)
    (plus7 t190 t197) (plus7 t191 t198) (plus7 t192 t199) (plus7 t193 t200) (plus7 t194 t201) (plus7 t195 t202) (plus7 t196 t203) (plus7 t197 t204) (plus7 t198 t205) (plus7 t199 t206)
    (plus7 t200 t207) (plus7 t201 t208) (plus7 t202 t209) (plus7 t203 t210) (plus7 t204 t211) (plus7 t205 t212) (plus7 t206 t213) (plus7 t207 t214) (plus7 t208 t215) (plus7 t209 t216)
    (plus7 t210 t217) (plus7 t211 t218) (plus7 t212 t219) (plus7 t213 t220) (plus7 t214 t221) (plus7 t215 t222) (plus7 t216 t223) (plus7 t217 t224) (plus7 t218 t225) (plus7 t219 t226)
    (plus7 t220 t227) (plus7 t221 t228) (plus7 t222 t229) (plus7 t223 t230) (plus7 t224 t231) (plus7 t225 t232) (plus7 t226 t233) (plus7 t227 t234) (plus7 t228 t235) (plus7 t229 t236)
    (plus7 t230 t237) (plus7 t231 t238) (plus7 t232 t239) (plus7 t233 t240) (plus7 t234 t241) (plus7 t235 t242) (plus7 t236 t243) (plus7 t237 t244) (plus7 t238 t245) (plus7 t239 t246)
    (plus7 t240 t247) (plus7 t241 t248) (plus7 t242 t249) (plus7 t243 t250) (plus7 t244 t251) (plus7 t245 t252) (plus7 t246 t253) (plus7 t247 t254) (plus7 t248 t255) (plus7 t249 t256)
    (plus7 t250 t257) (plus7 t251 t258) (plus7 t252 t259) (plus7 t253 t260)

    ; count increments for meeting minutes
    (nextcount c0 c1) (nextcount c1 c2) (nextcount c2 c3) (nextcount c3 c4) (nextcount c4 c5) (nextcount c5 c6) (nextcount c6 c7) (nextcount c7 c8) (nextcount c8 c9)
    (nextcount c9 c10) (nextcount c10 c11) (nextcount c11 c12) (nextcount c12 c13) (nextcount c13 c14) (nextcount c14 c15) (nextcount c15 c16) (nextcount c16 c17) (nextcount c17 c18)
    (nextcount c18 c19) (nextcount c19 c20) (nextcount c20 c21) (nextcount c21 c22) (nextcount c22 c23) (nextcount c23 c24) (nextcount c24 c25) (nextcount c25 c26) (nextcount c26 c27)
    (nextcount c27 c28) (nextcount c28 c29) (nextcount c29 c30) (nextcount c30 c31) (nextcount c31 c32) (nextcount c32 c33) (nextcount c33 c34) (nextcount c34 c35) (nextcount c35 c36)
    (nextcount c36 c37) (nextcount c37 c38) (nextcount c38 c39) (nextcount c39 c40) (nextcount c40 c41) (nextcount c41 c42) (nextcount c42 c43) (nextcount c43 c44) (nextcount c44 c45)
    (nextcount c45 c46) (nextcount c46 c47) (nextcount c47 c48) (nextcount c48 c49) (nextcount c49 c50) (nextcount c50 c51) (nextcount c51 c52) (nextcount c52 c53) (nextcount c53 c54)
    (nextcount c54 c55) (nextcount c55 c56) (nextcount c56 c57) (nextcount c57 c58) (nextcount c58 c59) (nextcount c59 c60) (nextcount c60 c61) (nextcount c61 c62) (nextcount c62 c63)
    (nextcount c63 c64) (nextcount c64 c65) (nextcount c65 c66) (nextcount c66 c67) (nextcount c67 c68) (nextcount c68 c69) (nextcount c69 c70) (nextcount c70 c71) (nextcount c71 c72)
    (nextcount c72 c73) (nextcount c73 c74) (nextcount c74 c75) (nextcount c75 c75)

    ; Mary's availability: from t180 (12:00) to t255 (sufficient window to allow a 75-minute meeting starting at t180)
    (mary-available t180) (mary-available t181) (mary-available t182) (mary-available t183) (mary-available t184) (mary-available t185) (mary-available t186) (mary-available t187) (mary-available t188) (mary-available t189)
    (mary-available t190) (mary-available t191) (mary-available t192) (mary-available t193) (mary-available t194) (mary-available t195) (mary-available t196) (mary-available t197) (mary-available t198) (mary-available t199)
    (mary-available t200) (mary-available t201) (mary-available t202) (mary-available t203) (mary-available t204) (mary-available t205) (mary-available t206) (mary-available t207) (mary-available t208) (mary-available t209)
    (mary-available t210) (mary-available t211) (mary-available t212) (mary-available t213) (mary-available t214) (mary-available t215) (mary-available t216) (mary-available t217) (mary-available t218) (mary-available t219)
    (mary-available t220) (mary-available t221) (mary-available t222) (mary-available t223) (mary-available t224) (mary-available t225) (mary-available t226) (mary-available t227) (mary-available t228) (mary-available t229)
    (mary-available t230) (mary-available t231) (mary-available t232) (mary-available t233) (mary-available t234) (mary-available t235) (mary-available t236) (mary-available t237) (mary-available t238) (mary-available t239)
    (mary-available t240) (mary-available t241) (mary-available t242) (mary-available t243) (mary-available t244) (mary-available t245) (mary-available t246) (mary-available t247) (mary-available t248) (mary-available t249)
    (mary-available t250) (mary-available t251) (mary-available t252) (mary-available t253) (mary-available t254) (mary-available t255)
  )

  (:goal (and
    (met-started-at t180)
    (met-count c75)
    (not (meeting-active))
  ))
  (:metric maximize (total-time)) ; placeholder to indicate optimization of meeting time via action costs
)