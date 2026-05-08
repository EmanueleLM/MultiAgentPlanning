(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    billy maria william - participant
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting_start ?s - slot)
    (meeting_uses ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (scheduled))
        (next_slot ?s1 ?s2)
        (free billy ?s1)
        (free billy ?s2)
        (free maria ?s1)
        (free maria ?s2)
        (free william ?s1)
        (free william ?s2)
      )
    :effect
      (and
        (scheduled)
        (meeting_start ?s1)
        (meeting_uses ?s1)
        (meeting_uses ?s2)
      )
  )
)