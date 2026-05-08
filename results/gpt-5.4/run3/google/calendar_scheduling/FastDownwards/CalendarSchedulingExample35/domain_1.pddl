(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:constants
    bradley zachary teresa - participant
  )

  (:predicates
    (scheduled ?m - meeting)
    (meeting_at ?m - meeting ?s - slot)
    (free ?p - participant ?s - slot)
    (allowed_start ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (allowed_start ?m ?s)
      (free bradley ?s)
      (free zachary ?s)
      (free teresa ?s)
    )
    :effect (and
      (scheduled ?m)
      (meeting_at ?m ?s)
    )
  )
)