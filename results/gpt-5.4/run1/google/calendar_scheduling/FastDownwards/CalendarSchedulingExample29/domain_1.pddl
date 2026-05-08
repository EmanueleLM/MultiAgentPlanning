(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    madison diana shirley - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (selected_start ?s - slot)
    (selected_second ?s - slot)
    (meeting_scheduled)
    (start_chosen)
  )

  (:action choose_start_slot
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (start_chosen))
      (free madison ?s)
      (free diana ?s)
      (free shirley ?s)
    )
    :effect (and
      (selected_start ?s)
      (start_chosen)
    )
  )

  (:action choose_consecutive_second_slot
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (selected_start ?s1)
      (next_slot ?s1 ?s2)
      (not (meeting_scheduled))
      (free madison ?s2)
      (free diana ?s2)
      (free shirley ?s2)
    )
    :effect (and
      (selected_second ?s2)
      (meeting_scheduled)
    )
  )
)