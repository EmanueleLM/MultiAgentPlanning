(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    participant
    meeting
    timeslot
  )

  (:constants
    roy kathryn amy - participant
  )

  (:predicates
    (participant_available ?p - participant ?t - timeslot)
    (allowed_slot ?m - meeting ?t - timeslot)
    (meeting_unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (allowed_slot ?m ?t)
      (participant_available roy ?t)
      (participant_available kathryn ?t)
      (participant_available amy ?t)
    )
    :effect (and
      (scheduled_at ?m ?t)
      (not (meeting_unscheduled ?m))
    )
  )
)