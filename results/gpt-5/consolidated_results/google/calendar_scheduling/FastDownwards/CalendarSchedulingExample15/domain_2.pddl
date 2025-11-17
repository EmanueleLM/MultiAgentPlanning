(define (domain monday-30min-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (within ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (all-available ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule-slot
    :parameters (?s - slot)
    :precondition (and
      (within ?s)
      (all-available ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
    )
  )
)