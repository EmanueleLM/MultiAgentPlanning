(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  (:action select_slot
    :parameters (?s - slot)
    :precondition (and
      (available anthony ?s)
      (available pamela ?s)
      (available zachary ?s)
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)