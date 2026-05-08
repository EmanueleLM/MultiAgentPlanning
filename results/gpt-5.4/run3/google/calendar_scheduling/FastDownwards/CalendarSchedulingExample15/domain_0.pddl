(define (domain meeting_schedule_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    joyce christine alexander - participant
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy joyce ?s))
      (not (busy christine ?s))
      (not (busy alexander ?s))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)