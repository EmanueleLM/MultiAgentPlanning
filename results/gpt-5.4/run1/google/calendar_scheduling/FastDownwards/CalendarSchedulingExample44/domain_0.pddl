(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?s)
      (free isabella ?s)
      (free ronald ?s)
      (free amanda ?s)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)