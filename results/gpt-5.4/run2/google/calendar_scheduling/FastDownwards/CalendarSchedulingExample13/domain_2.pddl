(define (domain meeting_schedule_monday_half_hour)
  (:requirements :strips :typing)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (required ?m - meeting ?p - participant)
    (scheduled_at ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (chosen_participant ?m - meeting ?p - participant)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (required ?m gerald)
      (required ?m roy)
      (required ?m barbara)
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (chosen_participant ?m gerald)
      (chosen_participant ?m roy)
      (chosen_participant ?m barbara)
      (not (unscheduled ?m))
    )
  )
)