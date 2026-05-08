(define (domain monday_meeting_schedule_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    bobby scott kimberly - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (chosen_start ?s - slot)
    (start_unset)
    (meeting_scheduled)
  )

  (:action choose_start
    :parameters (?s - slot)
    :precondition (and
      (start_unset)
      (not (meeting_scheduled))
    )
    :effect (and
      (chosen_start ?s)
      (not (start_unset))
    )
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (chosen_start ?s1)
      (next_slot ?s1 ?s2)
      (not (meeting_scheduled))
      (free bobby ?s1)
      (free bobby ?s2)
      (free scott ?s1)
      (free scott ?s2)
      (free kimberly ?s1)
      (free kimberly ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)