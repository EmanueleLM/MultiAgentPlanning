(define (domain meeting_schedule_monday_bzt)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    bradley zachary teresa - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?s)
      (requires ?m bradley)
      (requires ?m zachary)
      (requires ?m teresa)
      (free bradley ?s)
      (free zachary ?s)
      (free teresa ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)