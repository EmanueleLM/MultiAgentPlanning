(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    slot
  )

  (:constants
    gregory teresa carol - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (selected ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (free gregory ?s)
      (free teresa ?s)
      (free carol ?s)
    )
    :effect (and
      (selected ?s)
      (meeting_scheduled)
    )
  )
)