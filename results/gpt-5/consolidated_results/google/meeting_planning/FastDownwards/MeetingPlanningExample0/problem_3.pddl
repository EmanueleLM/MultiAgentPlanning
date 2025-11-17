(define (problem meetingplanningexample0)
  (:domain meeting-planning-sf)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70
    t71 t72 t73 t74 t75 t76 t77 t78 t79
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
    t180 t181 t182 t183 t184 t185 t186 t187 t188 t189 t190 t191 - time

    l0 l1 l2 l3 l4 l5 l6 l7 l8 l9
    l10 l11 l12 l13 l14 l15 l16 l17 l18 l19
    l20 l21 l22 l23 l24 l25 l26 l27 l28 l29
    l30 l31 l32 l33 l34 l35 l36 l37 l38 l39
    l40 l41 l42 l43 l44 l45 l46 l47 l48 l49
    l50 l51 l52 l53 l54 l55 l56 l57 l58 l59
    l60 l61 l62 l63 l64 l65 l66 l67 l68 l69
    l70 l71 l72 l73 l74 l75 l76 l77 l78 l79
    l80 l81 l82 l83 l84 l85 l86 l87 l88 l89
    l90 l91 l92 l93 l94 l95 l96 l97 l98 l99
    l100 l101 l102 l103 l104 l105 l106 l107 l108 l109
    l110 l111 l112 l113 l114 l115 l116 l117 l118 l119 l120 - level
  )
  (:init
    (at marina)
    (time-now t0)
    (progress l0)

    ; successor minutes for 09:00->10:10 (t0..t70)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45)
    (succ t45 t46) (succ t46 t47) (succ t47 t48) (succ t48 t49) (succ t49 t50)
    (succ t50 t51) (succ t51 t52) (succ t52 t53) (succ t53 t54) (succ t54 t55)
    (succ t55 t56) (succ t56 t57) (succ t57 t58) (succ t58 t59) (succ t59 t60)
    (succ t60 t61) (succ t61 t62) (succ t62 t63) (succ t63 t64) (succ t64 t65)
    (succ t65 t66) (succ t66 t67) (succ t67 t68) (succ t68 t69) (succ t69 t70)

    ; 20-minute travel arc Marina->Mission: 10:10 -> 10:30 (t70 -> t71)
    (span20 t70 t71)

    ; successor minutes for 10:30->12:30 (t71..t191)
    (succ t71 t72) (succ t72 t73) (succ t73 t74) (succ t74 t75) (succ t75 t76)
    (succ t76 t77) (succ t77 t78) (succ t78 t79) (succ t79 t80) (succ t80 t81)
    (succ t81 t82) (succ t82 t83) (succ t83 t84) (succ t84 t85) (succ t85 t86)
    (succ t86 t87) (succ t87 t88) (succ t88 t89) (succ t89 t90) (succ t90 t91)
    (succ t91 t92) (succ t92 t93) (succ t93 t94) (succ t94 t95) (succ t95 t96)
    (succ t96 t97) (succ t97 t98) (succ t98 t99) (succ t99 t100)
    (succ t100 t101) (succ t101 t102) (succ t102 t103) (succ t103 t104) (succ t104 t105)
    (succ t105 t106) (succ t106 t107) (succ t107 t108) (succ t108 t109) (succ t109 t110)
    (succ t110 t111) (succ t111 t112) (succ t112 t113) (succ t113 t114) (succ t114 t115)
    (succ t115 t116) (succ t116 t117) (succ t117 t118) (succ t118 t119) (succ t119 t120)
    (succ t120 t121) (succ t121 t122) (succ t122 t123) (succ t123 t124) (succ t124 t125)
    (succ t125 t126) (succ t126 t127) (succ t127 t128) (succ t128 t129) (succ t129 t130)
    (succ t130 t131) (succ t131 t132) (succ t132 t133) (succ t133 t134) (succ t134 t135)
    (succ t135 t136) (succ t136 t137) (succ t137 t138) (succ t138 t139) (succ t139 t140)
    (succ t140 t141) (succ t141 t142) (succ t142 t143) (succ t143 t144) (succ t144 t145)
    (succ t145 t146) (succ t146 t147) (succ t147 t148) (succ t148 t149) (succ t149 t150)
    (succ t150 t151) (succ t151 t152) (succ t152 t153) (succ t153 t154) (succ t154 t155)
    (succ t155 t156) (succ t156 t157) (succ t157 t158) (succ t158 t159) (succ t159 t160)
    (succ t160 t161) (succ t161 t162) (succ t162 t163) (succ t163 t164) (succ t164 t165)
    (succ t165 t166) (succ t166 t167) (succ t167 t168) (succ t168 t169) (succ t169 t170)
    (succ t170 t171) (succ t171 t172) (succ t172 t173) (succ t173 t174) (succ t174 t175)
    (succ t175 t176) (succ t176 t177) (succ t177 t178) (succ t178 t179) (succ t179 t180)
    (succ t180 t181) (succ t181 t182) (succ t182 t183) (succ t183 t184) (succ t184 t185)
    (succ t185 t186) (succ t186 t187) (succ t187 t188) (succ t188 t189) (succ t189 t190)
    (succ t190 t191)

    ; Stephanie available for every meeting minute 10:30..12:29 (t71..t190)
    (steph-available t71) (steph-available t72) (steph-available t73) (steph-available t74) (steph-available t75)
    (steph-available t76) (steph-available t77) (steph-available t78) (steph-available t79) (steph-available t80)
    (steph-available t81) (steph-available t82) (steph-available t83) (steph-available t84) (steph-available t85)
    (steph-available t86) (steph-available t87) (steph-available t88) (steph-available t89) (steph-available t90)
    (steph-available t91) (steph-available t92) (steph-available t93) (steph-available t94) (steph-available t95)
    (steph-available t96) (steph-available t97) (steph-available t98) (steph-available t99) (steph-available t100)
    (steph-available t101) (steph-available t102) (steph-available t103) (steph-available t104) (steph-available t105)
    (steph-available t106) (steph-available t107) (steph-available t108) (steph-available t109) (steph-available t110)
    (steph-available t111) (steph-available t112) (steph-available t113) (steph-available t114) (steph-available t115)
    (steph-available t116) (steph-available t117) (steph-available t118) (steph-available t119) (steph-available t120)
    (steph-available t121) (steph-available t122) (steph-available t123) (steph-available t124) (steph-available t125)
    (steph-available t126) (steph-available t127) (steph-available t128) (steph-available t129) (steph-available t130)
    (steph-available t131) (steph-available t132) (steph-available t133) (steph-available t134) (steph-available t135)
    (steph-available t136) (steph-available t137) (steph-available t138) (steph-available t139) (steph-available t140)
    (steph-available t141) (steph-available t142) (steph-available t143) (steph-available t144) (steph-available t145)
    (steph-available t146) (steph-available t147) (steph-available t148) (steph-available t149) (steph-available t150)
    (steph-available t151) (steph-available t152) (steph-available t153) (steph-available t154) (steph-available t155)
    (steph-available t156) (steph-available t157) (steph-available t158) (steph-available t159) (steph-available t160)
    (steph-available t161) (steph-available t162) (steph-available t163) (steph-available t164) (steph-available t165)
    (steph-available t166) (steph-available t167) (steph-available t168) (steph-available t169) (steph-available t170)
    (steph-available t171) (steph-available t172) (steph-available t173) (steph-available t174) (steph-available t175)
    (steph-available t176) (steph-available t177) (steph-available t178) (steph-available t179) (steph-available t180)
    (steph-available t181) (steph-available t182) (steph-available t183) (steph-available t184) (steph-available t185)
    (steph-available t186) (steph-available t187) (steph-available t188) (steph-available t189) (steph-available t190)

    ; meeting progress chain l0 -> l1 -> ... -> l120
    (next-level l0 l1) (next-level l1 l2) (next-level l2 l3) (next-level l3 l4) (next-level l4 l5)
    (next-level l5 l6) (next-level l6 l7) (next-level l7 l8) (next-level l8 l9) (next-level l9 l10)
    (next-level l10 l11) (next-level l11 l12) (next-level l12 l13) (next-level l13 l14) (next-level l14 l15)
    (next-level l15 l16) (next-level l16 l17) (next-level l17 l18) (next-level l18 l19) (next-level l19 l20)
    (next-level l20 l21) (next-level l21 l22) (next-level l22 l23) (next-level l23 l24) (next-level l24 l25)
    (next-level l25 l26) (next-level l26 l27) (next-level l27 l28) (next-level l28 l29) (next-level l29 l30)
    (next-level l30 l31) (next-level l31 l32) (next-level l32 l33) (next-level l33 l34) (next-level l34 l35)
    (next-level l35 l36) (next-level l36 l37) (next-level l37 l38) (next-level l38 l39) (next-level l39 l40)
    (next-level l40 l41) (next-level l41 l42) (next-level l42 l43) (next-level l43 l44) (next-level l44 l45)
    (next-level l45 l46) (next-level l46 l47) (next-level l47 l48) (next-level l48 l49) (next-level l49 l50)
    (next-level l50 l51) (next-level l51 l52) (next-level l52 l53) (next-level l53 l54) (next-level l54 l55)
    (next-level l55 l56) (next-level l56 l57) (next-level l57 l58) (next-level l58 l59) (next-level l59 l60)
    (next-level l60 l61) (next-level l61 l62) (next-level l62 l63) (next-level l63 l64) (next-level l64 l65)
    (next-level l65 l66) (next-level l66 l67) (next-level l67 l68) (next-level l68 l69) (next-level l69 l70)
    (next-level l70 l71) (next-level l71 l72) (next-level l72 l73) (next-level l73 l74) (next-level l74 l75)
    (next-level l75 l76) (next-level l76 l77) (next-level l77 l78) (next-level l78 l79) (next-level l79 l80)
    (next-level l80 l81) (next-level l81 l82) (next-level l82 l83) (next-level l83 l84) (next-level l84 l85)
    (next-level l85 l86) (next-level l86 l87) (next-level l87 l88) (next-level l88 l89) (next-level l89 l90)
    (next-level l90 l91) (next-level l91 l92) (next-level l92 l93) (next-level l93 l94) (next-level l94 l95)
    (next-level l95 l96) (next-level l96 l97) (next-level l97 l98) (next-level l98 l99) (next-level l99 l100)
    (next-level l100 l101) (next-level l101 l102) (next-level l102 l103) (next-level l103 l104) (next-level l104 l105)
    (next-level l105 l106) (next-level l106 l107) (next-level l107 l108) (next-level l108 l109) (next-level l109 l110)
    (next-level l110 l111) (next-level l111 l112) (next-level l112 l113) (next-level l113 l114) (next-level l114 l115)
    (next-level l115 l116) (next-level l116 l117) (next-level l117 l118) (next-level l118 l119) (next-level l119 l120)
  )
  (:goal
    (met-steph)
  )
)