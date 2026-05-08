(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    ryan ruth denise - participant
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (allowed_start ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?start - slot ?end - slot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?start ?end)
      (allowed_start ?start)
      (free ryan ?start)
      (free ryan ?end)
      (free ruth ?start)
      (free ruth ?end)
      (free denise ?start)
      (free denise ?end)
    )
    :effect (and
      (scheduled_at ?start)
      (meeting_scheduled)
    )
  )
)