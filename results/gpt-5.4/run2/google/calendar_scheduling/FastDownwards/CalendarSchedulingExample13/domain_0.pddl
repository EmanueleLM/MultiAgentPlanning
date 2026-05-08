(define (domain meeting_schedule_monday_half_hour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (acceptable_slot ?m - meeting ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting_in_slot
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (acceptable_slot ?m ?s)
      (requires ?m gerald)
      (requires ?m roy)
      (requires ?m barbara)
      (participant_free gerald ?s)
      (participant_free roy ?s)
      (participant_free barbara ?s)
      (not (scheduled ?m ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)