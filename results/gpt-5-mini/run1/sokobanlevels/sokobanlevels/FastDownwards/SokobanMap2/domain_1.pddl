(define (domain sokoban_map2)
  (:requirements :strips :typing)
  (:types agent box position)
  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (free ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at ?a ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?a_pos - position ?box_pos - position ?into - position)
    :precondition (and
      (at ?a ?a_pos)
      (box_at ?b ?box_pos)
      (adjacent ?a_pos ?box_pos)
      (adjacent ?box_pos ?into)
      (free ?into)
    )
    :effect (and
      (not (box_at ?b ?box_pos))
      (box_at ?b ?into)
      (not (at ?a ?a_pos))
      (at ?a ?box_pos)
      (free ?a_pos)
      (not (free ?box_pos))
      (not (free ?into))
    )
  )
)