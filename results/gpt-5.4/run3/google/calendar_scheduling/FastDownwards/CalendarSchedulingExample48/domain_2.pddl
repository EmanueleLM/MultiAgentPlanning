(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    interval
  )

  (:constants
    janet rachel cynthia - participant
  )

  (:predicates
    (available ?p - participant ?i - interval)
    (allowed_interval ?i - interval)
    (meeting_unscheduled)
    (scheduled ?i - interval)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?i - interval)
    :precondition (and
      (meeting_unscheduled)
      (allowed_interval ?i)
      (available janet ?i)
      (available rachel ?i)
      (available cynthia ?i)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?i)
      (meeting_scheduled)
      (not (meeting_unscheduled))
    )
  )
)