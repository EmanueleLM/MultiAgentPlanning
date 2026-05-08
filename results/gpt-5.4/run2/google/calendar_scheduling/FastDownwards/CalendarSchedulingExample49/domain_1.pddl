(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    teresa kathleen patricia - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (required ?p - participant)
    (allowed_slot ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (required teresa)
      (required kathleen)
      (required patricia)
      (free teresa ?s)
      (free kathleen ?s)
      (free patricia ?s)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)