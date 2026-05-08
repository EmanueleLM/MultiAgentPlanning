(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (required_participant ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (scheduled ?m))
      (required_participant ?m ?p1)
      (required_participant ?m ?p2)
      (required_participant ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_in ?m ?s)
    )
  )
)