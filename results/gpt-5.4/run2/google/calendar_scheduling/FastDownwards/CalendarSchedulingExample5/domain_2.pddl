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
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (allowed_slot ?m ?s)
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
      (required_for ?m kathryn)
      (required_for ?m charlotte)
      (required_for ?m lauren)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
    )
  )
)