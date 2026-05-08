(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing)
  (:types
    participant
    slot
  )

  (:predicates
    (required ?p - participant)
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
  )

  (:action schedule_at
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next_slot ?s1 ?s2)
      (required arthur)
      (required michael)
      (required samantha)
      (free arthur ?s1)
      (free arthur ?s2)
      (free michael ?s1)
      (free michael ?s2)
      (free samantha ?s1)
      (free samantha ?s2)
    )
    :effect (and
      (scheduled)
    )
  )
)