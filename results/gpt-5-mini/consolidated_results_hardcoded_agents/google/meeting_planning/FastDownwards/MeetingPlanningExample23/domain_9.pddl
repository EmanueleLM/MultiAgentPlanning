(define (domain meet-john-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (occupied ?t - time)
    (travel-23-pair ?from - location ?to - location)
    (john-location ?loc - location)
    (meeting-start-allowed ?t - time)
    (met-john)
  )

  ;; Travel action that consumes exactly 23 contiguous minutes.
  ;; Preconditions:
  ;;   - traveler is at ?from at start minute ?t0
  ;;   - there exists a successor chain ?t0->?t1->...->?t23
  ;;   - none of the intermediate minutes ?t1..?t23 are already occupied
  ;;   - a travel-23-pair fact exists for (?from ?to)
  ;; Effects:
  ;;   - remove being at ?from at the start minute
  ;;   - assert being at ?to at the arrival minute ?t23
  ;;   - mark minutes ?t1..?t23 as occupied
  (:action travel-23
    :parameters (
      ?from - location ?to - location
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
      ?t18 - time ?t19 - time ?t20 - time ?t21 - time ?t22 - time ?t23 - time
    )
    :precondition (and
      (at ?from ?t0)
      (travel-23-pair ?from ?to)
      ;; successor chain t0->t1->...->t23
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4) (succ ?t4 ?t5)
      (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8) (succ ?t8 ?t9) (succ ?t9 ?t10)
      (succ ?t10 ?t11) (succ ?t11 ?t12) (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15)
      (succ ?t15 ?t16) (succ ?t16 ?t17) (succ ?t17 ?t18) (succ ?t18 ?t19) (succ ?t19 ?t20)
      (succ ?t20 ?t21) (succ ?t21 ?t22) (succ ?t22 ?t23)
      ;; ensure no double-occupancy on the travel minutes
      (not (occupied ?t1)) (not (occupied ?t2)) (not (occupied ?t3)) (not (occupied ?t4)) (not (occupied ?t5))
      (not (occupied ?t6)) (not (occupied ?t7)) (not (occupied ?t8)) (not (occupied ?t9)) (not (occupied ?t10))
      (not (occupied ?t11)) (not (occupied ?t12)) (not (occupied ?t13)) (not (occupied ?t14)) (not (occupied ?t15))
      (not (occupied ?t16)) (not (occupied ?t17)) (not (occupied ?t18)) (not (occupied ?t19)) (not (occupied ?t20))
      (not (occupied ?t21)) (not (occupied ?t22)) (not (occupied ?t23))
    )
    :effect (and
      (not (at ?from ?t0))
      (at ?to ?t23)
      (occupied ?t1) (occupied ?t2) (occupied ?t3) (occupied ?t4) (occupied ?t5)
      (occupied ?t6) (occupied ?t7) (occupied ?t8) (occupied ?t9) (occupied ?t10)
      (occupied ?t11) (occupied ?t12) (occupied ?t13) (occupied ?t14) (occupied ?t15)
      (occupied ?t16) (occupied ?t17) (occupied ?t18) (occupied ?t19) (occupied ?t20)
      (occupied ?t21) (occupied ?t22) (occupied ?t23)
    )
  )

  ;; Meet John for exactly 75 contiguous minutes starting at an allowed start time.
  ;; Preconditions:
  ;;   - traveler is at the location where John is (john-location)
  ;;   - the chosen start minute is marked meeting-start-allowed
  ;;   - there exists a successor chain of length 75
  ;;   - none of the meeting minutes are occupied
  ;;   - John has not yet been met (prevent repeated meetings)
  ;; Effects:
  ;;   - occupy the 75 meeting minutes and assert presence at the last minute
  ;;   - set (met-john)
  (:action meet-john
    :parameters (
      ?loc - location
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
      ?t18 - time ?t19 - time ?t20 - time ?t21 - time ?t22 - time ?t23 - time
      ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time
      ?t36 - time ?t37 - time ?t38 - time ?t39 - time ?t40 - time ?t41 - time
      ?t42 - time ?t43 - time ?t44 - time ?t45 - time ?t46 - time ?t47 - time
      ?t48 - time ?t49 - time ?t50 - time ?t51 - time ?t52 - time ?t53 - time
      ?t54 - time ?t55 - time ?t56 - time ?t57 - time ?t58 - time ?t59 - time
      ?t60 - time ?t61 - time ?t62 - time ?t63 - time ?t64 - time ?t65 - time
      ?t66 - time ?t67 - time ?t68 - time ?t69 - time ?t70 - time ?t71 - time
      ?t72 - time ?t73 - time ?t74 - time ?t75 - time
    )
    :precondition (and
      (at ?loc ?t0)
      (john-location ?loc)
      (meeting-start-allowed ?t0)
      (not (met-john))
      ;; successor chain t0->t1->...->t75
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4) (succ ?t4 ?t5)
      (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8) (succ ?t8 ?t9) (succ ?t9 ?t10)
      (succ ?t10 ?t11) (succ ?t11 ?t12) (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15)
      (succ ?t15 ?t16) (succ ?t16 ?t17) (succ ?t17 ?t18) (succ ?t18 ?t19) (succ ?t19 ?t20)
      (succ ?t20 ?t21) (succ ?t21 ?t22) (succ ?t22 ?t23) (succ ?t23 ?t24) (succ ?t24 ?t25)
      (succ ?t25 ?t26) (succ ?t26 ?t27) (succ ?t27 ?t28) (succ ?t28 ?t29) (succ ?t29 ?t30)
      (succ ?t30 ?t31) (succ ?t31 ?t32) (succ ?t32 ?t33) (succ ?t33 ?t34) (succ ?t34 ?t35)
      (succ ?t35 ?t36) (succ ?t36 ?t37) (succ ?t37 ?t38) (succ ?t38 ?t39) (succ ?t39 ?t40)
      (succ ?t40 ?t41) (succ ?t41 ?t42) (succ ?t42 ?t43) (succ ?t43 ?t44) (succ ?t44 ?t45)
      (succ ?t45 ?t46) (succ ?t46 ?t47) (succ ?t47 ?t48) (succ ?t48 ?t49) (succ ?t49 ?t50)
      (succ ?t50 ?t51) (succ ?t51 ?t52) (succ ?t52 ?t53) (succ ?t53 ?t54) (succ ?t54 ?t55)
      (succ ?t55 ?t56) (succ ?t56 ?t57) (succ ?t57 ?t58) (succ ?t58 ?t59) (succ ?t59 ?t60)
      (succ ?t60 ?t61) (succ ?t61 ?t62) (succ ?t62 ?t63) (succ ?t63 ?t64) (succ ?t64 ?t65)
      (succ ?t65 ?t66) (succ ?t66 ?t67) (succ ?t67 ?t68) (succ ?t68 ?t69) (succ ?t69 ?t70)
      (succ ?t70 ?t71) (succ ?t71 ?t72) (succ ?t72 ?t73) (succ ?t73 ?t74) (succ ?t74 ?t75)
      ;; ensure meeting minutes are free
      (not (occupied ?t1)) (not (occupied ?t2)) (not (occupied ?t3)) (not (occupied ?t4)) (not (occupied ?t5))
      (not (occupied ?t6)) (not (occupied ?t7)) (not (occupied ?t8)) (not (occupied ?t9)) (not (occupied ?t10))
      (not (occupied ?t11)) (not (occupied ?t12)) (not (occupied ?t13)) (not (occupied ?t14)) (not (occupied ?t15))
      (not (occupied ?t16)) (not (occupied ?t17)) (not (occupied ?t18)) (not (occupied ?t19)) (not (occupied ?t20))
      (not (occupied ?t21)) (not (occupied ?t22)) (not (occupied ?t23)) (not (occupied ?t24)) (not (occupied ?t25))
      (not (occupied ?t26)) (not (occupied ?t27)) (not (occupied ?t28)) (not (occupied ?t29)) (not (occupied ?t30))
      (not (occupied ?t31)) (not (occupied ?t32)) (not (occupied ?t33)) (not (occupied ?t34)) (not (occupied ?t35))
      (not (occupied ?t36)) (not (occupied ?t37)) (not (occupied ?t38)) (not (occupied ?t39)) (not (occupied ?t40))
      (not (occupied ?t41)) (not (occupied ?t42)) (not (occupied ?t43)) (not (occupied ?t44)) (not (occupied ?t45))
      (not (occupied ?t46)) (not (occupied ?t47)) (not (occupied ?t48)) (not (occupied ?t49)) (not (occupied ?t50))
      (not (occupied ?t51)) (not (occupied ?t52)) (not (occupied ?t53)) (not (occupied ?t54)) (not (occupied ?t55))
      (not (occupied ?t56)) (not (occupied ?t57)) (not (occupied ?t58)) (not (occupied ?t59)) (not (occupied ?t60))
      (not (occupied ?t61)) (not (occupied ?t62)) (not (occupied ?t63)) (not (occupied ?t64)) (not (occupied ?t65))
      (not (occupied ?t66)) (not (occupied ?t67)) (not (occupied ?t68)) (not (occupied ?t69)) (not (occupied ?t70))
      (not (occupied ?t71)) (not (occupied ?t72)) (not (occupied ?t73)) (not (occupied ?t74)) (not (occupied ?t75))
    )
    :effect (and
      ;; occupy meeting minutes and assert presence at the final minute
      (at ?loc ?t1) (at ?loc ?t2) (at ?loc ?t3) (at ?loc ?t4) (at ?loc ?t5)
      (at ?loc ?t6) (at ?loc ?t7) (at ?loc ?t8) (at ?loc ?t9) (at ?loc ?t10)
      (at ?loc ?t11) (at ?loc ?t12) (at ?loc ?t13) (at ?loc ?t14) (at ?loc ?t15)
      (at ?loc ?t16) (at ?loc ?t17) (at ?loc ?t18) (at ?loc ?t19) (at ?loc ?t20)
      (at ?loc ?t21) (at ?loc ?t22) (at ?loc ?t23) (at ?loc ?t24) (at ?loc ?t25)
      (at ?loc ?t26) (at ?loc ?t27) (at ?loc ?t28) (at ?loc ?t29) (at ?loc ?t30)
      (at ?loc ?t31) (at ?loc ?t32) (at ?loc ?t33) (at ?loc ?t34) (at ?loc ?t35)
      (at ?loc ?t36) (at ?loc ?t37) (at ?loc ?t38) (at ?loc ?t39) (at ?loc ?t40)
      (at ?loc ?t41) (at ?loc ?t42) (at ?loc ?t43) (at ?loc ?t44) (at ?loc ?t45)
      (at ?loc ?t46) (at ?loc ?t47) (at ?loc ?t48) (at ?loc ?t49) (at ?loc ?t50)
      (at ?loc ?t51) (at ?loc ?t52) (at ?loc ?t53) (at ?loc ?t54) (at ?loc ?t55)
      (at ?loc ?t56) (at ?loc ?t57) (at ?loc ?t58) (at ?loc ?t59) (at ?loc ?t60)
      (at ?loc ?t61) (at ?loc ?t62) (at ?loc ?t63) (at ?loc ?t64) (at ?loc ?t65)
      (at ?loc ?t66) (at ?loc ?t67) (at ?loc ?t68) (at ?loc ?t69) (at ?loc ?t70)
      (at ?loc ?t71) (at ?loc ?t72) (at ?loc ?t73) (at ?loc ?t74) (at ?loc ?t75)
      (occupied ?t1) (occupied ?t2) (occupied ?t3) (occupied ?t4) (occupied ?t5)
      (occupied ?t6) (occupied ?t7) (occupied ?t8) (occupied ?t9) (occupied ?t10)
      (occupied ?t11) (occupied ?t12) (occupied ?t13) (occupied ?t14) (occupied ?t15)
      (occupied ?t16) (occupied ?t17) (occupied ?t18) (occupied ?t19) (occupied ?t20)
      (occupied ?t21) (occupied ?t22) (occupied ?t23) (occupied ?t24) (occupied ?t25)
      (occupied ?t26) (occupied ?t27) (occupied ?t28) (occupied ?t29) (occupied ?t30)
      (occupied ?t31) (occupied ?t32) (occupied ?t33) (occupied ?t34) (occupied ?t35)
      (occupied ?t36) (occupied ?t37) (occupied ?t38) (occupied ?t39) (occupied ?t40)
      (occupied ?t41) (occupied ?t42) (occupied ?t43) (occupied ?t44) (occupied ?t45)
      (occupied ?t46) (occupied ?t47) (occupied ?t48) (occupied ?t49) (occupied ?t50)
      (occupied ?t51) (occupied ?t52) (occupied ?t53) (occupied ?t54) (occupied ?t55)
      (occupied ?t56) (occupied ?t57) (occupied ?t58) (occupied ?t59) (occupied ?t60)
      (occupied ?t61) (occupied ?t62) (occupied ?t63) (occupied ?t64) (occupied ?t65)
      (occupied ?t66) (occupied ?t67) (occupied ?t68) (occupied ?t69) (occupied ?t70)
      (occupied ?t71) (occupied ?t72) (occupied ?t73) (occupied ?t74) (occupied ?t75)
      (met-john)
      ;; remove being at the start-minute to enforce contiguous progression from start to meeting end
      (not (at ?loc ?t0))
    )
  )
)