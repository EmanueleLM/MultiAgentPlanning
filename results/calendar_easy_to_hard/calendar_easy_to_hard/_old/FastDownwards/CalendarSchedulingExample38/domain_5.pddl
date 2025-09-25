(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (within ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (includes-all-participants)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?a - person ?f - person ?n - person ?pa - person ?w - person ?d - person)
    :precondition (and
      (within ?s)
      (not (meeting-scheduled))
      (available ?a ?s)
      (available ?f ?s)
      (available ?n ?s)
      (available ?pa ?s)
      (available ?w ?s)
      (available ?d ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (includes-all-participants)
    )
  )
)