(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box pos)
  (:predicates
    (at ?a - agent ?p - pos)
    (box_at ?b - box ?p - pos)
    (adj ?p1 - pos ?p2 - pos)
    (occupied ?p - pos)
    (goal ?p - pos)
  )

  (:action move
    :parameters (?ag - agent ?from - pos ?to - pos)
    :precondition (and (at ?ag ?from) (adj ?from ?to) (not (occupied ?to)))
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
      (not (occupied ?from))
      (occupied ?to)
    )
  )

  (:action push
    :parameters (?ag - agent ?b - box ?from - pos ?boxpos - pos ?to - pos)
    :precondition (and
      (at ?ag ?from)
      (box_at ?b ?boxpos)
      (adj ?from ?boxpos)
      (adj ?boxpos ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?boxpos)
      (not (box_at ?b ?boxpos))
      (box_at ?b ?to)
      (not (occupied ?from))
      (occupied ?boxpos)
      (occupied ?to)
    )
  )
)