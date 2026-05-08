(define (domain calendar_scheduling_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (meeting_pending ?m - meeting)
    (requires ?m - meeting ?p - participant)
    (free ?p - participant ?t - timeslot)
    (allowed_start ?m - meeting ?t - timeslot)
    (scheduled_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_half_hour_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_pending ?m)
      (allowed_start ?m ?t)
      (requires ?m kathryn)
      (requires ?m charlotte)
      (requires ?m lauren)
      (free kathryn ?t)
      (free charlotte ?t)
      (free lauren ?t)
    )
    :effect (and
      (not (meeting_pending ?m))
      (scheduled_at ?m ?t)
    )
  )
)