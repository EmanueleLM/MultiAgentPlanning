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
    (scheduled ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?s)
      (free richard ?s)
      (free martha ?s)
      (free kimberly ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)