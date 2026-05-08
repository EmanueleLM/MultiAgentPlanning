(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (time-step ?t - time)
    (next ?t1 - time ?t2 - time)
    (next12 ?t1 - time ?t2 - time)
    (next16 ?t1 - time ?t2 - time)
    (steph-available ?t - time)
    (met-steph ?t - time)
    (goal-satisfied)
  )

  ;; Move from Chinatown to MarinaDistrict takes 12 minutes (modeled via next12 relation)
  (:action move-chinatown-to-marina
    :parameters (?t ?t2 - time)
    :precondition (and
      (at chinatown)
      (at-time ?t)
      (next12 ?t ?t2)
    )
    :effect (and
      (not (at chinatown))
      (at marinadistrict)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Move from MarinaDistrict to Chinatown takes 16 minutes (modeled via next16 relation)
  (:action move-marina-to-chinatown
    :parameters (?t ?t2 - time)
    :precondition (and
      (at marinadistrict)
      (at-time ?t)
      (next16 ?t ?t2)
    )
    :effect (and
      (not (at marinadistrict))
      (at chinatown)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Wait one minute at current location (uses next relation)
  (:action wait-one-minute
    :parameters (?loc - location ?t ?t2 - time)
    :precondition (and
      (at ?loc)
      (at-time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Meet Stephanie for one minute while at MarinaDistrict, only if Stephanie is available that minute.
  ;; Records that minute as met-steph for the time-step starting at ?t, and advances time.
  (:action meet-one-minute
    :parameters (?t ?t2 - time)
    :precondition (and
      (at marinadistrict)
      (at-time ?t)
      (next ?t ?t2)
      (steph-available ?t)
    )
    :effect (and
      (met-steph ?t)
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  ;; Terminal checks: require 105 consecutive met-steph time steps.
  ;; Each check action enforces one possible contiguous block of 105 minutes.
  ;; With time steps t0..t117 the latest start that fits is t12 (t12..t116 inclusive).
  ;; We create a check-block action for each start t0..t12.

  ;; check-block-0 requires met-steph t0 .. t104
  (:action check-block-0
    :parameters ()
    :precondition (and
      (met-steph t0) (met-steph t1) (met-steph t2) (met-steph t3) (met-steph t4) (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9)
      (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19)
      (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29)
      (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39)
      (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49)
      (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59)
      (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69)
      (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79)
      (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89)
      (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99)
      (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-1 requires met-steph t1 .. t105
  (:action check-block-1
    :parameters ()
    :precondition (and
      (met-steph t1) (met-steph t2) (met-steph t3) (met-steph t4) (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10)
      (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20)
      (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30)
      (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40)
      (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50)
      (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60)
      (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70)
      (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80)
      (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90)
      (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100)
      (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-2 requires met-steph t2 .. t106
  (:action check-block-2
    :parameters ()
    :precondition (and
      (met-steph t2) (met-steph t3) (met-steph t4) (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11)
      (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21)
      (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31)
      (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41)
      (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51)
      (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61)
      (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71)
      (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81)
      (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91)
      (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101)
      (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-3 requires met-steph t3 .. t107
  (:action check-block-3
    :parameters ()
    :precondition (and
      (met-steph t3) (met-steph t4) (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12)
      (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22)
      (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32)
      (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42)
      (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52)
      (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62)
      (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72)
      (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82)
      (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92)
      (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102)
      (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-4 requires met-steph t4 .. t108
  (:action check-block-4
    :parameters ()
    :precondition (and
      (met-steph t4) (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13)
      (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23)
      (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33)
      (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43)
      (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53)
      (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63)
      (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73)
      (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83)
      (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93)
      (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103)
      (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-5 requires met-steph t5 .. t109
  (:action check-block-5
    :parameters ()
    :precondition (and
      (met-steph t5) (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14)
      (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24)
      (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34)
      (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44)
      (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54)
      (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64)
      (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74)
      (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84)
      (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94)
      (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104)
      (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108) (met-steph t109)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-6 requires met-steph t6 .. t110
  (:action check-block-6
    :parameters ()
    :precondition (and
      (met-steph t6) (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15)
      (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25)
      (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35)
      (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45)
      (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55)
      (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65)
      (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75)
      (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85)
      (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95)
      (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105)
      (met-steph t106) (met-steph t107) (met-steph t108) (met-steph t109) (met-steph t110)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-7 requires met-steph t7 .. t111
  (:action check-block-7
    :parameters ()
    :precondition (and
      (met-steph t7) (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16)
      (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26)
      (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36)
      (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46)
      (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56)
      (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66)
      (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76)
      (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86)
      (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96)
      (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106)
      (met-steph t107) (met-steph t108) (met-steph t109) (met-steph t110) (met-steph t111)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-8 requires met-steph t8 .. t112
  (:action check-block-8
    :parameters ()
    :precondition (and
      (met-steph t8) (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17)
      (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27)
      (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37)
      (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47)
      (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57)
      (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67)
      (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77)
      (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87)
      (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97)
      (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107)
      (met-steph t108) (met-steph t109) (met-steph t110) (met-steph t111) (met-steph t112)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-9 requires met-steph t9 .. t113
  (:action check-block-9
    :parameters ()
    :precondition (and
      (met-steph t9) (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18)
      (met-steph t19) (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28)
      (met-steph t29) (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38)
      (met-steph t39) (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48)
      (met-steph t49) (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58)
      (met-steph t59) (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68)
      (met-steph t69) (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78)
      (met-steph t79) (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88)
      (met-steph t89) (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98)
      (met-steph t99) (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108)
      (met-steph t109) (met-steph t110) (met-steph t111) (met-steph t112) (met-steph t113)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-10 requires met-steph t10 .. t114
  (:action check-block-10
    :parameters ()
    :precondition (and
      (met-steph t10) (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19)
      (met-steph t20) (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29)
      (met-steph t30) (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39)
      (met-steph t40) (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49)
      (met-steph t50) (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59)
      (met-steph t60) (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69)
      (met-steph t70) (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79)
      (met-steph t80) (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89)
      (met-steph t90) (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99)
      (met-steph t100) (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108) (met-steph t109)
      (met-steph t110) (met-steph t111) (met-steph t112) (met-steph t113) (met-steph t114)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-11 requires met-steph t11 .. t115
  (:action check-block-11
    :parameters ()
    :precondition (and
      (met-steph t11) (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20)
      (met-steph t21) (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30)
      (met-steph t31) (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40)
      (met-steph t41) (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50)
      (met-steph t51) (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60)
      (met-steph t61) (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70)
      (met-steph t71) (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80)
      (met-steph t81) (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90)
      (met-steph t91) (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100)
      (met-steph t101) (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108) (met-steph t109) (met-steph t110)
      (met-steph t111) (met-steph t112) (met-steph t113) (met-steph t114) (met-steph t115)
    )
    :effect (and (goal-satisfied))
  )

  ;; check-block-12 requires met-steph t12 .. t116
  (:action check-block-12
    :parameters ()
    :precondition (and
      (met-steph t12) (met-steph t13) (met-steph t14) (met-steph t15) (met-steph t16) (met-steph t17) (met-steph t18) (met-steph t19) (met-steph t20) (met-steph t21)
      (met-steph t22) (met-steph t23) (met-steph t24) (met-steph t25) (met-steph t26) (met-steph t27) (met-steph t28) (met-steph t29) (met-steph t30) (met-steph t31)
      (met-steph t32) (met-steph t33) (met-steph t34) (met-steph t35) (met-steph t36) (met-steph t37) (met-steph t38) (met-steph t39) (met-steph t40) (met-steph t41)
      (met-steph t42) (met-steph t43) (met-steph t44) (met-steph t45) (met-steph t46) (met-steph t47) (met-steph t48) (met-steph t49) (met-steph t50) (met-steph t51)
      (met-steph t52) (met-steph t53) (met-steph t54) (met-steph t55) (met-steph t56) (met-steph t57) (met-steph t58) (met-steph t59) (met-steph t60) (met-steph t61)
      (met-steph t62) (met-steph t63) (met-steph t64) (met-steph t65) (met-steph t66) (met-steph t67) (met-steph t68) (met-steph t69) (met-steph t70) (met-steph t71)
      (met-steph t72) (met-steph t73) (met-steph t74) (met-steph t75) (met-steph t76) (met-steph t77) (met-steph t78) (met-steph t79) (met-steph t80) (met-steph t81)
      (met-steph t82) (met-steph t83) (met-steph t84) (met-steph t85) (met-steph t86) (met-steph t87) (met-steph t88) (met-steph t89) (met-steph t90) (met-steph t91)
      (met-steph t92) (met-steph t93) (met-steph t94) (met-steph t95) (met-steph t96) (met-steph t97) (met-steph t98) (met-steph t99) (met-steph t100) (met-steph t101)
      (met-steph t102) (met-steph t103) (met-steph t104) (met-steph t105) (met-steph t106) (met-steph t107) (met-steph t108) (met-steph t109) (met-steph t110) (met-steph t111)
      (met-steph t112) (met-steph t113) (met-steph t114) (met-steph t115) (met-steph t116)
    )
    :effect (and (goal-satisfied))
  )

)