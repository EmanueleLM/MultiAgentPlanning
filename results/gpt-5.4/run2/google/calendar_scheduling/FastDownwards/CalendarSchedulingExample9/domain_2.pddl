(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    diane kelly deborah - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_unscheduled)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
      (not (meeting_unscheduled))
    )
  )
)