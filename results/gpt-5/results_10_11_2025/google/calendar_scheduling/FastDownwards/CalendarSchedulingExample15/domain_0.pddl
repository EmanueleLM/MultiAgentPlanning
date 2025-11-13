(define (domain monday-30min-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (all-required-available ?s - slot)
    (scheduled ?s - slot)
    (open)
  )
  (:action schedule-slot
    :parameters (?s - slot)
    :precondition (and
      (open)
      (slot ?s)
      (all-required-available ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (open))
    )
  )
)