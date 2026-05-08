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
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)