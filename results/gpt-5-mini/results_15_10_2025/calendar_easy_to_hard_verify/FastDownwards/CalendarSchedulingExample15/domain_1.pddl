(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )
  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and (available jason ?s) (available william ?s) (available frances ?s) (available rachel ?s))
    :effect (and (chosen ?s) (scheduled))
  )
)