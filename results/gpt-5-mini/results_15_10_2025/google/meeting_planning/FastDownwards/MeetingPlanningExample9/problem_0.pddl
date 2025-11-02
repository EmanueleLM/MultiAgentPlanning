(define (problem meeting-with-mary)
  (:domain meeting-planning)
  (:objects
    ; agents
    visitor mary - agent

    ; locations
    union-square nob-hill - location

    ; discrete 5-minute time steps t0 = 09:00, t1 = 09:05, ..., t87 = 16:15
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 t64 t65 t66 t67 t68 t69
    t70 t71 t72 t73 t74 t75 t76 t77 t78 t79
    t80 t81 t82 t83 t84 t85 t86 t87 - time

    ; meeting-count objects: c0..c15 (c15 represents 15 or more steps = 75+ minutes)
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
    c10 c11 c12 c13 c14 c15 - count
  )

  (:init
    ; initial time is 09:00 = t0
    (time t0)

    ; visitor arrival at 09:00 at Union Square (arrival specified in the input)
    (at visitor union-square)

    ; Mary's fixed meeting location in this encoding is Union Square
    (at mary union-square)

    ; timeline successor relations (each step is 5 minutes). t0 -> t1 -> ... -> t87
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9)
    (next t9 t10) (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19)
    (next t19 t20) (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29)
    (next t29 t30) (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39)
    (next t39 t40) (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48) (next t48 t49)
    (next t49 t50) (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56) (next t56 t57) (next t57 t58) (next t58 t59)
    (next t59 t60) (next t60 t61) (next t61 t62) (next t62 t63) (next t63 t64) (next t64 t65) (next t65 t66) (next t66 t67) (next t67 t68) (next t68 t69)
    (next t69 t70) (next t70 t71) (next t71 t72) (next t72 t73) (next t73 t74) (next t74 t75) (next t75 t76) (next t76 t77) (next t77 t78) (next t78 t79)
    (next t79 t80) (next t80 t81) (next t81 t82) (next t82 t83) (next t83 t84) (next t84 t85) (next t85 t86) (next t86 t87)

    ; nextcount relations for meeting-progress counter
    (nextcount c0 c1) (nextcount c1 c2) (nextcount c2 c3) (nextcount c3 c4) (nextcount c4 c5)
    (nextcount c5 c6) (nextcount c6 c7) (nextcount c7 c8) (nextcount c8 c9) (nextcount c9 c10)
    (nextcount c10 c11) (nextcount c11 c12) (nextcount c12 c13) (nextcount c13 c14) (nextcount c14 c15)
    ; c15 is a sink (stays at c15 if advanced further)
    (nextcount c15 c15)

    ; Mary's availability: available from 12:00 through 16:15 (inclusive).
    ; 12:00 is t36 (09:00 + 180 minutes = 36 * 5-minute steps). 16:15 is t87.
    (mary-available t36) (mary-available t37) (mary-available t38) (mary-available t39)
    (mary-available t40) (mary-available t41) (mary-available t42) (mary-available t43)
    (mary-available t44) (mary-available t45) (mary-available t46) (mary-available t47)
    (mary-available t48) (mary-available t49) (mary-available t50) (mary-available t51)
    (mary-available t52) (mary-available t53) (mary-available t54) (mary-available t55)
    (mary-available t56) (mary-available t57) (mary-available t58) (mary-available t59)
    (mary-available t60) (mary-available t61) (mary-available t62) (mary-available t63)
    (mary-available t64) (mary-available t65) (mary-available t66) (mary-available t67)
    (mary-available t68) (mary-available t69) (mary-available t70) (mary-available t71)
    (mary-available t72) (mary-available t73) (mary-available t74) (mary-available t75)
    (mary-available t76) (mary-available t77) (mary-available t78) (mary-available t79)
    (mary-available t80) (mary-available t81) (mary-available t82) (mary-available t83)
    (mary-available t84) (mary-available t85) (mary-available t86) (mary-available t87)

    ; numeric accumulator initialised to 0
    (= (total-meeting-steps) 0)
  )

  (:goal (and
    ; Enforce that the meeting starts at the earliest possible time respecting constraints:
    ; earliest time when Mary is available is 12:00 = t36; require meeting started at t36.
    (met-started-at t36)

    ; Meeting must have completed and met at least 15 steps (75 minutes)
    (met-count c15)
    (not (meeting-active))
  ))

  (:metric maximize (total-meeting-steps))
)