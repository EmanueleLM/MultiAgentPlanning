(define (domain schedule_meeting_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    willie richard noah - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
    (meeting_slot ?s - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (scheduled))
      (next_slot ?s1 ?s2)
      (free willie ?s1)
      (free willie ?s2)
      (free richard ?s1)
      (free richard ?s2)
      (free noah ?s1)
      (free noah ?s2)
    )
    :effect (and
      (scheduled)
      (meeting_slot ?s1)
      (meeting_slot ?s2)
    )
  )
)