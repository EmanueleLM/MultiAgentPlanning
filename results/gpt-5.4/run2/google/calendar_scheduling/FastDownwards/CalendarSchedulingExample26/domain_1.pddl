(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    katherine nicole kevin - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (selected_first ?s - slot)
    (selected_second ?s - slot)
    (meeting_scheduled)
    (no_slot_selected_yet)
  )

  (:action select_first_slot
    :parameters (?s - slot)
    :precondition (and
      (no_slot_selected_yet)
      (not (meeting_scheduled))
      (available katherine ?s)
      (available nicole ?s)
      (available kevin ?s)
    )
    :effect (and
      (selected_first ?s)
      (not (no_slot_selected_yet))
    )
  )

  (:action select_second_slot_and_finalize
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (selected_first ?s1)
      (not (meeting_scheduled))
      (next_slot ?s1 ?s2)
      (available katherine ?s2)
      (available nicole ?s2)
      (available kevin ?s2)
    )
    :effect (and
      (selected_second ?s2)
      (meeting_scheduled)
    )
  )
)