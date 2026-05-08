(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    raymond billy donald - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (free raymond ?s)
      (free billy ?s)
      (free donald ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)