(define (domain calendar_scheduling_example8)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (free_slot ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule_at
    :parameters (?s - slot)
    :precondition (free_slot ?s)
    :effect (scheduled ?s)
  )
)