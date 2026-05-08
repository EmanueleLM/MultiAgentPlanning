(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (preferred_slot ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (slot_open ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (slot_open ?s)
      (free jeffrey ?s)
      (free virginia ?s)
      (free melissa ?s)
      (preferred_slot ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
      (not (slot_open ?s))
    )
  )
)