(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_unscheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (available emily ?s)
      (available victoria ?s)
      (available nancy ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)