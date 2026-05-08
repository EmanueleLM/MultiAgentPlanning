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
    :parameters (?m - meeting ?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (scheduled ?m))
      (requires_participant ?m ?p1)
      (requires_participant ?m ?p2)
      (requires_participant ?m ?p3)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (allowed_for_meeting ?m ?t)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)