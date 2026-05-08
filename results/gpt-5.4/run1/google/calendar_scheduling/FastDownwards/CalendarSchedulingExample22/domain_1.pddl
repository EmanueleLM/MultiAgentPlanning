(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    theresa charles betty - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (selected_first ?s - slot)
    (selected_second ?s - slot)
    (meeting_scheduled)
    (no_slot_chosen)
  )

  (:action choose_first_slot
    :parameters (?s - slot)
    :precondition (and
      (no_slot_chosen)
      (free theresa ?s)
      (free charles ?s)
      (free betty ?s)
    )
    :effect (and
      (selected_first ?s)
      (not (no_slot_chosen))
    )
  )

  (:action choose_second_slot
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (selected_first ?s1)
      (next_slot ?s1 ?s2)
      (free theresa ?s2)
      (free charles ?s2)
      (free betty ?s2)
      (not (selected_second ?s2))
    )
    :effect (and
      (selected_second ?s2)
    )
  )

  (:action finalize_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (selected_first ?s1)
      (selected_second ?s2)
      (next_slot ?s1 ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)