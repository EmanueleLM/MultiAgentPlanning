(define (problem meetingplanningexample8)
  (:domain meeting-planning)
  (:objects
    chinatown marinadistrict - location
    t0
    t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30
    t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50
    t51 t52 t53 t54 t55 t56 t57 t58 t59 t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70
    t71 t72 t73 t74 t75 t76 t77 t78 t79 t80 t81 t82 t83 t84 t85 t86 t87 t88 t89 t90
    t91 t92 t93 t94 t95 t96 t97 t98 t99 t100 t101 t102 t103 t104 t105 t106 t107 t108 t109
    t110 t111 t112 t113 t114 t115 t116 t117 - time
  )

  (:init
    ;; only the time points necessary for the best schedule are included:
    ;; start at t0 (09:00), 12-minute move to t12, then meeting minutes t12..t116, finishing at t117.

    ;; compiled 12-minute travel needed for the direct Chinatown->MarinaDistrict move
    (next12 t0 t12)

    ;; contiguous minute successor relation for the meeting interval t12 -> t13 -> ... -> t117
    (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20) (next t20 t21) (next t21 t22)
    (next t22 t23) (next t23 t24) (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30) (next t30 t31) (next t31 t32)
    (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40) (next t40 t41) (next t41 t42)
    (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49) (next t49 t50) (next t50 t51) (next t51 t52)
    (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59) (next t59 t60) (next t60 t61) (next t61 t62)
    (next t62 t63) (next t63 t64) (next t64 t65) (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69) (next t69 t70) (next t70 t71) (next t71 t72)
    (next t72 t73) (next t73 t74) (next t74 t75) (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79) (next t79 t80) (next t80 t81) (next t81 t82)
    (next t82 t83) (next t83 t84) (next t84 t85) (next t85 t86) (next t86 t87) (next t87 t88) (next t88 t89) (next t89 t90) (next t90 t91) (next t91 t92)
    (next t92 t93) (next t93 t94) (next t94 t95) (next t95 t96) (next t96 t97) (next t97 t98) (next t98 t99) (next t99 t100) (next t100 t101) (next t101 t102)
    (next t102 t103) (next t103 t104) (next t104 t105) (next t105 t106) (next t106 t107) (next t107 t108) (next t108 t109) (next t109 t110) (next t110 t111) (next t111 t112)
    (next t112 t113) (next t113 t114) (next t114 t115) (next t115 t116) (next t116 t117)

    ;; Directed travel edge used
    (edge12 chinatown marinadistrict)

    ;; Stephanie's known location
    (steph-location marinadistrict)

    ;; Stephanie's availability for the meeting minutes we will use (t12..t116 inclusive).
    ;; These are the only times meet-one-minute can be applied in the intended schedule.
    (steph-available t12) (steph-available t13) (steph-available t14) (steph-available t15) (steph-available t16)
    (steph-available t17) (steph-available t18) (steph-available t19) (steph-available t20) (steph-available t21)
    (steph-available t22) (steph-available t23) (steph-available t24) (steph-available t25) (steph-available t26)
    (steph-available t27) (steph-available t28) (steph-available t29) (steph-available t30) (steph-available t31)
    (steph-available t32) (steph-available t33) (steph-available t34) (steph-available t35) (steph-available t36)
    (steph-available t37) (steph-available t38) (steph-available t39) (steph-available t40) (steph-available t41)
    (steph-available t42) (steph-available t43) (steph-available t44) (steph-available t45) (steph-available t46)
    (steph-available t47) (steph-available t48) (steph-available t49) (steph-available t50) (steph-available t51)
    (steph-available t52) (steph-available t53) (steph-available t54) (steph-available t55) (steph-available t56)
    (steph-available t57) (steph-available t58) (steph-available t59) (steph-available t60) (steph-available t61)
    (steph-available t62) (steph-available t63) (steph-available t64) (steph-available t65) (steph-available t66)
    (steph-available t67) (steph-available t68) (steph-available t69) (steph-available t70) (steph-available t71)
    (steph-available t72) (steph-available t73) (steph-available t74) (steph-available t75) (steph-available t76)
    (steph-available t77) (steph-available t78) (steph-available t79) (steph-available t80) (steph-available t81)
    (steph-available t82) (steph-available t83) (steph-available t84) (steph-available t85) (steph-available t86)
    (steph-available t87) (steph-available t88) (steph-available t89) (steph-available t90) (steph-available t91)
    (steph-available t92) (steph-available t93) (steph-available t94) (steph-available t95) (steph-available t96)
    (steph-available t97) (steph-available t98) (steph-available t99) (steph-available t100) (steph-available t101)
    (steph-available t102) (steph-available t103) (steph-available t104) (steph-available t105) (steph-available t106)
    (steph-available t107) (steph-available t108) (steph-available t109) (steph-available t110) (steph-available t111)
    (steph-available t112) (steph-available t113) (steph-available t114) (steph-available t115) (steph-available t116)

    ;; Initial agent location and time: start at Chinatown at t0 (09:00)
    (at chinatown)
    (at-time t0)
  )

  ;; Goal encodes: arrive at marinadistrict and be at time t117, and have met Stephanie for
  ;; 105 consecutive minutes from t12 through t116 inclusive.
  (:goal (and
    (at marinadistrict)
    (at-time t117)
    (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16)
    (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21)
    (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26)
    (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31)
    (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36)
    (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41)
    (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46)
    (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51)
    (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56)
    (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61)
    (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66)
    (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71)
    (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76)
    (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81)
    (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86)
    (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91)
    (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96)
    (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101)
    (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106)
    (met-steph t107) (met-steph t108) (met-steph t109) (met-steph t110) (met-steph t111)
    (met-steph t112) (met-steph t113) (met-steph t114) (met-steph t115) (met-steph t116)
  ))
)