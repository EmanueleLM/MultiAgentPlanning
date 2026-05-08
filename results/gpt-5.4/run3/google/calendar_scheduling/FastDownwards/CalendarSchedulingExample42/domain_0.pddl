(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (valid_start ?s - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (meeting_scheduled))
        (valid_start ?s1)
        (next_slot ?s1 ?s2)
        (free julie ?s1)
        (free julie ?s2)
        (free sean ?s1)
        (free sean ?s2)
        (free lori ?s1)
        (free lori ?s2)
      )
    :effect
      (and
        (meeting_scheduled)
        (meeting_start ?s1)
      )
  )
)