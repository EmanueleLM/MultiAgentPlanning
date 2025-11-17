(define (problem MeetingPlanningExample4-problem)
  (:domain MeetingPlanningExample4)

  (:objects
    Presidio MarinaDistrict - location
    Jessica - friend
    ;; Time discretization: 5-minute steps from 09:00 (540) to 18:00 (1080).
    ;; We name them t0 .. t108 where t0 = 09:00 = 540, t1 = 09:05 = 545, ..., t108 = 18:00 = 1080.
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

    ;; Initial position: you are at Presidio at 09:00 (t0)
    (at Presidio t0)

    ;; Jessica is present at MarinaDistrict from 09:15 (t3) through 17:45 (t105) inclusive.
    ;; That is, present at every 5-minute step t3 .. t105.
    ;; (We list all present facts from t3 to t105.)
    (present Jessica MarinaDistrict t3) (present Jessica MarinaDistrict t4) (present Jessica MarinaDistrict t5)
    (present Jessica MarinaDistrict t6) (present Jessica MarinaDistrict t7) (present Jessica MarinaDistrict t8)
    (present Jessica MarinaDistrict t9) (present Jessica MarinaDistrict t10) (present Jessica MarinaDistrict t11)
    (present Jessica MarinaDistrict t12) (present Jessica MarinaDistrict t13) (present Jessica MarinaDistrict t14)
    (present Jessica MarinaDistrict t15) (present Jessica MarinaDistrict t16) (present Jessica MarinaDistrict t17)
    (present Jessica MarinaDistrict t18) (present Jessica MarinaDistrict t19) (present Jessica MarinaDistrict t20)
    (present Jessica MarinaDistrict t21) (present Jessica MarinaDistrict t22) (present Jessica MarinaDistrict t23)
    (present Jessica MarinaDistrict t24) (present Jessica MarinaDistrict t25) (present Jessica MarinaDistrict t26)
    (present Jessica MarinaDistrict t27) (present Jessica MarinaDistrict t28) (present Jessica MarinaDistrict t29)
    (present Jessica MarinaDistrict t30) (present Jessica MarinaDistrict t31) (present Jessica MarinaDistrict t32)
    (present Jessica MarinaDistrict t33) (present Jessica MarinaDistrict t34) (present Jessica MarinaDistrict t35)
    (present Jessica MarinaDistrict t36) (present Jessica MarinaDistrict t37) (present Jessica MarinaDistrict t38)
    (present Jessica MarinaDistrict t39) (present Jessica MarinaDistrict t40) (present Jessica MarinaDistrict t41)
    (present Jessica MarinaDistrict t42) (present Jessica MarinaDistrict t43) (present Jessica MarinaDistrict t44)
    (present Jessica MarinaDistrict t45) (present Jessica MarinaDistrict t46) (present Jessica MarinaDistrict t47)
    (present Jessica MarinaDistrict t48) (present Jessica MarinaDistrict t49) (present Jessica MarinaDistrict t50)
    (present Jessica MarinaDistrict t51) (present Jessica MarinaDistrict t52) (present Jessica MarinaDistrict t53)
    (present Jessica MarinaDistrict t54) (present Jessica MarinaDistrict t55) (present Jessica MarinaDistrict t56)
    (present Jessica MarinaDistrict t57) (present Jessica MarinaDistrict t58) (present Jessica MarinaDistrict t59)
    (present Jessica MarinaDistrict t60) (present Jessica MarinaDistrict t61) (present Jessica MarinaDistrict t62)
    (present Jessica MarinaDistrict t63) (present Jessica MarinaDistrict t64) (present Jessica MarinaDistrict t65)
    (present Jessica MarinaDistrict t66) (present Jessica MarinaDistrict t67) (present Jessica MarinaDistrict t68)
    (present Jessica MarinaDistrict t69) (present Jessica MarinaDistrict t70) (present Jessica MarinaDistrict t71)
    (present Jessica MarinaDistrict t72) (present Jessica MarinaDistrict t73) (present Jessica MarinaDistrict t74)
    (present Jessica MarinaDistrict t75) (present Jessica MarinaDistrict t76) (present Jessica MarinaDistrict t77)
    (present Jessica MarinaDistrict t78) (present Jessica MarinaDistrict t79) (present Jessica MarinaDistrict t80)
    (present Jessica MarinaDistrict t81) (present Jessica MarinaDistrict t82) (present Jessica MarinaDistrict t83)
    (present Jessica MarinaDistrict t84) (present Jessica MarinaDistrict t85) (present Jessica MarinaDistrict t86)
    (present Jessica MarinaDistrict t87) (present Jessica MarinaDistrict t88) (present Jessica MarinaDistrict t89)
    (present Jessica MarinaDistrict t90) (present Jessica MarinaDistrict t91) (present Jessica MarinaDistrict t92)
    (present Jessica MarinaDistrict t93) (present Jessica MarinaDistrict t94) (present Jessica MarinaDistrict t95)
    (present Jessica MarinaDistrict t96) (present Jessica MarinaDistrict t97) (present Jessica MarinaDistrict t98)
    (present Jessica MarinaDistrict t99) (present Jessica MarinaDistrict t100) (present Jessica MarinaDistrict t101)
    (present Jessica MarinaDistrict t102) (present Jessica MarinaDistrict t103) (present Jessica MarinaDistrict t104)
    (present Jessica MarinaDistrict t105)
  )

  ;; Goal: have met Jessica for at least 60 contiguous minutes (encoded as the 'met' fluent set by meet-60min).
  (:goal (and (met Jessica)))
)