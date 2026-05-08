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
    :parameters (?m - meeting ?w - window)
    :precondition (and
      (unscheduled ?m)
      (required ?m thomas)
      (required ?m dylan)
      (required ?m jerry)
      (available thomas ?w)
      (available dylan ?w)
      (available jerry ?w)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled ?m ?w)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)