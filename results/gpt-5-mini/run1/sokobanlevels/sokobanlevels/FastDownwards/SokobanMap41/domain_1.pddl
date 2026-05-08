(define (domain sokoban_jackofalltrades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)

  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?ag - agent ?b - box ?from - position ?to - position)
    :precondition (and
      (at ?ag ?from)
      (adjacent ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  (:action push
    :parameters (?ag - agent ?b - box ?from - position ?boxpos - position ?topos - position)
    :precondition (and
      (at ?ag ?from)
      (box_at ?b ?boxpos)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?topos)
      (not (box_at ?b ?topos))
      (not (at ?ag ?topos))
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?topos)
      (not (at ?ag ?from))
      (at ?ag ?boxpos)
    )
  )
)