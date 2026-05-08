(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    michelle steven jerry - participant
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (chosen_start ?s - slot)
    (chosen_second ?s - slot)
    (start_selected)
    (second_selected)
    (scheduled)
  )

  (:action choose_start
    :parameters (?s - slot)
    :precondition (and
      (not (start_selected))
      (free michelle ?s)
      (free steven ?s)
      (free jerry ?s)
    )
    :effect (and
      (chosen_start ?s)
      (start_selected)
    )
  )

  (:action choose_second
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (chosen_start ?s1)
      (next_slot ?s1 ?s2)
      (not (second_selected))
      (free michelle ?s2)
      (free steven ?s2)
      (free jerry ?s2)
    )
    :effect (and
      (chosen_second ?s2)
      (second_selected)
    )
  )

  (:action finalize_schedule
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (chosen_start ?s1)
      (chosen_second ?s2)
      (next_slot ?s1 ?s2)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
    )
  )
)