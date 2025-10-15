(define (domain orchestrated-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?s - slot)
    (unavailable ?s - slot)
    (booked ?s - agent)
    (earliest-for ?a - agent ?s - slot)
  )

  ;; Agent 1 actions (kept distinct)
  (:action agent1-book
    :parameters (?s - slot)
    :precondition (and (free ?s) (earliest-for agent1 ?s))
    :effect (and (booked ?s agent1) (not (free ?s)))
  )

  ;; Agent 2 actions (kept distinct)
  (:action agent2-book
    :parameters (?s - slot)
    :precondition (and (free ?s) (earliest-for agent2 ?s))
    :effect (and (booked ?s agent2) (not (free ?s)))
  )
)