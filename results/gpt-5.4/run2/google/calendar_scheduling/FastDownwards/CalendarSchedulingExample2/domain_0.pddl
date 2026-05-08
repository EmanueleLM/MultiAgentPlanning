(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (forbidden ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_unscheduled ?m - meeting)
    (scheduled_somewhere ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (not (forbidden ?s))
      (not (busy roy ?s))
      (not (busy kathryn ?s))
      (not (busy amy ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (scheduled_somewhere ?m)
      (not (meeting_unscheduled ?m))
    )
  )
)