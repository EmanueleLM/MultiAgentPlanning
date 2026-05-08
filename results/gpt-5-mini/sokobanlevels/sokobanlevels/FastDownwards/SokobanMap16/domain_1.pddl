(define (domain sokoban_vertical)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)
  (:constants box_b1 - box)
  (:predicates
    (agent_at ?ag - agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal_pos ?p - position)
    (north ?from - position ?to - position)
    (south ?from - position ?to - position)
  )

  (:action move-north
    :parameters (?ag - agent ?p_from - position ?p_to - position)
    :precondition (and
      (agent_at ?ag ?p_from)
      (north ?p_from ?p_to)
      (not (box_at box_b1 ?p_to))
    )
    :effect (and
      (not (agent_at ?ag ?p_from))
      (agent_at ?ag ?p_to)
    )
  )

  (:action move-south
    :parameters (?ag - agent ?p_from - position ?p_to - position)
    :precondition (and
      (agent_at ?ag ?p_from)
      (south ?p_from ?p_to)
      (not (box_at box_b1 ?p_to))
    )
    :effect (and
      (not (agent_at ?ag ?p_from))
      (agent_at ?ag ?p_to)
    )
  )

  (:action push-north
    :parameters (?ag - agent ?p_agent - position ?p_box - position ?p_dest - position)
    :precondition (and
      (agent_at ?ag ?p_agent)
      (north ?p_agent ?p_box)
      (north ?p_box ?p_dest)
      (box_at box_b1 ?p_box)
      (not (box_at box_b1 ?p_dest))
    )
    :effect (and
      (not (box_at box_b1 ?p_box))
      (box_at box_b1 ?p_dest)
      (not (agent_at ?ag ?p_agent))
      (agent_at ?ag ?p_box)
    )
  )

  (:action push-south
    :parameters (?ag - agent ?p_agent - position ?p_box - position ?p_dest - position)
    :precondition (and
      (agent_at ?ag ?p_agent)
      (south ?p_agent ?p_box)
      (south ?p_box ?p_dest)
      (box_at box_b1 ?p_box)
      (not (box_at box_b1 ?p_dest))
    )
    :effect (and
      (not (box_at box_b1 ?p_box))
      (box_at box_b1 ?p_dest)
      (not (agent_at ?ag ?p_agent))
      (agent_at ?ag ?p_box)
    )
  )
)