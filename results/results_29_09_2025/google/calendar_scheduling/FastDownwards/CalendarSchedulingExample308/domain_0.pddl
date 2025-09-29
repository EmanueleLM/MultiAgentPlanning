(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :adl :fluents)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )
  (:functions
    (total-cost)
    (slot-cost ?s - slot)
  )
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (forall (?p - person) (available ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (increase (total-cost) (slot-cost ?s))
    )
  )
)