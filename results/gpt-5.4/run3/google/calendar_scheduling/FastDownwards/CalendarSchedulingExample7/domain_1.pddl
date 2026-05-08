(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    heather nicholas zachary - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (free heather ?s)
      (free nicholas ?s)
      (free zachary ?s)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
    )
  )
)