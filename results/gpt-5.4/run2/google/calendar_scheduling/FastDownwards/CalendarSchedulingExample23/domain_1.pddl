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
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (not (start_selected))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (chosen_start ?s)
      (start_selected)
    )
  )

  (:action choose_second
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s1 - slot ?s2 - slot)
    :precondition (and
      (start_selected)
      (not (second_selected))
      (chosen_start ?s1)
      (next_slot ?s1 ?s2)
      (free ?p1 ?s2)
      (free ?p2 ?s2)
      (free ?p3 ?s2)
    )
    :effect (and
      (chosen_second ?s2)
      (second_selected)
      (meeting_scheduled)
    )
  )
)