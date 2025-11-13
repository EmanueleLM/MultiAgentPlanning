(define (domain calendar_scheduling_example28)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (mutual ?s - slot)
    (earliest ?s - slot)
    (selected ?s - slot)
    (meeting-selected)
    (assigned ?p - participant ?s - slot)
    (attending ?p - participant)
  )

  (:action select-slot
    :parameters (?s - slot)
    :precondition (and
      (mutual ?s)
      (earliest ?s)
      (not (meeting-selected)))
    :effect (and
      (selected ?s)
      (meeting-selected))
  )

  (:action assign-participant
    :parameters (?p - participant ?s - slot)
    :precondition (and
      (participant ?p)
      (meeting-selected)
      (selected ?s)
      (free ?p ?s)
      (not (attending ?p))
      (not (assigned ?p ?s)))
    :effect (and
      (assigned ?p ?s)
      (attending ?p))
  )
)