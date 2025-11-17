(define (domain calendar_scheduling_example20)
  (:requirements :strips :typing)
  (:types participant timeslot stage)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (common ?t - timeslot)
    (chosen ?t - timeslot)
    (assigned ?p - participant ?t - timeslot)
    (preferred ?t - timeslot)
    (role_ralph ?p - participant)
    (role_peter ?p - participant)
    (role_daniel ?p - participant)
    (atstage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action choose_slot
    :parameters (?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (atstage ?s1)
      (next ?s1 ?s2)
      (common ?t)
    )
    :effect (and
      (chosen ?t)
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )

  (:action assign_ralph
    :parameters (?p - participant ?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (role_ralph ?p)
      (chosen ?t)
      (available ?p ?t)
      (atstage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (assigned ?p ?t)
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )

  (:action assign_peter
    :parameters (?p - participant ?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (role_peter ?p)
      (chosen ?t)
      (available ?p ?t)
      (atstage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (assigned ?p ?t)
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )

  (:action assign_daniel
    :parameters (?p - participant ?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (role_daniel ?p)
      (chosen ?t)
      (available ?p ?t)
      (atstage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (assigned ?p ?t)
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )
)