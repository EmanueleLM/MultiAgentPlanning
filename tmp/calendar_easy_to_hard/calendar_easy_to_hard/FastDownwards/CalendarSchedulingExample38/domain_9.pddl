(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (within ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?ad - person ?fr - person ?na - person ?pa - person ?wi - person ?di - person)
    :precondition (and
      (within ?s)
      (not (meeting-scheduled))
      (available ?ad ?s)
      (available ?fr ?s)
      (available ?na ?s)
      (available ?pa ?s)
      (available ?wi ?s)
      (available ?di ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)