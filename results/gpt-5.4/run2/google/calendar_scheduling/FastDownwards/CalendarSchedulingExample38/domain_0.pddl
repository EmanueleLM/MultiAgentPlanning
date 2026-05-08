(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (available catherine ?s)
      (available michael ?s)
      (available alexander ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (meeting_unscheduled ?m))
    )
  )
)