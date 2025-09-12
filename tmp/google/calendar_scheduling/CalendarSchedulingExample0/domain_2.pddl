(define (domain combined-scheduling)
  (:requirements :strips :typing)

  (:types time_slot)

  (:predicates 
    (free-agent1 ?time - time_slot)
    (free-agent2 ?time - time_slot)
    (free-agent3 ?time - time_slot)
    (meeting-scheduled)
  )

  (:action check-slot
    :parameters (?time - time_slot)
    :precondition (and (free-agent1 ?time) (free-agent2 ?time) (free-agent3 ?time))
    :effect (meeting-scheduled)
  )
)