(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    bradley zachary teresa - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_set)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_set))
      (free bradley ?s)
      (free zachary ?s)
      (free teresa ?s)
    )
    :effect (and
      (meeting_set)
      (scheduled ?s)
    )
  )
)