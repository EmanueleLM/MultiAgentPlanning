(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_unscheduled)
  )

  (:action schedule_meeting_at_slot
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (allowed_slot ?s)
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)