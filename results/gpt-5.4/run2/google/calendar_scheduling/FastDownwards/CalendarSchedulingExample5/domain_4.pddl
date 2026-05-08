(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (meeting_to_schedule ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_to_schedule ?m)
      (allowed_slot ?m ?s)
      (scheduled_at ?m ?s)
    )
    :effect (and)
  )
)