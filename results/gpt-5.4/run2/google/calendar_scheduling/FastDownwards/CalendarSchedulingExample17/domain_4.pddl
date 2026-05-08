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
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?t - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (allowed ?m ?t)
    )
    :effect (and
      (meeting_scheduled ?m ?t)
      (not (meeting_unscheduled ?m))
    )
  )
)