(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    anthony pamela zachary - participant
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (selected ?s - slot)
    (started)
    (start_slot ?s - slot)
  )

  (:action choose_first_slot
    :parameters (?s - slot)
    :precondition (and
      (not (started))
      (free anthony ?s)
      (free pamela ?s)
      (free zachary ?s)
    )
    :effect (and
      (started)
      (selected ?s)
      (start_slot ?s)
    )
  )

  (:action choose_second_slot
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (started)
      (start_slot ?s1)
      (selected ?s1)
      (next_slot ?s1 ?s2)
      (not (selected ?s2))
      (free anthony ?s2)
      (free pamela ?s2)
      (free zachary ?s2)
    )
    :effect (and
      (selected ?s2)
    )
  )
)