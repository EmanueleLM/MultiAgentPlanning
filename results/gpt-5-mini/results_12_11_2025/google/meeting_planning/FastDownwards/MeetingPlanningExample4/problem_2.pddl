(define (problem MeetingPlanningExample4-problem)
  (:domain MeetingPlanningExample4)

  (:objects
    Presidio MarinaDistrict - location
    jessica - friend
    ;; Time discretization: 5-minute steps from 09:00 (t0) to 18:00 (t108).
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 t88 t89 t90 t91 t92 t93 t94 t95 t96 t97 t98 t99
    t100 t101 t102 t103 t104 t105 t106 t107 t108 - time
  )

  ;; Initial state
  (:init
    ;; Successor chain for every adjacent 5-minute step (t_i -> t_{i+1})
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5) (succ t5 t6)
    (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15) (succ t15 t16) (succ t16 t17) (succ t17 t18)
    (succ t18 t19) (succ t19 t20) (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24)
    (succ t24 t25) (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35) (succ t35 t36)
    (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40) (succ t40 t41) (succ t41 t42)
    (succ t42 t43) (succ t43 t44) (succ t44 t45) (succ t45 t46) (succ t46 t47) (succ t47 t48)
    (succ t48 t49) (succ t49 t50) (succ t50 t51) (succ t51 t52) (succ t52 t53) (succ t53 t54)
    (succ t54 t55) (succ t55 t56) (succ t56 t57) (succ t57 t58) (succ t58 t59) (succ t59 t60)
    (succ t60 t61) (succ t61 t62) (succ t62 t63) (succ t63 t64) (succ t64 t65) (succ t65 t66)
    (succ t66 t67) (succ t67 t68) (succ t68 t69) (succ t69 t70) (succ t70 t71) (succ t71 t72)
    (succ t72 t73) (succ t73 t74) (succ t74 t75) (succ t75 t76) (succ t76 t77) (succ t77 t78)
    (succ t78 t79) (succ t79 t80) (succ t80 t81) (succ t81 t82) (succ t82 t83) (succ t83 t84)
    (succ t84 t85) (succ t85 t86) (succ t86 t87) (succ t87 t88) (succ t88 t89) (succ t89 t90)
    (succ t90 t91) (succ t91 t92) (succ t92 t93) (succ t93 t94) (succ t94 t95) (succ t95 t96)
    (succ t96 t97) (succ t97 t98) (succ t98 t99) (succ t99 t100) (succ t100 t101) (succ t101 t102)
    (succ t102 t103) (succ t103 t104) (succ t104 t105) (succ t105 t106) (succ t106 t107) (succ t107 t108)

    ;; Connectivity: only allowed travel links (no self-links) to prevent oscillation/no-op moves.
    (connected Presidio MarinaDistrict)
    (connected MarinaDistrict Presidio)

    ;; Initial position: you are at Presidio at 09:00 (t0)
    (at Presidio t0)

    ;; Jessica is present at MarinaDistrict from 09:15 (t3) through 17:45 (t105) inclusive.
    (present jessica MarinaDistrict t3) (present jessica MarinaDistrict t4) (present jessica MarinaDistrict t5)
    (present jessica MarinaDistrict t6) (present jessica MarinaDistrict t7) (present jessica MarinaDistrict t8)
    (present jessica MarinaDistrict t9) (present jessica MarinaDistrict t10) (present jessica MarinaDistrict t11)
    (present jessica MarinaDistrict t12) (present jessica MarinaDistrict t13) (present jessica MarinaDistrict t14)
    (present jessica MarinaDistrict t15) (present jessica MarinaDistrict t16) (present jessica MarinaDistrict t17)
    (present jessica MarinaDistrict t18) (present jessica MarinaDistrict t19) (present jessica MarinaDistrict t20)
    (present jessica MarinaDistrict t21) (present jessica MarinaDistrict t22) (present jessica MarinaDistrict t23)
    (present jessica MarinaDistrict t24) (present jessica MarinaDistrict t25) (present jessica MarinaDistrict t26)
    (present jessica MarinaDistrict t27) (present jessica MarinaDistrict t28) (present jessica MarinaDistrict t29)
    (present jessica MarinaDistrict t30) (present jessica MarinaDistrict t31) (present jessica MarinaDistrict t32)
    (present jessica MarinaDistrict t33) (present jessica MarinaDistrict t34) (present jessica MarinaDistrict t35)
    (present jessica MarinaDistrict t36) (present jessica MarinaDistrict t37) (present jessica MarinaDistrict t38)
    (present jessica MarinaDistrict t39) (present jessica MarinaDistrict t40) (present jessica MarinaDistrict t41)
    (present jessica MarinaDistrict t42) (present jessica MarinaDistrict t43) (present jessica MarinaDistrict t44)
    (present jessica MarinaDistrict t45) (present jessica MarinaDistrict t46) (present jessica MarinaDistrict t47)
    (present jessica MarinaDistrict t48) (present jessica MarinaDistrict t49) (present jessica MarinaDistrict t50)
    (present jessica MarinaDistrict t51) (present jessica MarinaDistrict t52) (present jessica MarinaDistrict t53)
    (present jessica MarinaDistrict t54) (present jessica MarinaDistrict t55) (present jessica MarinaDistrict t56)
    (present jessica MarinaDistrict t57) (present jessica MarinaDistrict t58) (present jessica MarinaDistrict t59)
    (present jessica MarinaDistrict t60) (present jessica MarinaDistrict t61) (present jessica MarinaDistrict t62)
    (present jessica MarinaDistrict t63) (present jessica MarinaDistrict t64) (present jessica MarinaDistrict t65)
    (present jessica MarinaDistrict t66) (present jessica MarinaDistrict t67) (present jessica MarinaDistrict t68)
    (present jessica MarinaDistrict t69) (present jessica MarinaDistrict t70) (present jessica MarinaDistrict t71)
    (present jessica MarinaDistrict t72) (present jessica MarinaDistrict t73) (present jessica MarinaDistrict t74)
    (present jessica MarinaDistrict t75) (present jessica MarinaDistrict t76) (present jessica MarinaDistrict t77)
    (present jessica MarinaDistrict t78) (present jessica MarinaDistrict t79) (present jessica MarinaDistrict t80)
    (present jessica MarinaDistrict t81) (present jessica MarinaDistrict t82) (present jessica MarinaDistrict t83)
    (present jessica MarinaDistrict t84) (present jessica MarinaDistrict t85) (present jessica MarinaDistrict t86)
    (present jessica MarinaDistrict t87) (present jessica MarinaDistrict t88) (present jessica MarinaDistrict t89)
    (present jessica MarinaDistrict t90) (present jessica MarinaDistrict t91) (present jessica MarinaDistrict t92)
    (present jessica MarinaDistrict t93) (present jessica MarinaDistrict t94) (present jessica MarinaDistrict t95)
    (present jessica MarinaDistrict t96) (present jessica MarinaDistrict t97) (present jessica MarinaDistrict t98)
    (present jessica MarinaDistrict t99) (present jessica MarinaDistrict t100) (present jessica MarinaDistrict t101)
    (present jessica MarinaDistrict t102) (present jessica MarinaDistrict t103) (present jessica MarinaDistrict t104)
    (present jessica MarinaDistrict t105)
  )

  ;; Goal: have met Jessica for at least 60 contiguous minutes (encoded as the 'met' fluent set by meet-60min).
  (:goal (and (met jessica)))
)