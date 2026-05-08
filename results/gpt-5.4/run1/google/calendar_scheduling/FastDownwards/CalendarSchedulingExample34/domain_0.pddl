(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (selected_start ?s - slot)
    (selected_second ?s - slot)
    (meeting_scheduled)
    (start_chosen)
    (second_chosen)
  )

  (:action choose_start
    :parameters (?s - slot)
    :precondition (and
      (not (start_chosen))
      (free willie ?s)
      (free richard ?s)
      (free noah ?s)
    )
    :effect (and
      (selected_start ?s)
      (start_chosen)
    )
  )

  (:action choose_second
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (selected_start ?s1)
      (next_slot ?s1 ?s2)
      (not (second_chosen))
      (free willie ?s2)
      (free richard ?s2)
      (free noah ?s2)
    )
    :effect (and
      (selected_second ?s2)
      (second_chosen)
      (meeting_scheduled)
    )
  )
)