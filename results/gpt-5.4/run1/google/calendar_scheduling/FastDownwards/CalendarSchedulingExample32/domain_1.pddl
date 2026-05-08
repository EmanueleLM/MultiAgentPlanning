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
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (requires_participant ?m ?p1)
      (requires_participant ?m ?p2)
      (requires_participant ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (scheduled ?m ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)