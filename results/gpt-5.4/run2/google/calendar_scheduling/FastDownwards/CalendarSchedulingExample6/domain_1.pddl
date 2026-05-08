(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    window
    meeting
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (available ?p - participant ?w - window)
    (scheduled ?m - meeting ?w - window)
    (unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?w - window ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (available ?p1 ?w)
      (available ?p2 ?w)
      (available ?p3 ?w)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled ?m ?w)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)