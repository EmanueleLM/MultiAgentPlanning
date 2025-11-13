(define (domain meeting-scheduling-strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot
  )
  (:predicates
    (available ?p - participant ?s - slot)
    (chosen ?s - slot)
    (assigned ?p - participant ?s - slot)
    (free ?s - slot)
    (selection-open)
    (distinct ?p1 - participant ?p2 - participant)
    (meeting-scheduled)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (selection-open)
      (free ?s)
    )
    :effect (and
      (chosen ?s)
      (not (selection-open))
    )
  )

  (:action assign-participant
    :parameters (?p - participant ?s - slot)
    :precondition (and
      (chosen ?s)
      (available ?p ?s)
      (not (assigned ?p ?s))
    )
    :effect (assigned ?p ?s)
  )

  (:action finalize-meeting
    :parameters (?p1 ?p2 ?p3 - participant ?s - slot)
    :precondition (and
      (chosen ?s)
      (assigned ?p1 ?s)
      (assigned ?p2 ?s)
      (assigned ?p3 ?s)
      (distinct ?p1 ?p2)
      (distinct ?p1 ?p3)
      (distinct ?p2 ?p3)
    )
    :effect (meeting-scheduled)
  )
)