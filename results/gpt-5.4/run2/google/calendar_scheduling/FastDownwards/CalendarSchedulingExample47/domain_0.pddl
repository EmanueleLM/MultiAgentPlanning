(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
    (chosen_start ?s - slot)
  )

  (:action schedule_meeting_at_pair
    :parameters (?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (meeting_scheduled))
        (next_slot ?s1 ?s2)
        (free david ?s1)
        (free david ?s2)
        (free eric ?s1)
        (free eric ?s2)
        (free roger ?s1)
        (free roger ?s2)
      )
    :effect
      (and
        (meeting_scheduled)
        (chosen_start ?s1)
      )
  )
)