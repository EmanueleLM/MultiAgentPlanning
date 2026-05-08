(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    gerald roy barbara - participant
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (work_slot ?s - slot)
    (preferred_slot ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
  )

  (:action schedule_meeting_at
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (work_slot ?s)
      (preferred_slot ?m ?s)
      (required ?m gerald)
      (free gerald ?s)
      (required ?m roy)
      (free roy ?s)
      (required ?m barbara)
      (free barbara ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)