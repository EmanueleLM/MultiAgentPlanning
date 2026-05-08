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
    :parameters (?m - meeting ?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (scheduled ?m))
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)