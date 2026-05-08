(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (required ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (required ?m gregory)
      (required ?m teresa)
      (required ?m carol)
      (free gregory ?t)
      (free teresa ?t)
      (free carol ?t)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)