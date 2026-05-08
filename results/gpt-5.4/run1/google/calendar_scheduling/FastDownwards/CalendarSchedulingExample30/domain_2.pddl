(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (allowed_for_meeting ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting_at_slot
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?s)
      (requires ?m jeffrey)
      (requires ?m virginia)
      (requires ?m melissa)
      (participant_free jeffrey ?s)
      (participant_free virginia ?s)
      (participant_free melissa ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)