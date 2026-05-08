(define (domain meet-joseph-nobhill)
  (:requirements :strips :typing :negative-preconditions)
  (:types minute location)

  (:constants
    chinatown nobhill - location
  )

  (:predicates
    (current ?t - minute)
    (at ?loc - location)
    (met-joseph)
    (succ1 ?t1 - minute ?t2 - minute)
    (allowed-meeting-start ?t - minute)
  )

  ;; Wait one minute while remaining at the same location
  (:action wait-one-minute
    :parameters (?t0 - minute ?t1 - minute ?loc - location)
    :precondition (and (current ?t0) (succ1 ?t0 ?t1) (at ?loc))
    :effect (and
              (not (current ?t0)) (current ?t1)
            )
  )

  ;; Move from Chinatown to Nob Hill: takes 8 minutes (contiguous succession)
  (:action move-chinatown-to-nobhill
    :parameters (?t0 - minute ?t1 - minute ?t2 - minute ?t3 - minute ?t4 - minute ?t5 - minute ?t6 - minute ?t7 - minute ?t8 - minute)
    :precondition (and
                    (current ?t0)
                    (at chinatown)
                    (succ1 ?t0 ?t1) (succ1 ?t1 ?t2) (succ1 ?t2 ?t3) (succ1 ?t3 ?t4)
                    (succ1 ?t4 ?t5) (succ1 ?t5 ?t6) (succ1 ?t6 ?t7) (succ1 ?t7 ?t8)
                  )
    :effect (and
              (not (current ?t0)) (current ?t8)
              (not (at chinatown)) (at nobhill)
            )
  )

  ;; Move from Nob Hill to Chinatown: takes 6 minutes (contiguous succession)
  (:action move-nobhill-to-chinatown
    :parameters (?t0 - minute ?t1 - minute ?t2 - minute ?t3 - minute ?t4 - minute ?t5 - minute ?t6 - minute)
    :precondition (and
                    (current ?t0)
                    (at nobhill)
                    (succ1 ?t0 ?t1) (succ1 ?t1 ?t2) (succ1 ?t2 ?t3)
                    (succ1 ?t3 ?t4) (succ1 ?t4 ?t5) (succ1 ?t5 ?t6)
                  )
    :effect (and
              (not (current ?t0)) (current ?t6)
              (not (at nobhill)) (at chinatown)
            )
  )

  ;; Meet Joseph at Nob Hill for a contiguous 75 minutes entirely within allowed-meeting-start window.
  (:action meet-joseph-75-minutes
    :parameters (
      ?t0 - minute ?t1 - minute ?t2 - minute ?t3 - minute ?t4 - minute ?t5 - minute ?t6 - minute ?t7 - minute ?t8 - minute ?t9 - minute
      ?t10 - minute ?t11 - minute ?t12 - minute ?t13 - minute ?t14 - minute ?t15 - minute ?t16 - minute ?t17 - minute ?t18 - minute ?t19 - minute
      ?t20 - minute ?t21 - minute ?t22 - minute ?t23 - minute ?t24 - minute ?t25 - minute ?t26 - minute ?t27 - minute ?t28 - minute ?t29 - minute
      ?t30 - minute ?t31 - minute ?t32 - minute ?t33 - minute ?t34 - minute ?t35 - minute ?t36 - minute ?t37 - minute ?t38 - minute ?t39 - minute
      ?t40 - minute ?t41 - minute ?t42 - minute ?t43 - minute ?t44 - minute ?t45 - minute ?t46 - minute ?t47 - minute ?t48 - minute ?t49 - minute
      ?t50 - minute ?t51 - minute ?t52 - minute ?t53 - minute ?t54 - minute ?t55 - minute ?t56 - minute ?t57 - minute ?t58 - minute ?t59 - minute
      ?t60 - minute ?t61 - minute ?t62 - minute ?t63 - minute ?t64 - minute ?t65 - minute ?t66 - minute ?t67 - minute ?t68 - minute ?t69 - minute
      ?t70 - minute ?t71 - minute ?t72 - minute ?t73 - minute ?t74 - minute ?t75 - minute
    )
    :precondition (and
      (current ?t0)
      (at nobhill)
      (allowed-meeting-start ?t0)
      (not (met-joseph))
      ;; contiguous succession chain of exactly 75 minutes (75 succ1 relations linking 76 minute objects)
      (succ1 ?t0 ?t1) (succ1 ?t1 ?t2) (succ1 ?t2 ?t3) (succ1 ?t3 ?t4) (succ1 ?t4 ?t5)
      (succ1 ?t5 ?t6) (succ1 ?t6 ?t7) (succ1 ?t7 ?t8) (succ1 ?t8 ?t9) (succ1 ?t9 ?t10)
      (succ1 ?t10 ?t11) (succ1 ?t11 ?t12) (succ1 ?t12 ?t13) (succ1 ?t13 ?t14) (succ1 ?t14 ?t15)
      (succ1 ?t15 ?t16) (succ1 ?t16 ?t17) (succ1 ?t17 ?t18) (succ1 ?t18 ?t19) (succ1 ?t19 ?t20)
      (succ1 ?t20 ?t21) (succ1 ?t21 ?t22) (succ1 ?t22 ?t23) (succ1 ?t23 ?t24) (succ1 ?t24 ?t25)
      (succ1 ?t25 ?t26) (succ1 ?t26 ?t27) (succ1 ?t27 ?t28) (succ1 ?t28 ?t29) (succ1 ?t29 ?t30)
      (succ1 ?t30 ?t31) (succ1 ?t31 ?t32) (succ1 ?t32 ?t33) (succ1 ?t33 ?t34) (succ1 ?t34 ?t35)
      (succ1 ?t35 ?t36) (succ1 ?t36 ?t37) (succ1 ?t37 ?t38) (succ1 ?t38 ?t39) (succ1 ?t39 ?t40)
      (succ1 ?t40 ?t41) (succ1 ?t41 ?t42) (succ1 ?t42 ?t43) (succ1 ?t43 ?t44) (succ1 ?t44 ?t45)
      (succ1 ?t45 ?t46) (succ1 ?t46 ?t47) (succ1 ?t47 ?t48) (succ1 ?t48 ?t49) (succ1 ?t49 ?t50)
      (succ1 ?t50 ?t51) (succ1 ?t51 ?t52) (succ1 ?t52 ?t53) (succ1 ?t53 ?t54) (succ1 ?t54 ?t55)
      (succ1 ?t55 ?t56) (succ1 ?t56 ?t57) (succ1 ?t57 ?t58) (succ1 ?t58 ?t59) (succ1 ?t59 ?t60)
      (succ1 ?t60 ?t61) (succ1 ?t61 ?t62) (succ1 ?t62 ?t63) (succ1 ?t63 ?t64) (succ1 ?t64 ?t65)
      (succ1 ?t65 ?t66) (succ1 ?t66 ?t67) (succ1 ?t67 ?t68) (succ1 ?t68 ?t69) (succ1 ?t69 ?t70)
      (succ1 ?t70 ?t71) (succ1 ?t71 ?t72) (succ1 ?t72 ?t73) (succ1 ?t73 ?t74) (succ1 ?t74 ?t75)
    )
    :effect (and
      (not (current ?t0)) (current ?t75)
      (met-joseph)
      (at nobhill)
    )
  )
)