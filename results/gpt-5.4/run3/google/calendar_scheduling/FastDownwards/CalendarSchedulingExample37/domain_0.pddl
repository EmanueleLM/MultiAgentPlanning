(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    day
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (slot_on_day ?s - slot ?d - day)
    (scheduled ?s - slot)
    (unscheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (slot_on_day ?s monday)
      (free gregory ?s)
      (free teresa ?s)
      (free carol ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (unscheduled))
    )
  )
)