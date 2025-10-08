(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (not (scheduled)) (free diane ?s) (free kelly ?s) (free deborah ?s))
    :effect (and (scheduled) (meeting-at ?s))
  )
)