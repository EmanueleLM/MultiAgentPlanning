(define (domain scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and (not (meeting-scheduled)) (free michelle ?t) (free steven ?t) (free jerry ?t))
    :effect (and (meeting-scheduled) (scheduled-at ?t))
  )
)