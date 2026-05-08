(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (agent_at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (occupied ?p - position)          ; true if a box occupies the position
    (adjacent ?p1 - position ?p2 - position)
    (goal ?p - position)
  )

  ;; simple move into an adjacent unoccupied cell
  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (agent_at ?a ?from))
      (agent_at ?a ?to)
    )
  )

  ;; push a box from boxpos to dest; agent moves into the box's former location
  (:action push
    :parameters (?a - agent ?from - position ?boxpos - position ?dest - position ?b - box)
    :precondition (and
      (agent_at ?a ?from)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?dest)
      (box_at ?b ?boxpos)
      (not (occupied ?dest))
    )
    :effect (and
      ;; box moves
      (not (box_at ?b ?boxpos))
      (box_at ?b ?dest)
      ;; occupancy updated
      (not (occupied ?boxpos))
      (occupied ?dest)
      ;; agent moves into the box's previous square
      (not (agent_at ?a ?from))
      (agent_at ?a ?boxpos)
    )
  )
)