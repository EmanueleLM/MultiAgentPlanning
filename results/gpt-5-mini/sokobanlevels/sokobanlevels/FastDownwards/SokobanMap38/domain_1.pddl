(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)

  (:predicates
    (agent_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (agent_at ?from)
      (adjacent ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (agent_at ?from))
      (agent_at ?to)
    )
  )

  (:action push
    :parameters (?p_agent - position ?p_box - position ?p_dest - position)
    :precondition (and
      (agent_at ?p_agent)
      (adjacent ?p_agent ?p_box)
      (box_at ?p_box)
      (adjacent ?p_box ?p_dest)
      (not (box_at ?p_dest))
    )
    :effect (and
      (not (agent_at ?p_agent))
      (agent_at ?p_box)
      (not (box_at ?p_box))
      (box_at ?p_dest)
    )
  )
)