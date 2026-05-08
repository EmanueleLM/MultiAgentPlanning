(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:constants
    diana ethan janet - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_unscheduled)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (allowed_slot ?s)
      (free diana ?s)
      (free ethan ?s)
      (free janet ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
      (not (meeting_unscheduled))
    )
  )
)