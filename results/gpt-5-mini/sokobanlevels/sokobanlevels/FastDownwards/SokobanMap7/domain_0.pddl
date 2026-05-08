(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (agent_at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (goal ?p - position)
  )

  (:action move_up
    :parameters (?a - agent ?from - position ?to - position ?b - box)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?to ?from)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (agent_at ?a ?from))
      (agent_at ?a ?to)
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - position ?to - position ?b - box)
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

  (:action push_up
    :parameters (?a - agent ?from - position ?boxpos - position ?dest - position ?b - box)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?dest)
      (box_at ?b ?boxpos)
      (not (box_at ?b ?dest))
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?dest)
      (not (agent_at ?a ?from))
      (agent_at ?a ?boxpos)
    )
  )

  (:action push_down
    :parameters (?a - agent ?from - position ?boxpos - position ?dest - position ?b - box)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?boxpos ?from)
      (adjacent ?dest ?boxpos)
      (box_at ?b ?boxpos)
      (not (box_at ?b ?dest))
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?dest)
      (not (agent_at ?a ?from))
      (agent_at ?a ?boxpos)
    )
  )
)