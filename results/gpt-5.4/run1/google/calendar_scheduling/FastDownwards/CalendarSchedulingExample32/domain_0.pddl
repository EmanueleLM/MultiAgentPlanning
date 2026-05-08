(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (requires_participant ?m emily)
      (requires_participant ?m melissa)
      (requires_participant ?m frank)
      (free emily ?s)
      (free melissa ?s)
      (free frank ?s)
      (not (scheduled ?m ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)