(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    anthony pamela zachary - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed ?s - slot)
    (selected ?s - slot)
    (meeting_unscheduled)
    (meeting_scheduled)
  )

  (:action schedule_at
    :parameters (?s - slot)
    :precondition
      (and
        (meeting_unscheduled)
        (allowed ?s)
        (free anthony ?s)
        (free pamela ?s)
        (free zachary ?s)
      )
    :effect
      (and
        (meeting_scheduled)
        (selected ?s)
        (not (meeting_unscheduled))
      )
  )
)