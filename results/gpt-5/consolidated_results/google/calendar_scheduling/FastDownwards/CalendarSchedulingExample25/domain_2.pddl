(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot
  )
  (:predicates
    (is-participant ?p - participant)
    (is-slot ?s - slot)
    (available ?p - participant ?s - slot)
    (within-work-hours ?s - slot)
    (duration-60 ?s - slot)
    (ends-by-1430 ?s - slot)
    (audited-recommended ?s - slot)
    (all-required-available ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  (:action select-and-schedule-recommended
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
      (audited-recommended ?s)
      (within-work-hours ?s)
      (duration-60 ?s)
      (ends-by-1430 ?s)
      (all-required-available ?s)
      (not (scheduled))
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)