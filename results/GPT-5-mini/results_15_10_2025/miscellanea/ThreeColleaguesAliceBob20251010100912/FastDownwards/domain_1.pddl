(define (domain earliest-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (all-available ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (all-available ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)