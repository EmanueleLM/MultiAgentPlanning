(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (chosen ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free roy ?s)
      (free kathryn ?s)
      (free amy ?s)
    )
    :effect (chosen ?s)
  )
)