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
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (allowed_slot ?s)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)