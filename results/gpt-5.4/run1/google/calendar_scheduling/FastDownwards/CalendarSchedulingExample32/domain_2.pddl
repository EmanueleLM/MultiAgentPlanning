(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (requires ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (allowed ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed ?m ?s)
      (requires ?m emily)
      (requires ?m melissa)
      (requires ?m frank)
      (free emily ?s)
      (free melissa ?s)
      (free frank ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)