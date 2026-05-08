(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (allowed_for_meeting ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?s)
      (participant_free margaret ?s)
      (participant_free donna ?s)
      (participant_free helen ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
    )
  )
)