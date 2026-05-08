(define (domain calendar_scheduling_example13)
  (:requirements :strips :typing)
  (:types
    participant
    slot
  )

  (:constants
    gerald roy barbara - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (candidate_slot ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (candidate_slot ?s)
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (scheduled ?s)
  )
)