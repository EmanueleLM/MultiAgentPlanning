(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?t - timeslot)
    (allowed_for_meeting ?m - meeting ?t - timeslot)
    (scheduled ?m - meeting ?t - timeslot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?t)
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
    )
  )
)