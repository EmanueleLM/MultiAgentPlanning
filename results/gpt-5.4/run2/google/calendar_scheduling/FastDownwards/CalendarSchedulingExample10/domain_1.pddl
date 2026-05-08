(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    diana ethan janet - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_start ?s - slot)
    (scheduled)
    (scheduled_at ?s - slot)
    (open)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (open)
      (allowed_start ?s)
      (free diana ?s)
      (free ethan ?s)
      (free janet ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (scheduled_at ?s)
      (not (open))
    )
  )
)