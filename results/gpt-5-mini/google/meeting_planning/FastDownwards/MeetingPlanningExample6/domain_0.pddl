(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent person location time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?ag - agent ?loc - location ?t - time)
    (free ?ag - agent ?t - time)
    (kenneth_available ?t - time)
    (met90 ?t - time)
  )

  ;; Wait for one minute staying at the same location.
  (:action wait
    :parameters (?ag - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (at ?ag ?loc ?t)
      (free ?ag ?t)
    )
    :effect (and
      (not (at ?ag ?loc ?t))
      (at ?ag ?loc ?t2)
      (not (free ?ag ?t))
    )
  )

  ;; Travel from Fisherman's Wharf to Kenneth's location taking exactly 11 minutes.
  (:action travel_fw_to_kenneth
    :parameters (?ag - agent
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time)
    :precondition (and
      ;; chain of 11 successive minutes: ?t0 -> ?t1 -> ... -> ?t11
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11)
      ;; start at Fisherman's Wharf at ?t0 and be free for the 11 minutes consumed
      (at ?ag fishermans_wharf ?t0)
      (free ?ag ?t0) (free ?ag ?t1) (free ?ag ?t2) (free ?ag ?t3) (free ?ag ?t4)
      (free ?ag ?t5) (free ?ag ?t6) (free ?ag ?t7) (free ?ag ?t8) (free ?ag ?t9) (free ?ag ?t10)
    )
    :effect (and
      ;; leave Fisherman's Wharf at ?t0, arrive at Kenneth's place at ?t11
      (not (at ?ag fishermans_wharf ?t0))
      (at ?ag kenneth_place ?t11)
      ;; consume the 11 minute time slots
      (not (free ?ag ?t0)) (not (free ?ag ?t1)) (not (free ?ag ?t2)) (not (free ?ag ?t3)) (not (free ?ag ?t4))
      (not (free ?ag ?t5)) (not (free ?ag ?t6)) (not (free ?ag ?t7)) (not (free ?ag ?t8)) (not (free ?ag ?t9)) (not (free ?ag ?t10))
    )
  )

  ;; Travel from Kenneth's location back to Fisherman's Wharf taking exactly 11 minutes.
  (:action travel_kenneth_to_fw
    :parameters (?ag - agent
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time)
    :precondition (and
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11)
      (at ?ag kenneth_place ?t0)
      (free ?ag ?t0) (free ?ag ?t1) (free ?ag ?t2) (free ?ag ?t3) (free ?ag ?t4)
      (free ?ag ?t5) (free ?ag ?t6) (free ?ag ?t7) (free ?ag ?t8) (free ?ag ?t9) (free ?ag ?t10)
    )
    :effect (and
      (not (at ?ag kenneth_place ?t0))
      (at ?ag fishermans_wharf ?t11)
      (not (free ?ag ?t0)) (not (free ?ag ?t1)) (not (free ?ag ?t2)) (not (free ?ag ?t3)) (not (free ?ag ?t4))
      (not (free ?ag ?t5)) (not (free ?ag ?t6)) (not (free ?ag ?t7)) (not (free ?ag ?t8)) (not (free ?ag ?t9)) (not (free ?ag ?t10))
    )
  )

  ;; Meet Kenneth for exactly 90 continuous minutes.
  ;; The action enforces Kenneth's availability for each minute and consumes those minutes.
  (:action meet_kenneth_90
    :parameters (?ag - agent
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time
                 ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time ?t18 - time ?t19 - time ?t20 - time
                 ?t21 - time ?t22 - time ?t23 - time ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time ?t30 - time
                 ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time ?t36 - time ?t37 - time ?t38 - time ?t39 - time ?t40 - time
                 ?t41 - time ?t42 - time ?t43 - time ?t44 - time ?t45 - time ?t46 - time ?t47 - time ?t48 - time ?t49 - time ?t50 - time
                 ?t51 - time ?t52 - time ?t53 - time ?t54 - time ?t55 - time ?t56 - time ?t57 - time ?t58 - time ?t59 - time ?t60 - time
                 ?t61 - time ?t62 - time ?t63 - time ?t64 - time ?t65 - time ?t66 - time ?t67 - time ?t68 - time ?t69 - time ?t70 - time
                 ?t71 - time ?t72 - time ?t73 - time ?t74 - time ?t75 - time ?t76 - time ?t77 - time ?t78 - time ?t79 - time ?t80 - time
                 ?t81 - time ?t82 - time ?t83 - time ?t84 - time ?t85 - time ?t86 - time ?t87 - time ?t88 - time ?t89 - time ?t90 - time)
    :precondition (and
      ;; chain of 90 minutes: ?t0 -> ?t1 -> ... -> ?t90
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9) (next ?t9 ?t10)
      (next ?t10 ?t11) (next ?t11 ?t12) (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15)
      (next ?t15 ?t16) (next ?t16 ?t17) (next ?t17 ?t18) (next ?t18 ?t19) (next ?t19 ?t20)
      (next ?t20 ?t21) (next ?t21 ?t22) (next ?t22 ?t23) (next ?t23 ?t24) (next ?t24 ?t25)
      (next ?t25 ?t26) (next ?t26 ?t27) (next ?t27 ?t28) (next ?t28 ?t29) (next ?t29 ?t30)
      (next ?t30 ?t31) (next ?t31 ?t32) (next ?t32 ?t33) (next ?t33 ?t34) (next ?t34 ?t35)
      (next ?t35 ?t36) (next ?t36 ?t37) (next ?t37 ?t38) (next ?t38 ?t39) (next ?t39 ?t40)
      (next ?t40 ?t41) (next ?t41 ?t42) (next ?t42 ?t43) (next ?t43 ?t44) (next ?t44 ?t45)
      (next ?t45 ?t46) (next ?t46 ?t47) (next ?t47 ?t48) (next ?t48 ?t49) (next ?t49 ?t50)
      (next ?t50 ?t51) (next ?t51 ?t52) (next ?t52 ?t53) (next ?t53 ?t54) (next ?t54 ?t55)
      (next ?t55 ?t56) (next ?t56 ?t57) (next ?t57 ?t58) (next ?t58 ?t59) (next ?t59 ?t60)
      (next ?t60 ?t61) (next ?t61 ?t62) (next ?t62 ?t63) (next ?t63 ?t64) (next ?t64 ?t65)
      (next ?t65 ?t66) (next ?t66 ?t67) (next ?t67 ?t68) (next ?t68 ?t69) (next ?t69 ?t70)
      (next ?t70 ?t71) (next ?t71 ?t72) (next ?t72 ?t73) (next ?t73 ?t74) (next ?t74 ?t75)
      (next ?t75 ?t76) (next ?t76 ?t77) (next ?t77 ?t78) (next ?t78 ?t79) (next ?t79 ?t80)
      (next ?t80 ?t81) (next ?t81 ?t82) (next ?t82 ?t83) (next ?t83 ?t84) (next ?t84 ?t85)
      (next ?t85 ?t86) (next ?t86 ?t87) (next ?t87 ?t88) (next ?t88 ?t89) (next ?t89 ?t90)

      ;; must start located at Kenneth's place at the initial minute of the block
      (at ?ag kenneth_place ?t0)

      ;; agent must be free for each minute consumed
      (free ?ag ?t0) (free ?ag ?t1) (free ?ag ?t2) (free ?ag ?t3) (free ?ag ?t4)
      (free ?ag ?t5) (free ?ag ?t6) (free ?ag ?t7) (free ?ag ?t8) (free ?ag ?t9)
      (free ?ag ?t10) (free ?ag ?t11) (free ?ag ?t12) (free ?ag ?t13) (free ?ag ?t14)
      (free ?ag ?t15) (free ?ag ?t16) (free ?ag ?t17) (free ?ag ?t18) (free ?ag ?t19)
      (free ?ag ?t20) (free ?ag ?t21) (free ?ag ?t22) (free ?ag ?t23) (free ?ag ?t24)
      (free ?ag ?t25) (free ?ag ?t26) (free ?ag ?t27) (free ?ag ?t28) (free ?ag ?t29)
      (free ?ag ?t30) (free ?ag ?t31) (free ?ag ?t32) (free ?ag ?t33) (free ?ag ?t34)
      (free ?ag ?t35) (free ?ag ?t36) (free ?ag ?t37) (free ?ag ?t38) (free ?ag ?t39)
      (free ?ag ?t40) (free ?ag ?t41) (free ?ag ?t42) (free ?ag ?t43) (free ?ag ?t44)
      (free ?ag ?t45) (free ?ag ?t46) (free ?ag ?t47) (free ?ag ?t48) (free ?ag ?t49)
      (free ?ag ?t50) (free ?ag ?t51) (free ?ag ?t52) (free ?ag ?t53) (free ?ag ?t54)
      (free ?ag ?t55) (free ?ag ?t56) (free ?ag ?t57) (free ?ag ?t58) (free ?ag ?t59)
      (free ?ag ?t60) (free ?ag ?t61) (free ?ag ?t62) (free ?ag ?t63) (free ?ag ?t64)
      (free ?ag ?t65) (free ?ag ?t66) (free ?ag ?t67) (free ?ag ?t68) (free ?ag ?t69)
      (free ?ag ?t70) (free ?ag ?t71) (free ?ag ?t72) (free ?ag ?t73) (free ?ag ?t74)
      (free ?ag ?t75) (free ?ag ?t76) (free ?ag ?t77) (free ?ag ?t78) (free ?ag ?t79)
      (free ?ag ?t80) (free ?ag ?t81) (free ?ag ?t82) (free ?ag ?t83) (free ?ag ?t84)
      (free ?ag ?t85) (free ?ag ?t86) (free ?ag ?t87) (free ?ag ?t88) (free ?ag ?t89)

      ;; Kenneth must be available for each minute of the meeting
      (kenneth_available ?t0) (kenneth_available ?t1) (kenneth_available ?t2) (kenneth_available ?t3) (kenneth_available ?t4)
      (kenneth_available ?t5) (kenneth_available ?t6) (kenneth_available ?t7) (kenneth_available ?t8) (kenneth_available ?t9)
      (kenneth_available ?t10) (kenneth_available ?t11) (kenneth_available ?t12) (kenneth_available ?t13) (kenneth_available ?t14)
      (kenneth_available ?t15) (kenneth_available ?t16) (kenneth_available ?t17) (kenneth_available ?t18) (kenneth_available ?t19)
      (kenneth_available ?t20) (kenneth_available ?t21) (kenneth_available ?t22) (kenneth_available ?t23) (kenneth_available ?t24)
      (kenneth_available ?t25) (kenneth_available ?t26) (kenneth_available ?t27) (kenneth_available ?t28) (kenneth_available ?t29)
      (kenneth_available ?t30) (kenneth_available ?t31) (kenneth_available ?t32) (kenneth_available ?t33) (kenneth_available ?t34)
      (kenneth_available ?t35) (kenneth_available ?t36) (kenneth_available ?t37) (kenneth_available ?t38) (kenneth_available ?t39)
      (kenneth_available ?t40) (kenneth_available ?t41) (kenneth_available ?t42) (kenneth_available ?t43) (kenneth_available ?t44)
      (kenneth_available ?t45) (kenneth_available ?t46) (kenneth_available ?t47) (kenneth_available ?t48) (kenneth_available ?t49)
      (kenneth_available ?t50) (kenneth_available ?t51) (kenneth_available ?t52) (kenneth_available ?t53) (kenneth_available ?t54)
      (kenneth_available ?t55) (kenneth_available ?t56) (kenneth_available ?t57) (kenneth_available ?t58) (kenneth_available ?t59)
      (kenneth_available ?t60) (kenneth_available ?t61) (kenneth_available ?t62) (kenneth_available ?t63) (kenneth_available ?t64)
      (kenneth_available ?t65) (kenneth_available ?t66) (kenneth_available ?t67) (kenneth_available ?t68) (kenneth_available ?t69)
      (kenneth_available ?t70) (kenneth_available ?t71) (kenneth_available ?t72) (kenneth_available ?t73) (kenneth_available ?t74)
      (kenneth_available ?t75) (kenneth_available ?t76) (kenneth_available ?t77) (kenneth_available ?t78) (kenneth_available ?t79)
      (kenneth_available ?t80) (kenneth_available ?t81) (kenneth_available ?t82) (kenneth_available ?t83) (kenneth_available ?t84)
      (kenneth_available ?t85) (kenneth_available ?t86) (kenneth_available ?t87) (kenneth_available ?t88) (kenneth_available ?t89)
    )
    :effect (and
      ;; consume the 90 minutes (delete free for each minute)
      (not (free ?ag ?t0)) (not (free ?ag ?t1)) (not (free ?ag ?t2)) (not (free ?ag ?t3)) (not (free ?ag ?t4))
      (not (free ?ag ?t5)) (not (free ?ag ?t6)) (not (free ?ag ?t7)) (not (free ?ag ?t8)) (not (free ?ag ?t9))
      (not (free ?ag ?t10)) (not (free ?ag ?t11)) (not (free ?ag ?t12)) (not (free ?ag ?t13)) (not (free ?ag ?t14))
      (not (free ?ag ?t15)) (not (free ?ag ?t16)) (not (free ?ag ?t17)) (not (free ?ag ?t18)) (not (free ?ag ?t19))
      (not (free ?ag ?t20)) (not (free ?ag ?t21)) (not (free ?ag ?t22)) (not (free ?ag ?t23)) (not (free ?ag ?t24))
      (not (free ?ag ?t25)) (not (free ?ag ?t26)) (not (free ?ag ?t27)) (not (free ?ag ?t28)) (not (free ?ag ?t29))
      (not (free ?ag ?t30)) (not (free ?ag ?t31)) (not (free ?ag ?t32)) (not (free ?ag ?t33)) (not (free ?ag ?t34))
      (not (free ?ag ?t35)) (not (free ?ag ?t36)) (not (free ?ag ?t37)) (not (free ?ag ?t38)) (not (free ?ag ?t39))
      (not (free ?ag ?t40)) (not (free ?ag ?t41)) (not (free ?ag ?t42)) (not (free ?ag ?t43)) (not (free ?ag ?t44))
      (not (free ?ag ?t45)) (not (free ?ag ?t46)) (not (free ?ag ?t47)) (not (free ?ag ?t48)) (not (free ?ag ?t49))
      (not (free ?ag ?t50)) (not (free ?ag ?t51)) (not (free ?ag ?t52)) (not (free ?ag ?t53)) (not (free ?ag ?t54))
      (not (free ?ag ?t55)) (not (free ?ag ?t56)) (not (free ?ag ?t57)) (not (free ?ag ?t58)) (not (free ?ag ?t59))
      (not (free ?ag ?t60)) (not (free ?ag ?t61)) (not (free ?ag ?t62)) (not (free ?ag ?t63)) (not (free ?ag ?t64))
      (not (free ?ag ?t65)) (not (free ?ag ?t66)) (not (free ?ag ?t67)) (not (free ?ag ?t68)) (not (free ?ag ?t69))
      (not (free ?ag ?t70)) (not (free ?ag ?t71)) (not (free ?ag ?t72)) (not (free ?ag ?t73)) (not (free ?ag ?t74))
      (not (free ?ag ?t75)) (not (free ?ag ?t76)) (not (free ?ag ?t77)) (not (free ?ag ?t78)) (not (free ?ag ?t79))
      (not (free ?ag ?t80)) (not (free ?ag ?t81)) (not (free ?ag ?t82)) (not (free ?ag ?t83)) (not (free ?ag ?t84))
      (not (free ?ag ?t85)) (not (free ?ag ?t86)) (not (free ?ag ?t87)) (not (free ?ag ?t88)) (not (free ?ag ?t89))

      ;; advance the recorded 'at' fact from start to end and mark the 90-minute meeting achieved
      (not (at ?ag kenneth_place ?t0))
      (at ?ag kenneth_place ?t90)
      (met90 ?t90)
    )
  )
)