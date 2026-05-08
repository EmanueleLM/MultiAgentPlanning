(define (domain meeting-planning)
  (:requirements :strips :typing)
  (:types agent location time)

  (:constants
    ggp marina - location
    james - agent
  )

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (met)
  )

  ;; simple 1-minute step action
  (:action wait
    :parameters (?a - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?loc ?t1) (succ ?t1 ?t2))
    :effect (and (not (at ?a ?loc ?t1)) (at ?a ?loc ?t2))
  )

  ;; fixed-route travel: Golden Gate Park -> Marina District (16 minutes)
  (:action travel_ggp_to_marina
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time
    )
    :precondition (and
      (at ?a ggp ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
    )
    :effect (and
      (not (at ?a ggp ?t0))
      (at ?a marina ?t16)
    )
  )

  ;; fixed-route travel: Marina District -> Golden Gate Park (18 minutes)
  (:action travel_marina_to_ggp
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
      ?t18 - time
    )
    :precondition (and
      (at ?a marina ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
      (succ ?t16 ?t17) (succ ?t17 ?t18)
    )
    :effect (and
      (not (at ?a marina ?t0))
      (at ?a ggp ?t18)
    )
  )

  ;; Meeting James for at least 15 minutes (requires James to be at marina for the whole interval)
  ;; Meeting duration modeled as 15 successive 1-minute steps (t0 -> t15)
  (:action meet_james_15min
    :parameters (
      ?a - agent
      ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
      ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
      ?t12 - time ?t13 - time ?t14 - time ?t15 - time
    )
    :precondition (and
      (at ?a marina ?t0)
      (at james marina ?t0) (at james marina ?t1) (at james marina ?t2)
      (at james marina ?t3) (at james marina ?t4) (at james marina ?t5)
      (at james marina ?t6) (at james marina ?t7) (at james marina ?t8)
      (at james marina ?t9) (at james marina ?t10) (at james marina ?t11)
      (at james marina ?t12) (at james marina ?t13) (at james marina ?t14)
      (at james marina ?t15)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15)
    )
    :effect (and
      (not (at ?a marina ?t0))
      (at ?a marina ?t15)
      (met)
    )
  )
)