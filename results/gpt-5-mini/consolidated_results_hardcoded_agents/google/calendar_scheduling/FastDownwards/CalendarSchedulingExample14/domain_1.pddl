(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (slot-free ?p - person ?s - slot)
    (within-hours ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  (:action choose-slot
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (within-hours ?s)
      (slot-free ?p1 ?s)
      (slot-free ?p2 ?s)
      (slot-free ?p3 ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
      (not (slot-free ?p1 ?s))
      (not (slot-free ?p2 ?s))
      (not (slot-free ?p3 ?s))
    )
  )
)