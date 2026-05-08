(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (requires ?m richard)
      (requires ?m martha)
      (requires ?m kimberly)
      (available richard ?s)
      (available martha ?s)
      (available kimberly ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)