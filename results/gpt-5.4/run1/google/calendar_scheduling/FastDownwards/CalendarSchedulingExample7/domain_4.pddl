(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    heather nicholas zachary - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (unscheduled)
    (meeting_scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (allowed_slot ?s)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (not (unscheduled))
    )
  )
)