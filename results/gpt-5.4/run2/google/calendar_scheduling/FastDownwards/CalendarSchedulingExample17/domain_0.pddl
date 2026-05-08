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
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (allowed_for_meeting ?m ?t)
      (required ?m margaret)
      (free margaret ?t)
      (required ?m donna)
      (free donna ?t)
      (required ?m helen)
      (free helen ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
    )
  )
)