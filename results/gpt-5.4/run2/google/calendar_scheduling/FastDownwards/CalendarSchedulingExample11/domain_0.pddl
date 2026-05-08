(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (meeting_scheduled ?s - slot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (not (busy alexander ?s))
      (not (busy elizabeth ?s))
      (not (busy walter ?s))
    )
    :effect (and
      (meeting_scheduled ?s)
      (scheduled)
    )
  )
)