(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    slot
  )

  (:constants
    teresa kathleen patricia - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_for_kathleen ?s - slot)
    (meeting_scheduled)
    (chosen_slot ?s - slot)
    (unscheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free teresa ?s)
      (free kathleen ?s)
      (free patricia ?s)
      (allowed_for_kathleen ?s)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_slot ?s)
      (not (unscheduled))
    )
  )
)