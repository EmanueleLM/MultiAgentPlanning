(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (required ?p - participant)
    (busy ?p - participant ?s - slot)
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (start_candidate ?s - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
    (uses_slot ?s - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (start_candidate ?s1)
      (next_slot ?s1 ?s2)
      (free madison ?s1)
      (free madison ?s2)
      (free diana ?s1)
      (free diana ?s2)
      (free shirley ?s1)
      (free shirley ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s1)
      (uses_slot ?s1)
      (uses_slot ?s2)
    )
  )
)