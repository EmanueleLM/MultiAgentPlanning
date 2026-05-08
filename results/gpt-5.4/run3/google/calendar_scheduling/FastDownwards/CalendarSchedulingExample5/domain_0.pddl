(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (free ?p - participant ?t - timeslot)
    (allowed_for_meeting ?m - meeting ?t - timeslot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (allowed_for_meeting ?m ?t)
      (free kathryn ?t)
      (free charlotte ?t)
      (free lauren ?t)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)