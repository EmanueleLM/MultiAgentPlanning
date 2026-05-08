(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:constants
    roy kathryn amy - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (chosen ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free roy ?s)
      (free kathryn ?s)
      (free amy ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (chosen ?s)
      (meeting_scheduled)
    )
  )
)