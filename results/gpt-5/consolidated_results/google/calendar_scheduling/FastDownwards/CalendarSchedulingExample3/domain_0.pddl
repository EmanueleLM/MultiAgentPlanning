(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants arthur michael samantha - person)
  (:predicates
    (available ?p - person ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )
  (:action choose_slot
    :parameters (?s - slot)
    :precondition (and
      (available arthur ?s)
      (available michael ?s)
      (available samantha ?s)
      (not (chosen ?s))
      (not (scheduled))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)