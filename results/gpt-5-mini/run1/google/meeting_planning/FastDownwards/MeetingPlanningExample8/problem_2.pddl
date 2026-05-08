(define (problem schedule-instance-1)
  (:domain scheduling-temporal-discrete)

  (:objects
    traveler stephanie - person
    chinatown marina-district - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57
    t58 t59 t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70 t71 t72 t73 t74 t75 t76 t77 t78 t79 t80 t81 t82 t83 t84 t85
    t86 t87 t88 t89 t90 t91 t92 t93 t94 t95 t96 t97 t98 t99 t100 t101 t102 t103 t104 t105 t106 t107 t108 t109 t110
    t111 t112 t113 t114 t115 t116 t117 - timeslot
    meet-stephanie - meeting
  )

  (:init
    (meeting-location meet-stephanie marina-district)

    (at traveler chinatown t0)

    (at stephanie marina-district t0) (at stephanie marina-district t1) (at stephanie marina-district t2)
    (at stephanie marina-district t3) (at stephanie marina-district t4) (at stephanie marina-district t5)
    (at stephanie marina-district t6) (at stephanie marina-district t7) (at stephanie marina-district t8)
    (at stephanie marina-district t9) (at stephanie marina-district t10) (at stephanie marina-district t11)
    (at stephanie marina-district t12) (at stephanie marina-district t13) (at stephanie marina-district t14)
    (at stephanie marina-district t15) (at stephanie marina-district t16) (at stephanie marina-district t17)
    (at stephanie marina-district t18) (at stephanie marina-district t19) (at stephanie marina-district t20)
    (at stephanie marina-district t21) (at stephanie marina-district t22) (at stephanie marina-district t23)
    (at stephanie marina-district t24) (at stephanie marina-district t25) (at stephanie marina-district t26)
    (at stephanie marina-district t27) (at stephanie marina-district t28) (at stephanie marina-district t29)
    (at stephanie marina-district t30) (at stephanie marina-district t31) (at stephanie marina-district t32)
    (at stephanie marina-district t33) (at stephanie marina-district t34) (at stephanie marina-district t35)
    (at stephanie marina-district t36) (at stephanie marina-district t37) (at stephanie marina-district t38)
    (at stephanie marina-district t39) (at stephanie marina-district t40) (at stephanie marina-district t41)
    (at stephanie marina-district t42) (at stephanie marina-district t43) (at stephanie marina-district t44)
    (at stephanie marina-district t45) (at stephanie marina-district t46) (at stephanie marina-district t47)
    (at stephanie marina-district t48) (at stephanie marina-district t49) (at stephanie marina-district t50)
    (at stephanie marina-district t51) (at stephanie marina-district t52) (at stephanie marina-district t53)
    (at stephanie marina-district t54) (at stephanie marina-district t55) (at stephanie marina-district t56)
    (at stephanie marina-district t57) (at stephanie marina-district t58) (at stephanie marina-district t59)
    (at stephanie marina-district t60) (at stephanie marina-district t61) (at stephanie marina-district t62)
    (at stephanie marina-district t63) (at stephanie marina-district t64) (at stephanie marina-district t65)
    (at stephanie marina-district t66) (at stephanie marina-district t67) (at stephanie marina-district t68)
    (at stephanie marina-district t69) (at stephanie marina-district t70) (at stephanie marina-district t71)
    (at stephanie marina-district t72) (at stephanie marina-district t73) (at stephanie marina-district t74)
    (at stephanie marina-district t75) (at stephanie marina-district t76) (at stephanie marina-district t77)
    (at stephanie marina-district t78) (at stephanie marina-district t79) (at stephanie marina-district t80)
    (at stephanie marina-district t81) (at stephanie marina-district t82) (at stephanie marina-district t83)
    (at stephanie marina-district t84) (at stephanie marina-district t85) (at stephanie marina-district t86)
    (at stephanie marina-district t87) (at stephanie marina-district t88) (at stephanie marina-district t89)
    (at stephanie marina-district t90) (at stephanie marina-district t91) (at stephanie marina-district t92)
    (at stephanie marina-district t93) (at stephanie marina-district t94) (at stephanie marina-district t95)
    (at stephanie marina-district t96) (at stephanie marina-district t97) (at stephanie marina-district t98)
    (at stephanie marina-district t99) (at stephanie marina-district t100) (at stephanie marina-district t101)
    (at stephanie marina-district t102) (at stephanie marina-district t103) (at stephanie marina-district t104)
    (at stephanie marina-district t105) (at stephanie marina-district t106) (at stephanie marina-district t107)
    (at stephanie marina-district t108) (at stephanie marina-district t109) (at stephanie marina-district t110)
    (at stephanie marina-district t111) (at stephanie marina-district t112) (at stephanie marina-district t113)
    (at stephanie marina-district t114) (at stephanie marina-district t115) (at stephanie marina-district t116)
    (at stephanie marina-district t117)
  )

  (:goal (meeting-scheduled meet-stephanie))
)