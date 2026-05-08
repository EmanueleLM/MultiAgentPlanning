(define (domain meeting_scheduling_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (allowed_slot ?t - timeslot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?t - timeslot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?t)
      (free brian ?t)
      (free billy ?t)
      (free patricia ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)