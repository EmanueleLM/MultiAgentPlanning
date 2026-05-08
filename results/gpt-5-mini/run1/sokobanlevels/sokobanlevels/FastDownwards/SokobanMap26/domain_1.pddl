(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent box cell)
  (:predicates
    (agent_at ?a - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?a - agent ?from - cell ?to - cell ?b - box)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (agent_at ?a ?from))
      (agent_at ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?agent_pos - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (agent_at ?a ?agent_pos)
      (box_at ?b ?box_from)
      (adjacent ?agent_pos ?box_from)
      (adjacent ?box_from ?box_to)
      (not (box_at ?b ?box_to))
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (agent_at ?a ?agent_pos))
      (agent_at ?a ?box_from)
    )
  )
)