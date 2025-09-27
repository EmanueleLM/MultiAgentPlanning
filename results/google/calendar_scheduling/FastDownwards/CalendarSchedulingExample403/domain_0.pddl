(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (allfree ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (allfree ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)