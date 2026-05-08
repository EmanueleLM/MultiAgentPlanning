(define (domain monday_meeting_schedule_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    stephen edward angela - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
    (meeting_end ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?s1 ?s2)
      (free stephen ?s1)
      (free stephen ?s2)
      (free edward ?s1)
      (free edward ?s2)
      (free angela ?s1)
      (free angela ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s1)
      (meeting_end ?s2)
    )
  )
)