(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
    (meeting_start ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?start - slot ?end - slot)
    :precondition (and
      (not (scheduled))
      (next_slot ?start ?end)
      (free theresa ?start)
      (free theresa ?end)
      (free charles ?start)
      (free charles ?end)
      (free betty ?start)
      (free betty ?end)
    )
    :effect (and
      (scheduled)
      (meeting_start ?start)
    )
  )
)