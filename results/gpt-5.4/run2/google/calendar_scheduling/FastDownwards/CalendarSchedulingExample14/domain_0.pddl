(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (busy ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (disallowed_for_meeting ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (not (disallowed_for_meeting ?m ?s))
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