(define (problem MeetingPlanningExample8)
  (:domain MeetingPlanning)
  (:objects
    Chinatown MarinaDistrict - location
    ;; time steps t0 .. t117 inclusive (t0 corresponds to 09:00). We only include up to t117 (09:00 + 117min = 10:57)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 t88 t89 t90 t91 t92 t93 t94 t95 t96 t97 t98 t99
    t100 t101 t102 t103 t104 t105 t106 t107 t108 t109 t110 t111 t112 t113 t114 t115 t116 t117 - time
  )

  (:init
    ;; time-step facts (optional but explicit)
    ;; mark all as time-step
    time-step t0 time-step t1 time-step t2 time-step t3 time-step t4 time-step t5 time-step t6 time-step t7 time-step t8 time-step t9
    time-step t10 time-step t11 time-step t12 time-step t13 time-step t14 time-step t15 time-step t16 time-step t17 time-step t18 time-step t19
    time-step t20 time-step t21 time-step t22 time-step t23 time-step t24 time-step t25 time-step t26 time-step t27 time-step t28 time-step t29
    time-step t30 time-step t31 time-step t32 time-step t33 time-step t34 time-step t35 time-step t36 time-step t37 time-step t38 time-step t39
    time-step t40 time-step t41 time-step t42 time-step t43 time-step t44 time-step t45 time-step t46 time-step t47 time-step t48 time-step t49
    time-step t50 time-step t51 time-step t52 time-step t53 time-step t54 time-step t55 time-step t56 time-step t57 time-step t58 time-step t59
    time-step t60 time-step t61 time-step t62 time-step t63 time-step t64 time-step t65 time-step t66 time-step t67 time-step t68 time-step t69
    time-step t70 time-step t71 time-step t72 time-step t73 time-step t74 time-step t75 time-step t76 time-step t77 time-step t78 time-step t79
    time-step t80 time-step t81 time-step t82 time-step t83 time-step t84 time-step t85 time-step t86 time-step t87 time-step t88 time-step t89
    time-step t90 time-step t91 time-step t92 time-step t93 time-step t94 time-step t95 time-step t96 time-step t97 time-step t98 time-step t99
    time-step t100 time-step t101 time-step t102 time-step t103 time-step t104 time-step t105 time-step t106 time-step t107 time-step t108 time-step t109
    time-step t110 time-step t111 time-step t112 time-step t113 time-step t114 time-step t115 time-step t116 time-step t117

    ;; successor (+1 minute) relations next t_i -> t_{i+1} for i=0..116
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49) (next t49 t50)
    (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59) (next t59 t60)
    (next t60 t61) (next t61 t62) (next t62 t63) (next t63 t64) (next t64 t65) (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69) (next t69 t70)
    (next t70 t71) (next t71 t72) (next t72 t73) (next t73 t74) (next t74 t75) (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79) (next t79 t80)
    (next t80 t81) (next t81 t82) (next t82 t83) (next t83 t84) (next t84 t85) (next t85 t86) (next t86 t87) (next t87 t88) (next t88 t89) (next t89 t90)
    (next t90 t91) (next t91 t92) (next t92 t93) (next t93 t94) (next t94 t95) (next t95 t96) (next t96 t97) (next t97 t98) (next t98 t99) (next t99 t100)
    (next t100 t101) (next t101 t102) (next t102 t103) (next t103 t104) (next t104 t105) (next t105 t106) (next t106 t107) (next t107 t108) (next t108 t109) (next t109 t110)
    (next t110 t111) (next t111 t112) (next t112 t113) (next t113 t114) (next t114 t115) (next t115 t116) (next t116 t117)

    ;; compiled travel jump relations for 12-minute and 16-minute moves
    ;; next12: i -> i+12 for i=0..105
    (next12 t0 t12) (next12 t1 t13) (next12 t2 t14) (next12 t3 t15) (next12 t4 t16) (next12 t5 t17) (next12 t6 t18) (next12 t7 t19) (next12 t8 t20) (next12 t9 t21)
    (next12 t10 t22) (next12 t11 t23) (next12 t12 t24) (next12 t13 t25) (next12 t14 t26) (next12 t15 t27) (next12 t16 t28) (next12 t17 t29) (next12 t18 t30) (next12 t19 t31)
    (next12 t20 t32) (next12 t21 t33) (next12 t22 t34) (next12 t23 t35) (next12 t24 t36) (next12 t25 t37) (next12 t26 t38) (next12 t27 t39) (next12 t28 t40) (next12 t29 t41)
    (next12 t30 t42) (next12 t31 t43) (next12 t32 t44) (next12 t33 t45) (next12 t34 t46) (next12 t35 t47) (next12 t36 t48) (next12 t37 t49) (next12 t38 t50) (next12 t39 t51)
    (next12 t40 t52) (next12 t41 t53) (next12 t42 t54) (next12 t43 t55) (next12 t44 t56) (next12 t45 t57) (next12 t46 t58) (next12 t47 t59) (next12 t48 t60) (next12 t49 t61)
    (next12 t50 t62) (next12 t51 t63) (next12 t52 t64) (next12 t53 t65) (next12 t54 t66) (next12 t55 t67) (next12 t56 t68) (next12 t57 t69) (next12 t58 t70) (next12 t59 t71)
    (next12 t60 t72) (next12 t61 t73) (next12 t62 t74) (next12 t63 t75) (next12 t64 t76) (next12 t65 t77) (next12 t66 t78) (next12 t67 t79) (next12 t68 t80) (next12 t69 t81)
    (next12 t70 t82) (next12 t71 t83) (next12 t72 t84) (next12 t73 t85) (next12 t74 t86) (next12 t75 t87) (next12 t76 t88) (next12 t77 t89) (next12 t78 t90) (next12 t79 t91)
    (next12 t80 t92) (next12 t81 t93) (next12 t82 t94) (next12 t83 t95) (next12 t84 t96) (next12 t85 t97) (next12 t86 t98) (next12 t87 t99) (next12 t88 t100) (next12 t89 t101)
    (next12 t90 t102) (next12 t91 t103) (next12 t92 t104) (next12 t93 t105) (next12 t94 t106) (next12 t95 t107) (next12 t96 t108) (next12 t97 t109) (next12 t98 t110) (next12 t99 t111)
    (next12 t100 t112) (next12 t101 t113) (next12 t102 t114) (next12 t103 t115) (next12 t104 t116) (next12 t105 t117)

    ;; next16: i -> i+16 for i=0..101
    (next16 t0 t16) (next16 t1 t17) (next16 t2 t18) (next16 t3 t19) (next16 t4 t20) (next16 t5 t21) (next16 t6 t22) (next16 t7 t23) (next16 t8 t24) (next16 t9 t25)
    (next16 t10 t26) (next16 t11 t27) (next16 t12 t28) (next16 t13 t29) (next16 t14 t30) (next16 t15 t31) (next16 t16 t32) (next16 t17 t33) (next16 t18 t34) (next16 t19 t35)
    (next16 t20 t36) (next16 t21 t37) (next16 t22 t38) (next16 t23 t39) (next16 t24 t40) (next16 t25 t41) (next16 t26 t42) (next16 t27 t43) (next16 t28 t44) (next16 t29 t45)
    (next16 t30 t46) (next16 t31 t47) (next16 t32 t48) (next16 t33 t49) (next16 t34 t50) (next16 t35 t51) (next16 t36 t52) (next16 t37 t53) (next16 t38 t54) (next16 t39 t55)
    (next16 t40 t56) (next16 t41 t57) (next16 t42 t58) (next16 t43 t59) (next16 t44 t60) (next16 t45 t61) (next16 t46 t62) (next16 t47 t63) (next16 t48 t64) (next16 t49 t65)
    (next16 t50 t66) (next16 t51 t67) (next16 t52 t68) (next16 t53 t69) (next16 t54 t70) (next16 t55 t71) (next16 t56 t72) (next16 t57 t73) (next16 t58 t74) (next16 t59 t75)
    (next16 t60 t76) (next16 t61 t77) (next16 t62 t78) (next16 t63 t79) (next16 t64 t80) (next16 t65 t81) (next16 t66 t82) (next16 t67 t83) (next16 t68 t84) (next16 t69 t85)
    (next16 t70 t86) (next16 t71 t87) (next16 t72 t88) (next16 t73 t89) (next16 t74 t90) (next16 t75 t91) (next16 t76 t92) (next16 t77 t93) (next16 t78 t94) (next16 t79 t95)
    (next16 t80 t96) (next16 t81 t97) (next16 t82 t98) (next16 t83 t99) (next16 t84 t100) (next16 t85 t101) (next16 t86 t102) (next16 t87 t103) (next16 t88 t104) (next16 t89 t105)
    (next16 t90 t106) (next16 t91 t107) (next16 t92 t108) (next16 t93 t109) (next16 t94 t110) (next16 t95 t111) (next16 t96 t112) (next16 t97 t113) (next16 t98 t114) (next16 t99 t115)
    (next16 t100 t116) (next16 t101 t117)

    ;; Stephanie availability: she is available from 08:00 to 15:00. Our time coverage starts at 09:00 (t0)
    ;; so for our truncated horizon all t0..t117 are within her availability window.
    (stephanie-available t0) (stephanie-available t1) (stephanie-available t2) (stephanie-available t3) (stephanie-available t4) (stephanie-available t5) (stephanie-available t6) (stephanie-available t7) (stephanie-available t8) (stephanie-available t9)
    (stephanie-available t10) (stephanie-available t11) (stephanie-available t12) (stephanie-available t13) (stephanie-available t14) (stephanie-available t15) (stephanie-available t16) (stephanie-available t17) (stephanie-available t18) (stephanie-available t19)
    (stephanie-available t20) (stephanie-available t21) (stephanie-available t22) (stephanie-available t23) (stephanie-available t24) (stephanie-available t25) (stephanie-available t26) (stephanie-available t27) (stephanie-available t28) (stephanie-available t29)
    (stephanie-available t30) (stephanie-available t31) (stephanie-available t32) (stephanie-available t33) (stephanie-available t34) (stephanie-available t35) (stephanie-available t36) (stephanie-available t37) (stephanie-available t38) (stephanie-available t39)
    (stephanie-available t40) (stephanie-available t41) (stephanie-available t42) (stephanie-available t43) (stephanie-available t44) (stephanie-available t45) (stephanie-available t46) (stephanie-available t47) (stephanie-available t48) (stephanie-available t49)
    (stephanie-available t50) (stephanie-available t51) (stephanie-available t52) (stephanie-available t53) (stephanie-available t54) (stephanie-available t55) (stephanie-available t56) (stephanie-available t57) (stephanie-available t58) (stephanie-available t59)
    (stephanie-available t60) (stephanie-available t61) (stephanie-available t62) (stephanie-available t63) (stephanie-available t64) (stephanie-available t65) (stephanie-available t66) (stephanie-available t67) (stephanie-available t68) (stephanie-available t69)
    (stephanie-available t70) (stephanie-available t71) (stephanie-available t72) (stephanie-available t73) (stephanie-available t74) (stephanie-available t75) (stephanie-available t76) (stephanie-available t77) (stephanie-available t78) (stephanie-available t79)
    (stephanie-available t80) (stephanie-available t81) (stephanie-available t82) (stephanie-available t83) (stephanie-available t84) (stephanie-available t85) (stephanie-available t86) (stephanie-available t87) (stephanie-available t88) (stephanie-available t89)
    (stephanie-available t90) (stephanie-available t91) (stephanie-available t92) (stephanie-available t93) (stephanie-available t94) (stephanie-available t95) (stephanie-available t96) (stephanie-available t97) (stephanie-available t98) (stephanie-available t99)
    (stephanie-available t100) (stephanie-available t101) (stephanie-available t102) (stephanie-available t103) (stephanie-available t104) (stephanie-available t105) (stephanie-available t106) (stephanie-available t107) (stephanie-available t108) (stephanie-available t109)
    (stephanie-available t110) (stephanie-available t111) (stephanie-available t112) (stephanie-available t113) (stephanie-available t114) (stephanie-available t115) (stephanie-available t116) (stephanie-available t117)

    ;; Initial agent location and time
    (at Chinatown)
    (at-time t0)
  )

  ;; To detect existence of 105 consecutive meeting minutes we provide check actions.
  ;; Each check action has the precondition that met-stephanie-at tK .. tK+104 are all true.
  ;; For compactness we list them here in the problem file as action declarations using PDDL's :action mechanism
  ;; is only permitted in domain; therefore we embed these check actions by listing them now as named domain-style action schemas.
  ;; (Because the domain contained no such check actions previously, and to keep the domain/problem consistent with Fast Downward
  ;; we must include these check actions in the domain; however for clarity they are enumerated here conceptually.)
  ;; Instead of reinventing PDDL structure in this section, we will use a workaround: the domain already exists and the check actions
  ;; are required in the domain; we therefore assume the domain includes check actions for t0..t12. For explicitness we enumerate them below
  ;; as goal-achieving trigger precondition sets by using derived predicates in logical terms is not allowed by the given :requirements.
  ;; To keep the problem file self-contained for Fast Downward, the final goal is expressed as (goal-satisfied) which will be set
  ;; by check actions that are included in the domain. (See domain for check actions.)
  (:goal (goal-satisfied))
)