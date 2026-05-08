(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (met)                       ; goal achieved: a meeting of at least 15 minutes with James occurred within his window
  )

  ;; 1-minute wait action (stays at same location for one minute via successor link)
  (:action wait-1min
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (succ ?t1 ?t2))
    :effect (and (not (at ?a ?loc ?t1)) (at ?a ?loc ?t2))
  )

  ;; Travel: Golden Gate Park -> Marina District
  ;; Rideshare-recommended modeled durations: 40 minutes (outbound)
  ;; Enforce exact 40-minute contiguous successor chain.
  (:action travel-ggp-to-marina
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
      ?t18 - time ?t19 - time ?t20 - time ?t21 - time ?t22 - time ?t23 - time
      ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time
      ?t36 - time ?t37 - time ?t38 - time ?t39 - time ?t40 - time
    )
    :precondition (and
      ;; must be at Golden Gate Park at the start minute
      (at ?a ggp ?t0)
      ;; contiguous successor chain of length 40 minutes
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
      (succ ?t16 ?t17) (succ ?t17 ?t18) (succ ?t18 ?t19) (succ ?t19 ?t20)
      (succ ?t20 ?t21) (succ ?t21 ?t22) (succ ?t22 ?t23) (succ ?t23 ?t24)
      (succ ?t24 ?t25) (succ ?t25 ?t26) (succ ?t26 ?t27) (succ ?t27 ?t28)
      (succ ?t28 ?t29) (succ ?t29 ?t30) (succ ?t30 ?t31) (succ ?t31 ?t32)
      (succ ?t32 ?t33) (succ ?t33 ?t34) (succ ?t34 ?t35) (succ ?t35 ?t36)
      (succ ?t36 ?t37) (succ ?t37 ?t38) (succ ?t38 ?t39) (succ ?t39 ?t40)
    )
    :effect (and
      (not (at ?a ggp ?t0))
      (at ?a marina ?t40)
    )
  )

  ;; Travel: Marina District -> Golden Gate Park
  ;; Rideshare-recommended inbound modeled duration: 42 minutes (inbound)
  ;; Enforce exact 42-minute contiguous successor chain.
  (:action travel-marina-to-ggp
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
      ?t18 - time ?t19 - time ?t20 - time ?t21 - time ?t22 - time ?t23 - time
      ?t24 - time ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time
      ?t30 - time ?t31 - time ?t32 - time ?t33 - time ?t34 - time ?t35 - time
      ?t36 - time ?t37 - time ?t38 - time ?t39 - time ?t40 - time ?t41 - time ?t42 - time
    )
    :precondition (and
      ;; must be at Marina at the start minute
      (at ?a marina ?t0)
      ;; contiguous successor chain of length 42 minutes
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
      (succ ?t16 ?t17) (succ ?t17 ?t18) (succ ?t18 ?t19) (succ ?t19 ?t20)
      (succ ?t20 ?t21) (succ ?t21 ?t22) (succ ?t22 ?t23) (succ ?t23 ?t24)
      (succ ?t24 ?t25) (succ ?t25 ?t26) (succ ?t26 ?t27) (succ ?t27 ?t28)
      (succ ?t28 ?t29) (succ ?t29 ?t30) (succ ?t30 ?t31) (succ ?t31 ?t32)
      (succ ?t32 ?t33) (succ ?t33 ?t34) (succ ?t34 ?t35) (succ ?t35 ?t36)
      (succ ?t36 ?t37) (succ ?t37 ?t38) (succ ?t38 ?t39) (succ ?t39 ?t40)
      (succ ?t40 ?t41) (succ ?t41 ?t42)
    )
    :effect (and
      (not (at ?a marina ?t0))
      (at ?a ggp ?t42)
    )
  )

  ;; Meeting action with James: occupies exactly 15 contiguous minutes (meeting requirement)
  ;; Enforce exact 15-minute contiguous successor chain; require James to be at Marina every minute of that block.
  (:action meet-james-15min
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time
    )
    :precondition (and
      ;; you must be at Marina at the start minute
      (at ?a marina ?t0)
      ;; James must be at Marina for each of the 15 minutes [t0 .. t0+14]
      (at james marina ?t0) (at james marina ?t1) (at james marina ?t2)
      (at james marina ?t3) (at james marina ?t4) (at james marina ?t5)
      (at james marina ?t6) (at james marina ?t7) (at james marina ?t8)
      (at james marina ?t9) (at james marina ?t10) (at james marina ?t11)
      (at james marina ?t12) (at james marina ?t13) (at james marina ?t14)
      ;; contiguous successor chain of length 15 minutes (t0 -> t1 -> ... -> t15)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15)
    )
    :effect (and
      ;; consume presence at the start minute and create presence at minute t15 (enforces contiguity)
      (not (at ?a marina ?t0))
      (at ?a marina ?t15)
      (met)
    )
  )
)