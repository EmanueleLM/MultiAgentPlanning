(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m ?s - slot)
    (busy ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (allowed_slot ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (requires ?m brandon)
      (requires ?m jerry)
      (requires ?m bradley)
      (not (busy brandon ?s))
      (not (busy jerry ?s))
      (not (busy bradley ?s))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
    )
  )
)