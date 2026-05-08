(define (domain sokoban_vertical)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)

  (:predicates
    (at ?a - agent ?p - position)
    (box-at ?b - box ?p - position)
    (goal ?p - position)
    (free ?p - position)
    (north ?p1 - position ?p2 - position)
    (south ?p1 - position ?p2 - position)
  )

  (:action move_north
    :parameters (?ag - agent ?from - position ?to - position)
    :precondition (and
      (at ?ag ?from)
      (north ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move_south
    :parameters (?ag - agent ?from - position ?to - position)
    :precondition (and
      (at ?ag ?from)
      (south ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push_north
    :parameters (?ag - agent ?b - box ?agt - position ?boxpos - position ?dest - position)
    :precondition (and
      (at ?ag ?agt)
      (box-at ?b ?boxpos)
      (north ?agt ?boxpos)
      (north ?boxpos ?dest)
      (free ?dest)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?dest)
      (not (at ?ag ?agt))
      (at ?ag ?boxpos)
      (free ?agt)
      (not (free ?dest))
      (not (free ?boxpos))
    )
  )

  (:action push_south
    :parameters (?ag - agent ?b - box ?agt - position ?boxpos - position ?dest - position)
    :precondition (and
      (at ?ag ?agt)
      (box-at ?b ?boxpos)
      (south ?agt ?boxpos)
      (south ?boxpos ?dest)
      (free ?dest)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?dest)
      (not (at ?ag ?agt))
      (at ?ag ?boxpos)
      (free ?agt)
      (not (free ?dest))
      (not (free ?boxpos))
    )
  )
)