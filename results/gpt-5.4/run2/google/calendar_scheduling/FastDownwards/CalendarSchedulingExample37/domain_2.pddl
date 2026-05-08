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
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_pending ?m)
      (free gregory ?t)
      (free teresa ?t)
      (free carol ?t)
    )
    :effect (and
      (not (meeting_pending ?m))
      (meeting_scheduled ?m ?t)
    )
  )
)