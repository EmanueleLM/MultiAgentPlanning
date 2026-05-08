(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:constants
    kathryn charlotte lauren - participant
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (allowed_slot ?t - timeslot)
    (meeting_unscheduled ?m - meeting)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (allowed_slot ?t)
      (free kathryn ?t)
      (free charlotte ?t)
      (free lauren ?t)
    )
    :effect (and
      (not (meeting_unscheduled ?m))
      (scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)