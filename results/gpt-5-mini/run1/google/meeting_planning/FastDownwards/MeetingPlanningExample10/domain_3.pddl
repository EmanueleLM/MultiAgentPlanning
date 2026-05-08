(define (domain meeting-planning)
  (:requirements :strips :typing)
  (:types agent location time)

  ;; Instance-specific constants (declared here so actions may refer to them directly)
  (:constants
    you james - agent
    ggp marina - location
  )

  (:predicates
    ;; agent location at a specific time
    (at ?a - agent ?loc - location ?t - time)
    ;; successor relation for time steps
    (succ ?t1 - time ?t2 - time)
    ;; goal flag: met James for required duration
    (met)
  )

  ;; stay one minute at the same location (advance time by one step)
  (:action wait_one_minute
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at you ?loc ?t1) (succ ?t1 ?t2))
    :effect (and (not (at you ?loc ?t1)) (at you ?loc ?t2))
  )

  ;; travel from Golden Gate Park to Marina District: 16 minutes
  ;; consumes 16 successor steps: t0 -> t1 -> ... -> t16
  (:action travel_ggp_to_marina
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
                 ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
                 ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time)
    :precondition (and
      (at you ggp ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
    )
    :effect (and
      (not (at you ggp ?t0))
      (at you marina ?t16)
    )
  )

  ;; travel from Marina District to Golden Gate Park: 18 minutes
  ;; consumes 18 successor steps: t0 -> ... -> t18
  (:action travel_marina_to_ggp
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
                 ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
                 ?t12 - time ?t13 - time ?t14 - time ?t15 - time ?t16 - time ?t17 - time
                 ?t18 - time)
    :precondition (and
      (at you marina ?t0)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15) (succ ?t15 ?t16)
      (succ ?t16 ?t17) (succ ?t17 ?t18)
    )
    :effect (and
      (not (at you marina ?t0))
      (at you ggp ?t18)
    )
  )

  ;; Meet James for a contiguous 15-minute interval.
  ;; This action is instance-specific: requires you to be at marina at the interval start
  ;; and requires James to be at marina for the whole interval.
  ;; We model a 15-minute meeting as occupying successor chain t0 -> ... -> t15 (15 minute duration)
  (:action meet_james_15min
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time
                 ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time
                 ?t12 - time ?t13 - time ?t14 - time ?t15 - time)
    :precondition (and
      ;; you must be at marina at meeting start
      (at you marina ?t0)
      ;; James must be present at marina for the entire interval (from ?t0 through ?t15)
      (at james marina ?t0) (at james marina ?t1) (at james marina ?t2)
      (at james marina ?t3) (at james marina ?t4) (at james marina ?t5)
      (at james marina ?t6) (at james marina ?t7) (at james marina ?t8)
      (at james marina ?t9) (at james marina ?t10) (at james marina ?t11)
      (at james marina ?t12) (at james marina ?t13) (at james marina ?t14)
      (at james marina ?t15)
      ;; contiguous time steps covering 15 minutes (succ chain length 15)
      (succ ?t0 ?t1) (succ ?t1 ?t2) (succ ?t2 ?t3) (succ ?t3 ?t4)
      (succ ?t4 ?t5) (succ ?t5 ?t6) (succ ?t6 ?t7) (succ ?t7 ?t8)
      (succ ?t8 ?t9) (succ ?t9 ?t10) (succ ?t10 ?t11) (succ ?t11 ?t12)
      (succ ?t12 ?t13) (succ ?t13 ?t14) (succ ?t14 ?t15)
    )
    :effect (and
      ;; advance you from meeting start to meeting end (you remain at marina)
      (not (at you marina ?t0))
      (at you marina ?t15)
      ;; record that the required meeting happened
      (met)
    )
  )
)