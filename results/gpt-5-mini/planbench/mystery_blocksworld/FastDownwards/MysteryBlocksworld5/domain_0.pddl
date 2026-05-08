(define (domain crave-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj phase)

  (:predicates
    (phase-current ?p - phase)
    (phase-successor ?p - phase ?q - phase)
    (examined ?o - obj)
    (offered ?o - obj)
    (craves ?o1 - obj ?o2 - obj)
    (other-object ?o1 - obj ?o2 - obj)
    (object-exists ?o - obj)
  )

  ;; Agent A examines object a in phase ph1 and advances to ph2
  (:action agentA_examine_a
    :parameters ()
    :precondition (and
      (phase-current ph1)
      (phase-successor ph1 ph2)
      (object-exists a)
    )
    :effect (and
      (examined a)
      (not (phase-current ph1))
      (phase-current ph2)
    )
  )

  ;; Agent B offers object c in phase ph2 and advances to ph3
  (:action agentB_offer_c
    :parameters ()
    :precondition (and
      (phase-current ph2)
      (phase-successor ph2 ph3)
      (examined a)
      (object-exists c)
    )
    :effect (and
      (offered c)
      (not (phase-current ph2))
      (phase-current ph3)
    )
  )

  ;; Agent A establishes the craving relation between a and c in phase ph3
  (:action agentA_crave_ac
    :parameters ()
    :precondition (and
      (phase-current ph3)
      (examined a)
      (offered c)
      (other-object a c)
      (object-exists a)
      (object-exists c)
    )
    :effect (and
      (craves a c)
    )
  )
)