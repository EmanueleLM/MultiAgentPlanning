(define (domain meeting-orchestration-classical)
  (:requirements :typing :negative-preconditions :adl :action-costs :equality)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (can-travel ?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    (available ?a - agent ?t - time)
    (meeting-scheduled)
  )

  (:action agentA_travel20
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentA ?from ?t1)
      (can-travel agentA ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentA ?from ?t1))
      (at agentA ?to ?t2)
    )
    :cost 20
  )

  (:action agentA_travel40
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentA ?from ?t1)
      (can-travel agentA ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentA ?from ?t1))
      (at agentA ?to ?t2)
    )
    :cost 40
  )

  (:action agentB_travel15
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentB ?from ?t1)
      (can-travel agentB ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentB ?from ?t1))
      (at agentB ?to ?t2)
    )
    :cost 0
  )

  (:action agentB_travel45
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentB ?from ?t1)
      (can-travel agentB ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentB ?from ?t1))
      (at agentB ?to ?t2)
    )
    :cost 0
  )

  (:action agentA_wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentA ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at agentA ?loc ?t1))
      (at agentA ?loc ?t2)
    )
    :cost 0
  )

  (:action agentB_wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentB ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at agentB ?loc ?t1))
      (at agentB ?loc ?t2)
    )
    :cost 0
  )

  (:action orchestrator_start_meeting
    :parameters (?loc - location
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time
                 ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time
                 ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time
                 ?t15 - time ?t16 - time ?t17 - time ?t18 - time ?t19 - time
                 ?t20 - time ?t21 - time ?t22 - time ?t23 - time ?t24 - time
                 ?t25 - time ?t26 - time ?t27 - time ?t28 - time ?t29 - time)
    :precondition (and
      (not (meeting-scheduled))

      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
      (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8)
      (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11) (next ?t11 ?t12)
      (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?t15) (next ?t15 ?t16)
      (next ?t16 ?t17) (next ?t17 ?t18) (next ?t18 ?t19) (next ?t19 ?t20)
      (next ?t20 ?t21) (next ?t21 ?t22) (next ?t22 ?t23) (next ?t23 ?t24)
      (next ?t24 ?t25) (next ?t25 ?t26) (next ?t26 ?t27) (next ?t27 ?t28)
      (next ?t28 ?t29)

      (at agentA ?loc ?t0) (at agentB ?loc ?t0) (available agentA ?t0) (available agentB ?t0)
      (at agentA ?loc ?t1) (at agentB ?loc ?t1) (available agentA ?t1) (available agentB ?t1)
      (at agentA ?loc ?t2) (at agentB ?loc ?t2) (available agentA ?t2) (available agentB ?t2)
      (at agentA ?loc ?t3) (at agentB ?loc ?t3) (available agentA ?t3) (available agentB ?t3)
      (at agentA ?loc ?t4) (at agentB ?loc ?t4) (available agentA ?t4) (available agentB ?t4)
      (at agentA ?loc ?t5) (at agentB ?loc ?t5) (available agentA ?t5) (available agentB ?t5)
      (at agentA ?loc ?t6) (at agentB ?loc ?t6) (available agentA ?t6) (available agentB ?t6)
      (at agentA ?loc ?t7) (at agentB ?loc ?t7) (available agentA ?t7) (available agentB ?t7)
      (at agentA ?loc ?t8) (at agentB ?loc ?t8) (available agentA ?t8) (available agentB ?t8)
      (at agentA ?loc ?t9) (at agentB ?loc ?t9) (available agentA ?t9) (available agentB ?t9)
      (at agentA ?loc ?t10) (at agentB ?loc ?t10) (available agentA ?t10) (available agentB ?t10)
      (at agentA ?loc ?t11) (at agentB ?loc ?t11) (available agentA ?t11) (available agentB ?t11)
      (at agentA ?loc ?t12) (at agentB ?loc ?t12) (available agentA ?t12) (available agentB ?t12)
      (at agentA ?loc ?t13) (at agentB ?loc ?t13) (available agentA ?t13) (available agentB ?t13)
      (at agentA ?loc ?t14) (at agentB ?loc ?t14) (available agentA ?t14) (available agentB ?t14)
      (at agentA ?loc ?t15) (at agentB ?loc ?t15) (available agentA ?t15) (available agentB ?t15)
      (at agentA ?loc ?t16) (at agentB ?loc ?t16) (available agentA ?t16) (available agentB ?t16)
      (at agentA ?loc ?t17) (at agentB ?loc ?t17) (available agentA ?t17) (available agentB ?t17)
      (at agentA ?loc ?t18) (at agentB ?loc ?t18) (available agentA ?t18) (available agentB ?t18)
      (at agentA ?loc ?t19) (at agentB ?loc ?t19) (available agentA ?t19) (available agentB ?t19)
      (at agentA ?loc ?t20) (at agentB ?loc ?t20) (available agentA ?t20) (available agentB ?t20)
      (at agentA ?loc ?t21) (at agentB ?loc ?t21) (available agentA ?t21) (available agentB ?t21)
      (at agentA ?loc ?t22) (at agentB ?loc ?t22) (available agentA ?t22) (available agentB ?t22)
      (at agentA ?loc ?t23) (at agentB ?loc ?t23) (available agentA ?t23) (available agentB ?t23)
      (at agentA ?loc ?t24) (at agentB ?loc ?t24) (available agentA ?t24) (available agentB ?t24)
      (at agentA ?loc ?t25) (at agentB ?loc ?t25) (available agentA ?t25) (available agentB ?t25)
      (at agentA ?loc ?t26) (at agentB ?loc ?t26) (available agentA ?t26) (available agentB ?t26)
      (at agentA ?loc ?t27) (at agentB ?loc ?t27) (available agentA ?t27) (available agentB ?t27)
      (at agentA ?loc ?t28) (at agentB ?loc ?t28) (available agentA ?t28) (available agentB ?t28)
      (at agentA ?loc ?t29) (at agentB ?loc ?t29) (available agentA ?t29) (available agentB ?t29)
    )
    :effect (and
      (meeting-scheduled)
    )
    :cost 0
  )
)