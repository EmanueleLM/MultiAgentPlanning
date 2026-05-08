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
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (acceptable_slot ?m ?s)
      (requires ?m ?p1)
      (requires ?m ?p2)
      (requires ?m ?p3)
      (participant_free ?p1 ?s)
      (participant_free ?p2 ?s)
      (participant_free ?p3 ?s)
      (not (scheduled ?m ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)