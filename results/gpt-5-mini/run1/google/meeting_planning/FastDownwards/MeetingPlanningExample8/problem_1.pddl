(define (problem schedule-instance-1)
  (:domain scheduling-temporal-discrete)

  (:objects
    traveler stephanie - person
    Chinatown MarinaDistrict - location
    ;; timeslots: t0 = 09:00, t1 = 09:01, ... ; horizon up to t117 (sufficient to cover earliest feasible meeting end)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57
    t58 t59 t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70 t71 t72 t73 t74 t75 t76 t77 t78 t79 t80 t81 t82 t83 t84 t85
    t86 t87 t88 t89 t90 t91 t92 t93 t94 t95 t96 t97 t98 t99 t100 t101 t102 t103 t104 t105 t106 t107 t108 t109 t110
    t111 t112 t113 t114 t115 t116 t117 - timeslot
    meet-stephanie - meeting
  )

  (:init
    ;; Meeting location: Stephanie will be at MarinaDistrict (availability window covers our horizon)
    (meeting-location meet-stephanie MarinaDistrict)

    ;; Traveler initial location: you arrive at Chinatown at 09:00 -> t0
    (at traveler Chinatown t0)

    ;; Stephanie is present at MarinaDistrict throughout the modeled horizon (she's available 08:00-15:00; our horizon is subset)
    (at stephanie MarinaDistrict t0) (at stephanie MarinaDistrict t1) (at stephanie MarinaDistrict t2)
    (at stephanie MarinaDistrict t3) (at stephanie MarinaDistrict t4) (at stephanie MarinaDistrict t5)
    (at stephanie MarinaDistrict t6) (at stephanie MarinaDistrict t7) (at stephanie MarinaDistrict t8)
    (at stephanie MarinaDistrict t9) (at stephanie MarinaDistrict t10) (at stephanie MarinaDistrict t11)
    (at stephanie MarinaDistrict t12) (at stephanie MarinaDistrict t13) (at stephanie MarinaDistrict t14)
    (at stephanie MarinaDistrict t15) (at stephanie MarinaDistrict t16) (at stephanie MarinaDistrict t17)
    (at stephanie MarinaDistrict t18) (at stephanie MarinaDistrict t19) (at stephanie MarinaDistrict t20)
    (at stephanie MarinaDistrict t21) (at stephanie MarinaDistrict t22) (at stephanie MarinaDistrict t23)
    (at stephanie MarinaDistrict t24) (at stephanie MarinaDistrict t25) (at stephanie MarinaDistrict t26)
    (at stephanie MarinaDistrict t27) (at stephanie MarinaDistrict t28) (at stephanie MarinaDistrict t29)
    (at stephanie MarinaDistrict t30) (at stephanie MarinaDistrict t31) (at stephanie MarinaDistrict t32)
    (at stephanie MarinaDistrict t33) (at stephanie MarinaDistrict t34) (at stephanie MarinaDistrict t35)
    (at stephanie MarinaDistrict t36) (at stephanie MarinaDistrict t37) (at stephanie MarinaDistrict t38)
    (at stephanie MarinaDistrict t39) (at stephanie MarinaDistrict t40) (at stephanie MarinaDistrict t41)
    (at stephanie MarinaDistrict t42) (at stephanie MarinaDistrict t43) (at stephanie MarinaDistrict t44)
    (at stephanie MarinaDistrict t45) (at stephanie MarinaDistrict t46) (at stephanie MarinaDistrict t47)
    (at stephanie MarinaDistrict t48) (at stephanie MarinaDistrict t49) (at stephanie MarinaDistrict t50)
    (at stephanie MarinaDistrict t51) (at stephanie MarinaDistrict t52) (at stephanie MarinaDistrict t53)
    (at stephanie MarinaDistrict t54) (at stephanie MarinaDistrict t55) (at stephanie MarinaDistrict t56)
    (at stephanie MarinaDistrict t57) (at stephanie MarinaDistrict t58) (at stephanie MarinaDistrict t59)
    (at stephanie MarinaDistrict t60) (at stephanie MarinaDistrict t61) (at stephanie MarinaDistrict t62)
    (at stephanie MarinaDistrict t63) (at stephanie MarinaDistrict t64) (at stephanie MarinaDistrict t65)
    (at stephanie MarinaDistrict t66) (at stephanie MarinaDistrict t67) (at stephanie MarinaDistrict t68)
    (at stephanie MarinaDistrict t69) (at stephanie MarinaDistrict t70) (at stephanie MarinaDistrict t71)
    (at stephanie MarinaDistrict t72) (at stephanie MarinaDistrict t73) (at stephanie MarinaDistrict t74)
    (at stephanie MarinaDistrict t75) (at stephanie MarinaDistrict t76) (at stephanie MarinaDistrict t77)
    (at stephanie MarinaDistrict t78) (at stephanie MarinaDistrict t79) (at stephanie MarinaDistrict t80)
    (at stephanie MarinaDistrict t81) (at stephanie MarinaDistrict t82) (at stephanie MarinaDistrict t83)
    (at stephanie MarinaDistrict t84) (at stephanie MarinaDistrict t85) (at stephanie MarinaDistrict t86)
    (at stephanie MarinaDistrict t87) (at stephanie MarinaDistrict t88) (at stephanie MarinaDistrict t89)
    (at stephanie MarinaDistrict t90) (at stephanie MarinaDistrict t91) (at stephanie MarinaDistrict t92)
    (at stephanie MarinaDistrict t93) (at stephanie MarinaDistrict t94) (at stephanie MarinaDistrict t95)
    (at stephanie MarinaDistrict t96) (at stephanie MarinaDistrict t97) (at stephanie MarinaDistrict t98)
    (at stephanie MarinaDistrict t99) (at stephanie MarinaDistrict t100) (at stephanie MarinaDistrict t101)
    (at stephanie MarinaDistrict t102) (at stephanie MarinaDistrict t103) (at stephanie MarinaDistrict t104)
    (at stephanie MarinaDistrict t105) (at stephanie MarinaDistrict t106) (at stephanie MarinaDistrict t107)
    (at stephanie MarinaDistrict t108) (at stephanie MarinaDistrict t109) (at stephanie MarinaDistrict t110)
    (at stephanie MarinaDistrict t111) (at stephanie MarinaDistrict t112) (at stephanie MarinaDistrict t113)
    (at stephanie MarinaDistrict t114) (at stephanie MarinaDistrict t115) (at stephanie MarinaDistrict t116)
    (at stephanie MarinaDistrict t117)
  )

  ;; Goal: ensure Stephanie meeting of at least 105 minutes is scheduled.
  ;; The domain only creates meeting-scheduled meet-stephanie when a meeting of length 105 has been scheduled.
  (:goal (meeting-scheduled meet-stephanie))
)