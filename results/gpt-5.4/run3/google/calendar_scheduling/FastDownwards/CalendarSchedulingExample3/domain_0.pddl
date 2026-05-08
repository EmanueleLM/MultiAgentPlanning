(define (domain monday_meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (chosen_start ?s - slot)
    (uses ?s - slot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (scheduled))
      (next_slot ?s1 ?s2)
      (free arthur ?s1)
      (free arthur ?s2)
      (free michael ?s1)
      (free michael ?s2)
      (free samantha ?s1)
      (free samantha ?s2)
    )
    :effect (and
      (scheduled)
      (chosen_start ?s1)
      (uses ?s1)
      (uses ?s2)
    )
  )
)