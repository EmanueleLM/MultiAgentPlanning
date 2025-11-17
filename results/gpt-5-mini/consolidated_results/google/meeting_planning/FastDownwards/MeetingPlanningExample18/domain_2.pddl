(define (domain MeetingPlanningExample18-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)
  (:predicates
    (at ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (betty-available ?t - time)
    (met-betty)
  )

  ; Stay at the same location for the next minute (propagate contiguous occupancy).
  (:action stay
    :parameters (?loc - location ?tprev - time ?tnext - time)
    :precondition (and
      (at ?loc ?tprev)
      (succ ?tprev ?tnext)
    )
    :effect (and
      (at ?loc ?tnext)
    )
  )

  ; Travel from Marina to Richmond: takes 11 minutes.
  ; Parameters represent consecutive minute timepoints ?t0 ... ?t11 where succ ?ti ?t(i+1) holds.
  (:action travel_marina_to_richmond
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time)
    :precondition (and
      (at marina ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4) (succ ?t4 ?t5)
      (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8) (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11)
      ; ensure agent does not stay at origin during the travel interval minutes
      (not (at marina ?t1)) (not (at marina ?t2)) (not (at marina ?t3)) (not (at marina ?t4)) (not (at marina ?t5))
      (not (at marina ?t6)) (not (at marina ?t7)) (not (at marina ?t8)) (not (at marina ?t9)) (not (at marina ?t10))
      ; ensure agent is not already at destination during the travel intermediate minutes (no oscillation)
      (not (at richmond ?t1)) (not (at richmond ?t2)) (not (at richmond ?t3)) (not (at richmond ?t4)) (not (at richmond ?t5))
      (not (at richmond ?t6)) (not (at richmond ?t7)) (not (at richmond ?t8)) (not (at richmond ?t9)) (not (at richmond ?t10))
    )
    :effect (and
      (at richmond ?t11)
    )
  )

  ; Travel from Richmond to Marina: takes 9 minutes.
  (:action travel_richmond_to_marina
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time)
    :precondition (and
      (at richmond ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4) (succ ?t4 ?t5)
      (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8) (succ ?t8 ?t9)
      (not (at richmond ?t1)) (not (at richmond ?t2)) (not (at richmond ?t3)) (not (at richmond ?t4)) (not (at richmond ?t5))
      (not (at richmond ?t6)) (not (at richmond ?t7)) (not (at richmond ?t8)) (not (at richmond ?t9))
      (not (at marina ?t1)) (not (at marina ?t2)) (not (at marina ?t3)) (not (at marina ?t4)) (not (at marina ?t5))
      (not (at marina ?t6)) (not (at marina ?t7)) (not (at marina ?t8)) (not (at marina ?t9))
    )
    :effect (and
      (at marina ?t9)
    )
  )

  ; Meet Betty for a single continuous 75-minute block entirely within her availability.
  ; Parameters ?t0 ... ?t74 are consecutive minute timepoints covering the 75-minute block.
  (:action meet_betty_75
    :parameters (
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time ?t18 - time ?t19 - time
      ?t20 - time ?t21 - time ?t22 - time ?t23 - time ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time ?t36 - time ?t37 - time ?t38 - time ?t39 - time
      ?t40 - time ?t41 - time ?t42 - time ?t43 - time ?t44 - time ?t45 - time ?t46 - time ?t47 - time ?t48 - time ?t49 - time
      ?t50 - time ?t51 - time ?t52 - time ?t53 - time ?t54 - time ?t55 - time ?t56 - time ?t57 - time ?t58 - time ?t59 - time
      ?t60 - time ?t61 - time ?t62 - time ?t63 - time ?t64 - time ?t65 - time ?t66 - time ?t67 - time ?t68 - time ?t69 - time
      ?t70 - time ?t71 - time ?t72 - time ?t73 - time ?t74 - time
    )
    :precondition (and
      (at richmond ?t0)
      ; consecutive minutes chain for the full 75-minute interval
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
      (succ ?t70 ?t71) (succ ?t71 ?t72) (succ ?t72 ?t73) (succ ?t73 ?t74)
      ; Betty must be available for every minute of the 75-minute block
      (betty-available ?t0) (betty-available ?t1) (betty-available ?t2) (betty-available ?t3) (betty-available ?t4)
      (betty-available ?t5) (betty-available ?t6) (betty-available ?t7) (betty-available ?t8) (betty-available ?t9)
      (betty-available ?t10) (betty-available ?t11) (betty-available ?t12) (betty-available ?t13) (betty-available ?t14)
      (betty-available ?t15) (betty-available ?t16) (betty-available ?t17) (betty-available ?t18) (betty-available ?t19)
      (betty-available ?t20) (betty-available ?t21) (betty-available ?t22) (betty-available ?t23) (betty-available ?t24)
      (betty-available ?t25) (betty-available ?t26) (betty-available ?t27) (betty-available ?t28) (betty-available ?t29)
      (betty-available ?t30) (betty-available ?t31) (betty-available ?t32) (betty-available ?t33) (betty-available ?t34)
      (betty-available ?t35) (betty-available ?t36) (betty-available ?t37) (betty-available ?t38) (betty-available ?t39)
      (betty-available ?t40) (betty-available ?t41) (betty-available ?t42) (betty-available ?t43) (betty-available ?t44)
      (betty-available ?t45) (betty-available ?t46) (betty-available ?t47) (betty-available ?t48) (betty-available ?t49)
      (betty-available ?t50) (betty-available ?t51) (betty-available ?t52) (betty-available ?t53) (betty-available ?t54)
      (betty-available ?t55) (betty-available ?t56) (betty-available ?t57) (betty-available ?t58) (betty-available ?t59)
      (betty-available ?t60) (betty-available ?t61) (betty-available ?t62) (betty-available ?t63) (betty-available ?t64)
      (betty-available ?t65) (betty-available ?t66) (betty-available ?t67) (betty-available ?t68) (betty-available ?t69)
      (betty-available ?t70) (betty-available ?t71) (betty-available ?t72) (betty-available ?t73) (betty-available ?t74)
      ; ensure agent is not at the other location during the meeting minutes (no illegal overlap)
      (not (at marina ?t1)) (not (at marina ?t2)) (not (at marina ?t3)) (not (at marina ?t4)) (not (at marina ?t5))
      (not (at marina ?t6)) (not (at marina ?t7)) (not (at marina ?t8)) (not (at marina ?t9)) (not (at marina ?t10))
      (not (at marina ?t11)) (not (at marina ?t12)) (not (at marina ?t13)) (not (at marina ?t14)) (not (at marina ?t15))
      (not (at marina ?t16)) (not (at marina ?t17)) (not (at marina ?t18)) (not (at marina ?t19)) (not (at marina ?t20))
      (not (at marina ?t21)) (not (at marina ?t22)) (not (at marina ?t23)) (not (at marina ?t24)) (not (at marina ?t25))
      (not (at marina ?t26)) (not (at marina ?t27)) (not (at marina ?t28)) (not (at marina ?t29)) (not (at marina ?t30))
      (not (at marina ?t31)) (not (at marina ?t32)) (not (at marina ?t33)) (not (at marina ?t34)) (not (at marina ?t35))
      (not (at marina ?t36)) (not (at marina ?t37)) (not (at marina ?t38)) (not (at marina ?t39)) (not (at marina ?t40))
      (not (at marina ?t41)) (not (at marina ?t42)) (not (at marina ?t43)) (not (at marina ?t44)) (not (at marina ?t45))
      (not (at marina ?t46)) (not (at marina ?t47)) (not (at marina ?t48)) (not (at marina ?t49)) (not (at marina ?t50))
      (not (at marina ?t51)) (not (at marina ?t52)) (not (at marina ?t53)) (not (at marina ?t54)) (not (at marina ?t55))
      (not (at marina ?t56)) (not (at marina ?t57)) (not (at marina ?t58)) (not (at marina ?t59)) (not (at marina ?t60))
      (not (at marina ?t61)) (not (at marina ?t62)) (not (at marina ?t63)) (not (at marina ?t64)) (not (at marina ?t65))
      (not (at marina ?t66)) (not (at marina ?t67)) (not (at marina ?t68)) (not (at marina ?t69)) (not (at marina ?t70))
      (not (at marina ?t71)) (not (at marina ?t72)) (not (at marina ?t73)) (not (at marina ?t74))
    )
    :effect (and
      ; ensure agent is recorded at Richmond for every minute of the meeting block
      (at richmond ?t1) (at richmond ?t2) (at richmond ?t3) (at richmond ?t4) (at richmond ?t5)
      (at richmond ?t6) (at richmond ?t7) (at richmond ?t8) (at richmond ?t9) (at richmond ?t10)
      (at richmond ?t11) (at richmond ?t12) (at richmond ?t13) (at richmond ?t14) (at richmond ?t15)
      (at richmond ?t16) (at richmond ?t17) (at richmond ?t18) (at richmond ?t19) (at richmond ?t20)
      (at richmond ?t21) (at richmond ?t22) (at richmond ?t23) (at richmond ?t24) (at richmond ?t25)
      (at richmond ?t26) (at richmond ?t27) (at richmond ?t28) (at richmond ?t29) (at richmond ?t30)
      (at richmond ?t31) (at richmond ?t32) (at richmond ?t33) (at richmond ?t34) (at richmond ?t35)
      (at richmond ?t36) (at richmond ?t37) (at richmond ?t38) (at richmond ?t39) (at richmond ?t40)
      (at richmond ?t41) (at richmond ?t42) (at richmond ?t43) (at richmond ?t44) (at richmond ?t45)
      (at richmond ?t46) (at richmond ?t47) (at richmond ?t48) (at richmond ?t49) (at richmond ?t50)
      (at richmond ?t51) (at richmond ?t52) (at richmond ?t53) (at richmond ?t54) (at richmond ?t55)
      (at richmond ?t56) (at richmond ?t57) (at richmond ?t58) (at richmond ?t59) (at richmond ?t60)
      (at richmond ?t61) (at richmond ?t62) (at richmond ?t63) (at richmond ?t64) (at richmond ?t65)
      (at richmond ?t66) (at richmond ?t67) (at richmond ?t68) (at richmond ?t69) (at richmond ?t70)
      (at richmond ?t71) (at richmond ?t72) (at richmond ?t73) (at richmond ?t74)
      (met-betty)
    )
  )
)