(define (domain schedule_meeting_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_planned)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_planned))
      (free arthur ?t)
      (free theresa ?t)
      (free carl ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting_planned)
    )
  )
)