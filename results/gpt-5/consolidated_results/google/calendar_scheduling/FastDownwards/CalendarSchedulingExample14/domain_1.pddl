(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants
    brandon jerry bradley - person
  )
  (:predicates
    (slot-free ?p - person ?s - slot)
    (within-hours ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (within-hours ?s)
      (slot-free brandon ?s)
      (slot-free jerry ?s)
      (slot-free bradley ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)