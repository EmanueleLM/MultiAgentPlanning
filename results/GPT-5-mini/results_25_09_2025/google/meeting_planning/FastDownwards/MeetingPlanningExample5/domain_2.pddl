(define (domain meeting-orchestration-classical)
  (:requirements :typing :negative-preconditions :adl :equality)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (can-travel ?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    (available ?a - agent ?t - time)
    (meeting-scheduled)
  )

  (:action agenta_travel20
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agenta ?from ?t1)
      (can-travel agenta ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agenta ?from ?t1))
      (at agenta ?to ?t2)
    )
  )

  (:action agenta_travel40
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agenta ?from ?t1)
      (can-travel agenta ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agenta ?from ?t1))
      (at agenta ?to ?t2)
    )
  )

  (:action agentb_travel15
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentb ?from ?t1)
      (can-travel agentb ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentb ?from ?t1))
      (at agentb ?to ?t2)
    )
  )

  (:action agentb_travel45
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentb ?from ?t1)
      (can-travel agentb ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at agentb ?from ?t1))
      (at agentb ?to ?t2)
    )
  )

  (:action agenta_wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agenta ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at agenta ?loc ?t1))
      (at agenta ?loc ?t2)
    )
  )

  (:action agentb_wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at agentb ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at agentb ?loc ?t1))
      (at agentb ?loc ?t2)
    )
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

      (at agenta ?loc ?t0) (at agentb ?loc ?t0) (available agenta ?t0) (available agentb ?t0)
      (at agenta ?loc ?t1) (at agentb ?loc ?t1) (available agenta ?t1) (available agentb ?t1)
      (at agenta ?loc ?t2) (at agentb ?loc ?t2) (available agenta ?t2) (available agentb ?t2)
      (at agenta ?loc ?t3) (at agentb ?loc ?t3) (available agenta ?t3) (available agentb ?t3)
      (at agenta ?loc ?t4) (at agentb ?loc ?t4) (available agenta ?t4) (available agentb ?t4)
      (at agenta ?loc ?t5) (at agentb ?loc ?t5) (available agenta ?t5) (available agentb ?t5)
      (at agenta ?loc ?t6) (at agentb ?loc ?t6) (available agenta ?t6) (available agentb ?t6)
      (at agenta ?loc ?t7) (at agentb ?loc ?t7) (available agenta ?t7) (available agentb ?t7)
      (at agenta ?loc ?t8) (at agentb ?loc ?t8) (available agenta ?t8) (available agentb ?t8)
      (at agenta ?loc ?t9) (at agentb ?loc ?t9) (available agenta ?t9) (available agentb ?t9)
      (at agenta ?loc ?t10) (at agentb ?loc ?t10) (available agenta ?t10) (available agentb ?t10)
      (at agenta ?loc ?t11) (at agentb ?loc ?t11) (available agenta ?t11) (available agentb ?t11)
      (at agenta ?loc ?t12) (at agentb ?loc ?t12) (available agenta ?t12) (available agentb ?t12)
      (at agenta ?loc ?t13) (at agentb ?loc ?t13) (available agenta ?t13) (available agentb ?t13)
      (at agenta ?loc ?t14) (at agentb ?loc ?t14) (available agenta ?t14) (available agentb ?t14)
      (at agenta ?loc ?t15) (at agentb ?loc ?t15) (available agenta ?t15) (available agentb ?t15)
      (at agenta ?loc ?t16) (at agentb ?loc ?t16) (available agenta ?t16) (available agentb ?t16)
      (at agenta ?loc ?t17) (at agentb ?loc ?t17) (available agenta ?t17) (available agentb ?t17)
      (at agenta ?loc ?t18) (at agentb ?loc ?t18) (available agenta ?t18) (available agentb ?t18)
      (at agenta ?loc ?t19) (at agentb ?loc ?t19) (available agenta ?t19) (available agentb ?t19)
      (at agenta ?loc ?t20) (at agentb ?loc ?t20) (available agenta ?t20) (available agentb ?t20)
      (at agenta ?loc ?t21) (at agentb ?loc ?t21) (available agenta ?t21) (available agentb ?t21)
      (at agenta ?loc ?t22) (at agentb ?loc ?t22) (available agenta ?t22) (available agentb ?t22)
      (at agenta ?loc ?t23) (at agentb ?loc ?t23) (available agenta ?t23) (available agentb ?t23)
      (at agenta ?loc ?t24) (at agentb ?loc ?t24) (available agenta ?t24) (available agentb ?t24)
      (at agenta ?loc ?t25) (at agentb ?loc ?t25) (available agenta ?t25) (available agentb ?t25)
      (at agenta ?loc ?t26) (at agentb ?loc ?t26) (available agenta ?t26) (available agentb ?t26)
      (at agenta ?loc ?t27) (at agentb ?loc ?t27) (available agenta ?t27) (available agentb ?t27)
      (at agenta ?loc ?t28) (at agentb ?loc ?t28) (available agenta ?t28) (available agentb ?t28)
      (at agenta ?loc ?t29) (at agentb ?loc ?t29) (available agenta ?t29) (available agentb ?t29)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)