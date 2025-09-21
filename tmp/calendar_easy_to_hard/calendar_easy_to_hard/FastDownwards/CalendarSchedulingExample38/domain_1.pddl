(define (domain unified-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types slot person)
  (:constants adam frances natalie patrick willie diana - person)

  (:predicates
    (within ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (includes-all-participants)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (within ?s)
      (not (meeting-scheduled))
      (available adam ?s)
      (available frances ?s)
      (available natalie ?s)
      (available patrick ?s)
      (available willie ?s)
      (available diana ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (includes-all-participants)
    )
  )
)