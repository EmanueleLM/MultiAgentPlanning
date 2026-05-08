(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (next ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at ?a ?from)
      (next ?from ?to)
      (not (box_at box1 ?to))
      (not (at ?a ?to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?from - position ?boxpos - position ?into - position)
    :precondition (and
      (at ?a ?from)
      (box_at ?b ?boxpos)
      (next ?from ?boxpos)
      (next ?boxpos ?into)
      (not (box_at ?b ?into))
      (not (at ?a ?into))
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?into)
      (not (at ?a ?from))
      (at ?a ?boxpos)
    )
  )
)