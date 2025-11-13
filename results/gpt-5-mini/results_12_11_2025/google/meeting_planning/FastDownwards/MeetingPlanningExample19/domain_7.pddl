(define (domain meeting_planning_example19)
  (:requirements :strips :typing :negative-preconditions)
  (:types time loc)
  (:predicates
    (next ?t1 - time ?t2 - time)            ; immediate successor relation for minute-level chains
    (later ?t1 - time ?t2 - time)           ; coarse "later" relation for allowed jumps (idle)
    (at_traveler ?l - loc ?t - time)       ; traveler at location at a particular minute
    (john_at ?l - loc ?t - time)           ; John present at location at a particular minute
    (met_john_45)                          ; goal marker: met John for required 45 continuous minutes
  )

  ;; Idle: jump from an earlier minute to a later minute at the same location (explicitly allowed by :init's later facts).
  (:action wait_until
    :parameters (?loc - loc ?t_from - time ?t_to - time)
    :precondition (and
      (at_traveler ?loc ?t_from)
      (later ?t_from ?t_to)
    )
    :effect (and
      (not (at_traveler ?loc ?t_from))
      (at_traveler ?loc ?t_to)
    )
  )

  ;; Move from Golden Gate Park to Pacific Heights: consumes exactly 16 minutes.
  (:action move_ggp_to_ph
    :parameters (
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time
    )
    :precondition (and
      (at_traveler golden_gate_park ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8)
      (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11) (next ?t11 ?t12)
      (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15) (next ?t15 ?t16)
    )
    :effect (and
      (not (at_traveler golden_gate_park ?t0))
      (at_traveler pacific_heights ?t16)
    )
  )

  ;; Meet John for 45 continuous minutes at Pacific Heights.
  ;; Occupies minutes ?t0 .. ?t44; ?t45 is the immediate successor after the last occupied minute.
  (:action meet_john_45
    :parameters (
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time ?t18 - time ?t19 - time
      ?t20 - time ?t21 - time ?t22 - time ?t23 - time ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time ?t36 - time ?t37 - time ?t38 - time ?t39 - time
      ?t40 - time ?t41 - time ?t42 - time ?t43 - time ?t44 - time ?t45 - time
    )
    :precondition (and
      (at_traveler pacific_heights ?t0)
      ;; contiguous minutes chain
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9) (next ?t9 ?t10)
      (next ?t10 ?t11) (next ?t11 ?t12) (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15)
      (next ?t15 ?t16) (next ?t16 ?t17) (next ?t17 ?t18) (next ?t18 ?t19) (next ?t19 ?t20)
      (next ?t20 ?t21) (next ?t21 ?t22) (next ?t22 ?t23) (next ?t23 ?t24) (next ?t24 ?t25)
      (next ?t25 ?t26) (next ?t26 ?t27) (next ?t27 ?t28) (next ?t28 ?t29) (next ?t29 ?t30)
      (next ?t30 ?t31) (next ?t31 ?t32) (next ?t32 ?t33) (next ?t33 ?t34) (next ?t34 ?t35)
      (next ?t35 ?t36) (next ?t36 ?t37) (next ?t37 ?t38) (next ?t38 ?t39) (next ?t39 ?t40)
      (next ?t40 ?t41) (next ?t41 ?t42) (next ?t42 ?t43) (next ?t43 ?t44) (next ?t44 ?t45)
      ;; John must be present for each of the 45 occupied minutes ?t0 .. ?t44
      (john_at pacific_heights ?t0) (john_at pacific_heights ?t1) (john_at pacific_heights ?t2)
      (john_at pacific_heights ?t3) (john_at pacific_heights ?t4) (john_at pacific_heights ?t5)
      (john_at pacific_heights ?t6) (john_at pacific_heights ?t7) (john_at pacific_heights ?t8)
      (john_at pacific_heights ?t9) (john_at pacific_heights ?t10) (john_at pacific_heights ?t11)
      (john_at pacific_heights ?t12) (john_at pacific_heights ?t13) (john_at pacific_heights ?t14)
      (john_at pacific_heights ?t15) (john_at pacific_heights ?t16) (john_at pacific_heights ?t17)
      (john_at pacific_heights ?t18) (john_at pacific_heights ?t19) (john_at pacific_heights ?t20)
      (john_at pacific_heights ?t21) (john_at pacific_heights ?t22) (john_at pacific_heights ?t23)
      (john_at pacific_heights ?t24) (john_at pacific_heights ?t25) (john_at pacific_heights ?t26)
      (john_at pacific_heights ?t27) (john_at pacific_heights ?t28) (john_at pacific_heights ?t29)
      (john_at pacific_heights ?t30) (john_at pacific_heights ?t31) (john_at pacific_heights ?t32)
      (john_at pacific_heights ?t33) (john_at pacific_heights ?t34) (john_at pacific_heights ?t35)
      (john_at pacific_heights ?t36) (john_at pacific_heights ?t37) (john_at pacific_heights ?t38)
      (john_at pacific_heights ?t39) (john_at pacific_heights ?t40) (john_at pacific_heights ?t41)
      (john_at pacific_heights ?t42) (john_at pacific_heights ?t43) (john_at pacific_heights ?t44)
    )
    :effect (and
      ;; mark goal achieved
      (met_john_45)
      ;; consume the meeting-start presence and record continuous presence through the meeting end
      (not (at_traveler pacific_heights ?t0))
      (at_traveler pacific_heights ?t1) (at_traveler pacific_heights ?t2) (at_traveler pacific_heights ?t3)
      (at_traveler pacific_heights ?t4) (at_traveler pacific_heights ?t5) (at_traveler pacific_heights ?t6)
      (at_traveler pacific_heights ?t7) (at_traveler pacific_heights ?t8) (at_traveler pacific_heights ?t9)
      (at_traveler pacific_heights ?t10) (at_traveler pacific_heights ?t11) (at_traveler pacific_heights ?t12)
      (at_traveler pacific_heights ?t13) (at_traveler pacific_heights ?t14) (at_traveler pacific_heights ?t15)
      (at_traveler pacific_heights ?t16) (at_traveler pacific_heights ?t17) (at_traveler pacific_heights ?t18)
      (at_traveler pacific_heights ?t19) (at_traveler pacific_heights ?t20) (at_traveler pacific_heights ?t21)
      (at_traveler pacific_heights ?t22) (at_traveler pacific_heights ?t23) (at_traveler pacific_heights ?t24)
      (at_traveler pacific_heights ?t25) (at_traveler pacific_heights ?t26) (at_traveler pacific_heights ?t27)
      (at_traveler pacific_heights ?t28) (at_traveler pacific_heights ?t29) (at_traveler pacific_heights ?t30)
      (at_traveler pacific_heights ?t31) (at_traveler pacific_heights ?t32) (at_traveler pacific_heights ?t33)
      (at_traveler pacific_heights ?t34) (at_traveler pacific_heights ?t35) (at_traveler pacific_heights ?t36)
      (at_traveler pacific_heights ?t37) (at_traveler pacific_heights ?t38) (at_traveler pacific_heights ?t39)
      (at_traveler pacific_heights ?t40) (at_traveler pacific_heights ?t41) (at_traveler pacific_heights ?t42)
      (at_traveler pacific_heights ?t43) (at_traveler pacific_heights ?t44) (at_traveler pacific_heights ?t45)
    )
  )
)