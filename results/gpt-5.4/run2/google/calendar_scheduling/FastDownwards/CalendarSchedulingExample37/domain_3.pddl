(define (domain calendar_scheduling_example37)
  (:requirements :strips :typing)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (meeting_pending ?m - meeting)
    (meeting_scheduled ?m - meeting ?t - timeslot)
  )

  (:action schedule_at
    :parameters (?m - meeting ?g - participant ?te - participant ?c - participant ?t - timeslot)
    :precondition (and
      (meeting_pending ?m)
      (free ?g ?t)
      (free ?te ?t)
      (free ?c ?t)
    )
    :effect (and
      (not (meeting_pending ?m))
      (meeting_scheduled ?m ?t)
    )
  )
)