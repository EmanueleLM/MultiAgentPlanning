(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (allowed-start ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
      (allowed-start ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)