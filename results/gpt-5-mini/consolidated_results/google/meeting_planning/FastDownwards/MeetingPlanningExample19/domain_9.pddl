(define (domain meeting_planning_example19)
  (:requirements :strips :typing :negative-preconditions)
  (:types time loc agent person)
  (:predicates
    (next ?t1 - time ?t2 - time)                ; immediate successor relation for minute-level time
    (at ?a - agent ?l - loc ?t - time)         ; agent at location at particular minute
    (person_at_interval ?p - person ?l - loc ?t-start - time ?t-end - time) ; person present at location for an interval [t-start, t-end)
    (met_john_45)                              ; goal marker: met John for required 45 continuous minutes
  )

  ;; Wait one minute at the same location (consumes one minute, contiguous occupancy).
  (:action wait
    :parameters (?a - agent ?l - loc ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?l ?t1))
      (at ?a ?l ?t2)
    )
  )

  ;; Move from Golden Gate Park to Pacific Heights: consumes exactly 16 minutes (t0 .. t16).
  (:action move_ggp_to_ph
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time
    )
    :precondition (and
      (at ?a golden_gate_park ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8)
      (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11) (next ?t11 ?t12)
      (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15) (next ?t15 ?t16)
    )
    :effect (and
      (not (at ?a golden_gate_park ?t0))
      (at ?a pacific_heights ?t16)
    )
  )

  ;; Move from Pacific Heights to Golden Gate Park: consumes exactly 15 minutes (t0 .. t15).
  (:action move_ph_to_ggp
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time
    )
    :precondition (and
      (at ?a pacific_heights ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8)
      (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11) (next ?t11 ?t12)
      (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15)
    )
    :effect (and
      (not (at ?a pacific_heights ?t0))
      (at ?a golden_gate_park ?t15)
    )
  )

  ;; Meet John for 45 continuous minutes at Pacific Heights.
  ;; Occupies minutes ?t0 .. ?t44 (45 minutes); ?t45 is the immediate successor after the last occupied minute.
  ;; Instead of enumerating John's presence per-minute, require a single interval fact that covers the whole meeting.
  (:action meet_john_45
    :parameters (
      ?a - agent
      ?p - person
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
      ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time ?t18 - time ?t19 - time
      ?t20 - time ?t21 - time ?t22 - time ?t23 - time ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time ?t36 - time ?t37 - time ?t38 - time ?t39 - time
      ?t40 - time ?t41 - time ?t42 - time ?t43 - time ?t44 - time ?t45 - time
    )
    :precondition (and
      (at ?a pacific_heights ?t0)
      ;; contiguous minutes chain for the 45-minute meeting
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5)
      (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8) (next ?t8 ?t9) (next ?t9 ?t10)
      (next ?t10 ?t11) (next ?t11 ?t12) (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15)
      (next ?t15 ?t16) (next ?t16 ?t17) (next ?t17 ?t18) (next ?t18 ?t19) (next ?t19 ?t20)
      (next ?t20 ?t21) (next ?t21 ?t22) (next ?t22 ?t23) (next ?t23 ?t24) (next ?t24 ?t25)
      (next ?t25 ?t26) (next ?t26 ?t27) (next ?t27 ?t28) (next ?t28 ?t29) (next ?t29 ?t30)
      (next ?t30 ?t31) (next ?t31 ?t32) (next ?t32 ?t33) (next ?t33 ?t34) (next ?t34 ?t35)
      (next ?t35 ?t36) (next ?t36 ?t37) (next ?t37 ?t38) (next ?t38 ?t39) (next ?t39 ?t40)
      (next ?t40 ?t41) (next ?t41 ?t42) (next ?t42 ?t43) (next ?t43 ?t44) (next ?t44 ?t45)
      ;; John's presence for the whole meeting is represented by a single interval fact
      (person_at_interval ?p pacific_heights ?t0 ?t45)
    )
    :effect (and
      (met_john_45)
      ;; Advance the agent from meeting-start minute to the minute after the meeting
      (not (at ?a pacific_heights ?t0))
      (at ?a pacific_heights ?t45)
    )
  )
)