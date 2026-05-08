(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (available ?p - participant ?s - slot)
    (allowed_start ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (allowed_start ?m ?s)
      (required ?m heather)
      (required ?m nicholas)
      (required ?m zachary)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
    )
  )
)