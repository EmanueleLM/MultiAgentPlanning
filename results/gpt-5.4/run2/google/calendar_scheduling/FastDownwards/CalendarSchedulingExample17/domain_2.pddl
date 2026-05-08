(define (domain calendar_scheduling_example17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    meeting
    participant
    timeslot
  )

  (:predicates
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting ?t - timeslot)
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?t - timeslot)
    (allowed ?m - meeting ?t - timeslot)
  )

  (:action schedule_at
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (allowed ?m ?t)
      (required ?m margaret)
      (required ?m donna)
      (required ?m helen)
      (free margaret ?t)
      (free donna ?t)
      (free helen ?t)
    )
    :effect (and
      (meeting_scheduled ?m ?t)
      (not (meeting_unscheduled ?m))
    )
  )
)