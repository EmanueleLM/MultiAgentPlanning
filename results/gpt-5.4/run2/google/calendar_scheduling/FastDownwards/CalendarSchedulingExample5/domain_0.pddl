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

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled meeting_kathryn_charlotte_lauren))
      (allowed_slot meeting_kathryn_charlotte_lauren ?s)
      (required_for meeting_kathryn_charlotte_lauren kathryn)
      (required_for meeting_kathryn_charlotte_lauren charlotte)
      (required_for meeting_kathryn_charlotte_lauren lauren)
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
    )
    :effect (and
      (scheduled meeting_kathryn_charlotte_lauren)
      (scheduled_at meeting_kathryn_charlotte_lauren ?s)
    )
  )
)