(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (required_for ?m - meeting ?p - participant)
    (allowed_slot ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (scheduled ?m))
      (allowed_slot ?m ?s)
      (required_for ?m ?p1)
      (required_for ?m ?p2)
      (required_for ?m ?p3)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
    )
  )
)