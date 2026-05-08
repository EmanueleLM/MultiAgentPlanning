(define (problem meeting-planning-example3-problem)
  (:domain meeting-planning-example3)

  (:objects
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
    t180 - time

    m0 m1 m2 m3 m4 m5 m6 m7 m8 m9
    m10 m11 m12 m13 m14 m15 m16 m17 m18 m19
    m20 m21 m22 m23 m24 m25 m26 m27 m28 m29
    m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    m40 m41 m42 m43 m44 m45 m46 m47 m48 m49
    m50 m51 m52 m53 m54 m55 m56 m57 m58 m59
    m60 m61 m62 m63 m64 m65 m66 m67 m68 m69
    m70 m71 m72 m73 m74 m75 m76 m77 m78 m79
    m80 m81 m82 m83 m84 m85 m86 m87 m88 m89
    m90 - metcount
  )

  (:init
    ; start at Bayview at 09:00 (t0)
    (at bayview)
    (now t0)

    ; Barbara is at Golden Gate Park
    (at-person barbara golden-gate-park)

    ; meeting counter start
    (have-met m0)

    ; metcount successor chain up to m90
    (nextmet m0 m1) (nextmet m1 m2) (nextmet m2 m3) (nextmet m3 m4) (nextmet m4 m5)
    (nextmet m5 m6) (nextmet m6 m7) (nextmet m7 m8) (nextmet m8 m9) (nextmet m9 m10)
    (nextmet m10 m11) (nextmet m11 m12) (nextmet m12 m13) (nextmet m13 m14) (nextmet m14 m15)
    (nextmet m15 m16) (nextmet m16 m17) (nextmet m17 m18) (nextmet m18 m19) (nextmet m19 m20)
    (nextmet m20 m21) (nextmet m21 m22) (nextmet m22 m23) (nextmet m23 m24) (nextmet m24 m25)
    (nextmet m25 m26) (nextmet m26 m27) (nextmet m27 m28) (nextmet m28 m29) (nextmet m29 m30)
    (nextmet m30 m31) (nextmet m31 m32) (nextmet m32 m33) (nextmet m33 m34) (nextmet m34 m35)
    (nextmet m35 m36) (nextmet m36 m37) (nextmet m37 m38) (nextmet m38 m39) (nextmet m39 m40)
    (nextmet m40 m41) (nextmet m41 m42) (nextmet m42 m43) (nextmet m43 m44) (nextmet m44 m45)
    (nextmet m45 m46) (nextmet m46 m47) (nextmet m47 m48) (nextmet m48 m49) (nextmet m49 m50)
    (nextmet m50 m51) (nextmet m51 m52) (nextmet m52 m53) (nextmet m53 m54) (nextmet m54 m55)
    (nextmet m55 m56) (nextmet m56 m57) (nextmet m57 m58) (nextmet m58 m59) (nextmet m59 m60)
    (nextmet m60 m61) (nextmet m61 m62) (nextmet m62 m63) (nextmet m63 m64) (nextmet m64 m65)
    (nextmet m65 m66) (nextmet m66 m67) (nextmet m67 m68) (nextmet m68 m69) (nextmet m69 m70)
    (nextmet m70 m71) (nextmet m71 m72) (nextmet m72 m73) (nextmet m73 m74) (nextmet m74 m75)
    (nextmet m75 m76) (nextmet m76 m77) (nextmet m77 m78) (nextmet m78 m79) (nextmet m79 m80)
    (nextmet m80 m81) (nextmet m81 m82) (nextmet m82 m83) (nextmet m83 m84) (nextmet m84 m85)
    (nextmet m85 m86) (nextmet m86 m87) (nextmet m87 m88) (nextmet m88 m89) (nextmet m89 m90)

    ; time successor chain (minutes)
    (plus1 t0 t1) (plus1 t1 t2) (plus1 t2 t3) (plus1 t3 t4) (plus1 t4 t5)
    (plus1 t5 t6) (plus1 t6 t7) (plus1 t7 t8) (plus1 t8 t9) (plus1 t9 t10)
    (plus1 t10 t11) (plus1 t11 t12) (plus1 t12 t13) (plus1 t13 t14) (plus1 t14 t15)
    (plus1 t15 t16) (plus1 t16 t17) (plus1 t17 t18) (plus1 t18 t19) (plus1 t19 t20)
    (plus1 t20 t21) (plus1 t21 t22) (plus1 t22 t23) (plus1 t23 t24) (plus1 t24 t25)
    (plus1 t25 t26) (plus1 t26 t27) (plus1 t27 t28) (plus1 t28 t29) (plus1 t29 t30)
    (plus1 t30 t31) (plus1 t31 t32) (plus1 t32 t33) (plus1 t33 t34) (plus1 t34 t35)
    (plus1 t35 t36) (plus1 t36 t37) (plus1 t37 t38) (plus1 t38 t39) (plus1 t39 t40)
    (plus1 t40 t41) (plus1 t41 t42) (plus1 t42 t43) (plus1 t43 t44) (plus1 t44 t45)
    (plus1 t45 t46) (plus1 t46 t47) (plus1 t47 t48) (plus1 t48 t49) (plus1 t49 t50)
    (plus1 t50 t51) (plus1 t51 t52) (plus1 t52 t53) (plus1 t53 t54) (plus1 t54 t55)
    (plus1 t55 t56) (plus1 t56 t57) (plus1 t57 t58) (plus1 t58 t59) (plus1 t59 t60)
    (plus1 t60 t61) (plus1 t61 t62) (plus1 t62 t63) (plus1 t63 t64) (plus1 t64 t65)
    (plus1 t65 t66) (plus1 t66 t67) (plus1 t67 t68) (plus1 t68 t69) (plus1 t69 t70)
    (plus1 t70 t71) (plus1 t71 t72) (plus1 t72 t73) (plus1 t73 t74) (plus1 t74 t75)
    (plus1 t75 t76) (plus1 t76 t77) (plus1 t77 t78) (plus1 t78 t79) (plus1 t79 t80)
    (plus1 t80 t81) (plus1 t81 t82) (plus1 t82 t83) (plus1 t83 t84) (plus1 t84 t85)
    (plus1 t85 t86) (plus1 t86 t87) (plus1 t87 t88) (plus1 t88 t89) (plus1 t89 t90)
    (plus1 t90 t91) (plus1 t91 t92) (plus1 t92 t93) (plus1 t93 t94) (plus1 t94 t95)
    (plus1 t95 t96) (plus1 t96 t97) (plus1 t97 t98) (plus1 t98 t99) (plus1 t99 t100)
    (plus1 t100 t101) (plus1 t101 t102) (plus1 t102 t103) (plus1 t103 t104) (plus1 t104 t105)
    (plus1 t105 t106) (plus1 t106 t107) (plus1 t107 t108) (plus1 t108 t109) (plus1 t109 t110)
    (plus1 t110 t111) (plus1 t111 t112) (plus1 t112 t113) (plus1 t113 t114) (plus1 t114 t115)
    (plus1 t115 t116) (plus1 t116 t117) (plus1 t117 t118) (plus1 t118 t119) (plus1 t119 t120)
    (plus1 t120 t121) (plus1 t121 t122) (plus1 t122 t123) (plus1 t123 t124) (plus1 t124 t125)
    (plus1 t125 t126) (plus1 t126 t127) (plus1 t127 t128) (plus1 t128 t129) (plus1 t129 t130)
    (plus1 t130 t131) (plus1 t131 t132) (plus1 t132 t133) (plus1 t133 t134) (plus1 t134 t135)
    (plus1 t135 t136) (plus1 t136 t137) (plus1 t137 t138) (plus1 t138 t139) (plus1 t139 t140)
    (plus1 t140 t141) (plus1 t141 t142) (plus1 t142 t143) (plus1 t143 t144) (plus1 t144 t145)
    (plus1 t145 t146) (plus1 t146 t147) (plus1 t147 t148) (plus1 t148 t149) (plus1 t149 t150)
    (plus1 t150 t151) (plus1 t151 t152) (plus1 t152 t153) (plus1 t153 t154) (plus1 t154 t155)
    (plus1 t155 t156) (plus1 t156 t157) (plus1 t157 t158) (plus1 t158 t159) (plus1 t159 t160)
    (plus1 t160 t161) (plus1 t161 t162) (plus1 t162 t163) (plus1 t163 t164) (plus1 t164 t165)
    (plus1 t165 t166) (plus1 t166 t167) (plus1 t167 t168) (plus1 t168 t169) (plus1 t169 t170)
    (plus1 t170 t171) (plus1 t171 t172) (plus1 t172 t173) (plus1 t173 t174) (plus1 t174 t175)
    (plus1 t175 t176) (plus1 t176 t177) (plus1 t177 t178) (plus1 t178 t179) (plus1 t179 t180)

    ; plus22 relations (travel Bayview -> Golden Gate Park takes 22 minutes)
    (plus22 t0 t22) (plus22 t1 t23) (plus22 t2 t24) (plus22 t3 t25) (plus22 t4 t26)
    (plus22 t5 t27) (plus22 t6 t28) (plus22 t7 t29) (plus22 t8 t30) (plus22 t9 t31)
    (plus22 t10 t32) (plus22 t11 t33) (plus22 t12 t34) (plus22 t13 t35) (plus22 t14 t36)
    (plus22 t15 t37) (plus22 t16 t38) (plus22 t17 t39) (plus22 t18 t40) (plus22 t19 t41)
    (plus22 t20 t42) (plus22 t21 t43) (plus22 t22 t44) (plus22 t23 t45) (plus22 t24 t46)
    (plus22 t25 t47) (plus22 t26 t48) (plus22 t27 t49) (plus22 t28 t50) (plus22 t29 t51)
    (plus22 t30 t52) (plus22 t31 t53) (plus22 t32 t54) (plus22 t33 t55) (plus22 t34 t56)
    (plus22 t35 t57) (plus22 t36 t58) (plus22 t37 t59) (plus22 t38 t60) (plus22 t39 t61)
    (plus22 t40 t62) (plus22 t41 t63) (plus22 t42 t64) (plus22 t43 t65) (plus22 t44 t66)
    (plus22 t45 t67) (plus22 t46 t68) (plus22 t47 t69) (plus22 t48 t70) (plus22 t49 t71)
    (plus22 t50 t72) (plus22 t51 t73) (plus22 t52 t74) (plus22 t53 t75) (plus22 t54 t76)
    (plus22 t55 t77) (plus22 t56 t78) (plus22 t57 t79) (plus22 t58 t80) (plus22 t59 t81)
    (plus22 t60 t82) (plus22 t61 t83) (plus22 t62 t84) (plus22 t63 t85) (plus22 t64 t86)
    (plus22 t65 t87) (plus22 t66 t88) (plus22 t67 t89) (plus22 t68 t90) (plus22 t69 t91)
    (plus22 t70 t92) (plus22 t71 t93) (plus22 t72 t94) (plus22 t73 t95) (plus22 t74 t96)
    (plus22 t75 t97) (plus22 t76 t98) (plus22 t77 t99) (plus22 t78 t100) (plus22 t79 t101)
    (plus22 t80 t102) (plus22 t81 t103) (plus22 t82 t104) (plus22 t83 t105) (plus22 t84 t106)
    (plus22 t85 t107) (plus22 t86 t108) (plus22 t87 t109) (plus22 t88 t110) (plus22 t89 t111)
    (plus22 t90 t112) (plus22 t91 t113) (plus22 t92 t114) (plus22 t93 t115) (plus22 t94 t116)
    (plus22 t95 t117) (plus22 t96 t118) (plus22 t97 t119) (plus22 t98 t120) (plus22 t99 t121)
    (plus22 t100 t122) (plus22 t101 t123) (plus22 t102 t124) (plus22 t103 t125) (plus22 t104 t126)
    (plus22 t105 t127) (plus22 t106 t128) (plus22 t107 t129) (plus22 t108 t130) (plus22 t109 t131)
    (plus22 t110 t132) (plus22 t111 t133) (plus22 t112 t134) (plus22 t113 t135) (plus22 t114 t136)
    (plus22 t115 t137) (plus22 t116 t138) (plus22 t117 t139) (plus22 t118 t140) (plus22 t119 t141)
    (plus22 t120 t142) (plus22 t121 t143) (plus22 t122 t144) (plus22 t123 t145) (plus22 t124 t146)
    (plus22 t125 t147) (plus22 t126 t148) (plus22 t127 t149) (plus22 t128 t150) (plus22 t129 t151)
    (plus22 t130 t152) (plus22 t131 t153) (plus22 t132 t154) (plus22 t133 t155) (plus22 t134 t156)
    (plus22 t135 t157) (plus22 t136 t158) (plus22 t137 t159) (plus22 t138 t160) (plus22 t139 t161)
    (plus22 t140 t162) (plus22 t141 t163) (plus22 t142 t164) (plus22 t143 t165) (plus22 t144 t166)
    (plus22 t145 t167) (plus22 t146 t168) (plus22 t147 t169) (plus22 t148 t170) (plus22 t149 t171)
    (plus22 t150 t172) (plus22 t151 t173) (plus22 t152 t174) (plus22 t153 t175) (plus22 t154 t176)
    (plus22 t155 t177) (plus22 t156 t178) (plus22 t157 t179) (plus22 t158 t180)

    ; plus23 relations (travel Golden Gate Park -> Bayview takes 23 minutes)
    (plus23 t0 t23) (plus23 t1 t24) (plus23 t2 t25) (plus23 t3 t26) (plus23 t4 t27)
    (plus23 t5 t28) (plus23 t6 t29) (plus23 t7 t30) (plus23 t8 t31) (plus23 t9 t32)
    (plus23 t10 t33) (plus23 t11 t34) (plus23 t12 t35) (plus23 t13 t36) (plus23 t14 t37)
    (plus23 t15 t38) (plus23 t16 t39) (plus23 t17 t40) (plus23 t18 t41) (plus23 t19 t42)
    (plus23 t20 t43) (plus23 t21 t44) (plus23 t22 t45) (plus23 t23 t46) (plus23 t24 t47)
    (plus23 t25 t48) (plus23 t26 t49) (plus23 t27 t50) (plus23 t28 t51) (plus23 t29 t52)
    (plus23 t30 t53) (plus23 t31 t54) (plus23 t32 t55) (plus23 t33 t56) (plus23 t34 t57)
    (plus23 t35 t58) (plus23 t36 t59) (plus23 t37 t60) (plus23 t38 t61) (plus23 t39 t62)
    (plus23 t40 t63) (plus23 t41 t64) (plus23 t42 t65) (plus23 t43 t66) (plus23 t44 t67)
    (plus23 t45 t68) (plus23 t46 t69) (plus23 t47 t70) (plus23 t48 t71) (plus23 t49 t72)
    (plus23 t50 t73) (plus23 t51 t74) (plus23 t52 t75) (plus23 t53 t76) (plus23 t54 t77)
    (plus23 t55 t78) (plus23 t56 t79) (plus23 t57 t80) (plus23 t58 t81) (plus23 t59 t82)
    (plus23 t60 t83) (plus23 t61 t84) (plus23 t62 t85) (plus23 t63 t86) (plus23 t64 t87)
    (plus23 t65 t88) (plus23 t66 t89) (plus23 t67 t90) (plus23 t68 t91) (plus23 t69 t92)
    (plus23 t70 t93) (plus23 t71 t94) (plus23 t72 t95) (plus23 t73 t96) (plus23 t74 t97)
    (plus23 t75 t98) (plus23 t76 t99) (plus23 t77 t100) (plus23 t78 t101) (plus23 t79 t102)
    (plus23 t80 t103) (plus23 t81 t104) (plus23 t82 t105) (plus23 t83 t106) (plus23 t84 t107)
    (plus23 t85 t108) (plus23 t86 t109) (plus23 t87 t110) (plus23 t88 t111) (plus23 t89 t112)
    (plus23 t90 t113) (plus23 t91 t114) (plus23 t92 t115) (plus23 t93 t116) (plus23 t94 t117)
    (plus23 t95 t118) (plus23 t96 t119) (plus23 t97 t120) (plus23 t98 t121) (plus23 t99 t122)
    (plus23 t100 t123) (plus23 t101 t124) (plus23 t102 t125) (plus23 t103 t126) (plus23 t104 t127)
    (plus23 t105 t128) (plus23 t106 t129) (plus23 t107 t130) (plus23 t108 t131) (plus23 t109 t132)
    (plus23 t110 t133) (plus23 t111 t134) (plus23 t112 t135) (plus23 t113 t136) (plus23 t114 t137)
    (plus23 t115 t138) (plus23 t116 t139) (plus23 t117 t140) (plus23 t118 t141) (plus23 t119 t142)
    (plus23 t120 t143) (plus23 t121 t144) (plus23 t122 t145) (plus23 t123 t146) (plus23 t124 t147)
    (plus23 t125 t148) (plus23 t126 t149) (plus23 t127 t150) (plus23 t128 t151) (plus23 t129 t152)
    (plus23 t130 t153) (plus23 t131 t154) (plus23 t132 t155) (plus23 t133 t156) (plus23 t134 t157)
    (plus23 t135 t158) (plus23 t136 t159) (plus23 t137 t160) (plus23 t138 t161) (plus23 t139 t162)
    (plus23 t140 t163) (plus23 t141 t164) (plus23 t142 t165) (plus23 t143 t166) (plus23 t144 t167)
    (plus23 t145 t168) (plus23 t146 t169) (plus23 t147 t170) (plus23 t148 t171) (plus23 t149 t172)
    (plus23 t150 t173) (plus23 t151 t174) (plus23 t152 t175) (plus23 t153 t176) (plus23 t154 t177)
    (plus23 t155 t178) (plus23 t156 t179) (plus23 t157 t180)

    ; allowed-meet start times (a 1-minute meeting starting at these times ends by 11:30)
    ; mapping: t0 = 09:00, t150 = 11:30 ; allowed start times t0..t149
    (allowed-meet t0) (allowed-meet t1) (allowed-meet t2) (allowed-meet t3) (allowed-meet t4)
    (allowed-meet t5) (allowed-meet t6) (allowed-meet t7) (allowed-meet t8) (allowed-meet t9)
    (allowed-meet t10) (allowed-meet t11) (allowed-meet t12) (allowed-meet t13) (allowed-meet t14)
    (allowed-meet t15) (allowed-meet t16) (allowed-meet t17) (allowed-meet t18) (allowed-meet t19)
    (allowed-meet t20) (allowed-meet t21) (allowed-meet t22) (allowed-meet t23) (allowed-meet t24)
    (allowed-meet t25) (allowed-meet t26) (allowed-meet t27) (allowed-meet t28) (allowed-meet t29)
    (allowed-meet t30) (allowed-meet t31) (allowed-meet t32) (allowed-meet t33) (allowed-meet t34)
    (allowed-meet t35) (allowed-meet t36) (allowed-meet t37) (allowed-meet t38) (allowed-meet t39)
    (allowed-meet t40) (allowed-meet t41) (allowed-meet t42) (allowed-meet t43) (allowed-meet t44)
    (allowed-meet t45) (allowed-meet t46) (allowed-meet t47) (allowed-meet t48) (allowed-meet t49)
    (allowed-meet t50) (allowed-meet t51) (allowed-meet t52) (allowed-meet t53) (allowed-meet t54)
    (allowed-meet t55) (allowed-meet t56) (allowed-meet t57) (allowed-meet t58) (allowed-meet t59)
    (allowed-meet t60) (allowed-meet t61) (allowed-meet t62) (allowed-meet t63) (allowed-meet t64)
    (allowed-meet t65) (allowed-meet t66) (allowed-meet t67) (allowed-meet t68) (allowed-meet t69)
    (allowed-meet t70) (allowed-meet t71) (allowed-meet t72) (allowed-meet t73) (allowed-meet t74)
    (allowed-meet t75) (allowed-meet t76) (allowed-meet t77) (allowed-meet t78) (allowed-meet t79)
    (allowed-meet t80) (allowed-meet t81) (allowed-meet t82) (allowed-meet t83) (allowed-meet t84)
    (allowed-meet t85) (allowed-meet t86) (allowed-meet t87) (allowed-meet t88) (allowed-meet t89)
    (allowed-meet t90) (allowed-meet t91) (allowed-meet t92) (allowed-meet t93) (allowed-meet t94)
    (allowed-meet t95) (allowed-meet t96) (allowed-meet t97) (allowed-meet t98) (allowed-meet t99)
    (allowed-meet t100) (allowed-meet t101) (allowed-meet t102) (allowed-meet t103) (allowed-meet t104)
    (allowed-meet t105) (allowed-meet t106) (allowed-meet t107) (allowed-meet t108) (allowed-meet t109)
    (allowed-meet t110) (allowed-meet t111) (allowed-meet t112) (allowed-meet t113) (allowed-meet t114)
    (allowed-meet t115) (allowed-meet t116) (allowed-meet t117) (allowed-meet t118) (allowed-meet t119)
    (allowed-meet t120) (allowed-meet t121) (allowed-meet t122) (allowed-meet t123) (allowed-meet t124)
    (allowed-meet t125) (allowed-meet t126) (allowed-meet t127) (allowed-meet t128) (allowed-meet t129)
    (allowed-meet t130) (allowed-meet t131) (allowed-meet t132) (allowed-meet t133) (allowed-meet t134)
    (allowed-meet t135) (allowed-meet t136) (allowed-meet t137) (allowed-meet t138) (allowed-meet t139)
    (allowed-meet t140) (allowed-meet t141) (allowed-meet t142) (allowed-meet t143) (allowed-meet t144)
    (allowed-meet t145) (allowed-meet t146) (allowed-meet t147) (allowed-meet t148) (allowed-meet t149)
  )

  (:goal (have-met m90))
)