(define (domain calendar_scheduling_example20)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot stage)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (common ?t - timeslot)
    (preferred ?t - timeslot)
    (chosen ?t - timeslot)
    (assigned_ralph ?t - timeslot)
    (assigned_peter ?t - timeslot)
    (assigned_daniel ?t - timeslot)
    (unassigned ?p - participant)
    (role_ralph ?p - participant)
    (role_peter ?p - participant)
    (role_daniel ?p - participant)
    (selection_open)
    (atstage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action choose_slot
    :parameters (?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (atstage ?s1)
      (next ?s1 ?s2)
      (common ?t)
      (selection_open)
    )
    :effect (and
      (chosen ?t)
      (not (selection_open))
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )

  (:action assign_ralph
    :parameters (?p - participant ?t - timeslot ?s0 - stage ?s1 - stage)
    :precondition (and
      (role_ralph ?p)
      (atstage ?s1)
      (next ?s0 ?s1)
      (chosen ?t)
      (available ?p ?t)
      (unassigned ?p)
    )
    :effect (and
      (assigned_ralph ?t)
      (not (unassigned ?p))
    )
  )

  (:action assign_peter
    :parameters (?p - participant ?t - timeslot ?s0 - stage ?s1 - stage)
    :precondition (and
      (role_peter ?p)
      (atstage ?s1)
      (next ?s0 ?s1)
      (chosen ?t)
      (available ?p ?t)
      (unassigned ?p)
    )
    :effect (and
      (assigned_peter ?t)
      (not (unassigned ?p))
    )
  )

  (:action assign_daniel
    :parameters (?p - participant ?t - timeslot ?s0 - stage ?s1 - stage)
    :precondition (and
      (role_daniel ?p)
      (atstage ?s1)
      (next ?s0 ?s1)
      (chosen ?t)
      (available ?p ?t)
      (unassigned ?p)
    )
    :effect (and
      (assigned_daniel ?t)
      (not (unassigned ?p))
    )
  )

  (:action finalize
    :parameters (?t - timeslot ?s1 - stage ?s2 - stage)
    :precondition (and
      (atstage ?s1)
      (next ?s1 ?s2)
      (chosen ?t)
      (assigned_ralph ?t)
      (assigned_peter ?t)
      (assigned_daniel ?t)
    )
    :effect (and
      (not (atstage ?s1))
      (atstage ?s2)
    )
  )
)