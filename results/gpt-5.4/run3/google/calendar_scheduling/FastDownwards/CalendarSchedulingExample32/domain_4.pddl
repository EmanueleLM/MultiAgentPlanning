(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    emily melissa frank - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (unscheduled)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (allowed_slot ?s)
      (available emily ?s)
      (available melissa ?s)
      (available frank ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (unscheduled))
    )
  )
)