(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:constants diane kelly deborah - person)

  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting_at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (not (scheduled)) (free diane ?s) (free kelly ?s) (free deborah ?s))
    :effect (and (scheduled) (meeting_at ?s))
  )
)