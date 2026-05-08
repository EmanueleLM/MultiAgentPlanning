(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    richard martha kimberly - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting_scheduled ?m))
      (allowed_slot ?m ?s)
      (requires ?m richard)
      (requires ?m martha)
      (requires ?m kimberly)
      (free richard ?s)
      (free martha ?s)
      (free kimberly ?s)
    )
    :effect (and
      (meeting_scheduled ?m)
      (scheduled_at ?m ?s)
    )
  )
)