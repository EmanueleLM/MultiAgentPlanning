(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (chosen_start ?s - slot)
    (chosen_second ?s - slot)
    (start_selected)
    (second_selected)
    (meeting_scheduled)
  )

  (:action choose_start
    :parameters (?s - slot)
    :precondition (and
      (not (start_selected))
      (free billy ?s)
      (free maria ?s)
      (free william ?s)
    )
    :effect (and
      (chosen_start ?s)
      (start_selected)
    )
  )

  (:action choose_second
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (start_selected)
      (not (second_selected))
      (chosen_start ?s1)
      (next_slot ?s1 ?s2)
      (free billy ?s2)
      (free maria ?s2)
      (free william ?s2)
    )
    :effect (and
      (chosen_second ?s2)
      (second_selected)
      (meeting_scheduled)
    )
  )
)