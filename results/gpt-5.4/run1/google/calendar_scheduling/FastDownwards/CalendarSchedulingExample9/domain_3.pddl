(define (domain calendar_scheduling_example9)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (meeting_unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_half_hour_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition
      (and
        (meeting_unscheduled ?m)
        (free diane ?s)
        (free kelly ?s)
        (free deborah ?s)
      )
    :effect
      (and
        (not (meeting_unscheduled ?m))
        (scheduled_at ?m ?s)
      )
  )
)