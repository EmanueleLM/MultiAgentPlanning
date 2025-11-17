(define (domain calendar_scheduling_example20)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (chosen ?t - timeslot)
    (assigned ?p - participant ?t - timeslot)
    (unassigned ?p - participant)
    (preferred ?t - timeslot)
    (all_available ?t - timeslot)
    (some_chosen)
  )

  (:action choose_slot
    :parameters (?t - timeslot)
    :precondition (and
      (all_available ?t)
      (not (some_chosen))
    )
    :effect (and
      (chosen ?t)
      (some_chosen)
    )
  )

  (:action assign_participant
    :parameters (?p - participant ?t - timeslot)
    :precondition (and
      (some_chosen)
      (chosen ?t)
      (unassigned ?p)
      (available ?p ?t)
    )
    :effect (and
      (assigned ?p ?t)
      (not (unassigned ?p))
    )
  )
)