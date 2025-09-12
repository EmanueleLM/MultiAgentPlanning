(define (domain combined-scheduling)
  (:requirements :strips :typing)

  (:types time_slot)

  (:predicates 
    (free-michelle ?time - time_slot)
    (free-steven ?time - time_slot)
    (free-jerry ?time - time_slot)
    (meeting-scheduled)
  )

  (:action check-slot
    :parameters (?time - time_slot)
    :precondition (and (free-michelle ?time) (free-steven ?time) (free-jerry ?time))
    :effect (meeting-scheduled)
  )
)