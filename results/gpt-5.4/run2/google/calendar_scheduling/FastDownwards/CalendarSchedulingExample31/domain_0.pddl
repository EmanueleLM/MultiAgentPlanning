(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (slot_allowed ?m - meeting ?s - slot)
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (slot_allowed ?m ?s)
      (participant_free richard ?s)
      (participant_free martha ?s)
      (participant_free kimberly ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )
)