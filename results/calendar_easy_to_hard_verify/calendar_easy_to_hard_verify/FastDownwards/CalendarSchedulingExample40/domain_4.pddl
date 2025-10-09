(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:constants rachel katherine kelly cynthia anthony ryan richard - person)

  (:predicates
    (busy ?p - person ?s - slot)
    (identified ?s - slot)
    (assigned ?s - slot)
    (meeting-scheduled)
  )

  (:action identify-slot
    :parameters (?s - slot)
    :precondition (and
      (not (identified ?s))
      (not (busy rachel ?s))
      (not (busy katherine ?s))
      (not (busy kelly ?s))
      (not (busy cynthia ?s))
      (not (busy anthony ?s))
      (not (busy ryan ?s))
      (not (busy richard ?s))
    )
    :effect (identified ?s)
  )

  (:action assign-slot
    :parameters (?s - slot)
    :precondition (and
      (identified ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (assigned ?s)
    )
  )
)