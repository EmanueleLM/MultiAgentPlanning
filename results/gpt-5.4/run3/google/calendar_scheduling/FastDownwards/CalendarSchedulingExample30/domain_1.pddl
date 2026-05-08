(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    jeffrey virginia melissa - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (meeting_scheduled)
    (scheduled_in ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (free jeffrey ?s)
      (free virginia ?s)
      (free melissa ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_in ?s)
    )
  )
)