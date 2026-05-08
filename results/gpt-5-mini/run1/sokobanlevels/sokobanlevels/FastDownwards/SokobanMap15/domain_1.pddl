(define (domain sokoban_vertical)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)

  (:predicates
    (at ?a - agent ?p - position)
    (box-at ?b - box ?p - position)
    (goal ?p - position)
    (succ ?p1 - position ?p2 - position)
  )

  (:action move_down
    :parameters (?ag - agent ?from - position ?to - position ?anybox - box)
    :precondition (and
      (at ?ag ?from)
      (succ ?from ?to)
      (not (box-at ?anybox ?to))
      (not (at ?ag ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  (:action move_up
    :parameters (?ag - agent ?to - position ?from - position ?anybox - box)
    :precondition (and
      (at ?ag ?from)
      (succ ?to ?from)
      (not (box-at ?anybox ?to))
      (not (at ?ag ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  (:action push_down
    :parameters (?ag - agent ?b - box ?agpos - position ?boxpos - position ?dest - position)
    :precondition (and
      (at ?ag ?agpos)
      (box-at ?b ?boxpos)
      (succ ?agpos ?boxpos)
      (succ ?boxpos ?dest)
      (not (box-at ?b ?dest))
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?dest)
      (not (at ?ag ?agpos))
      (at ?ag ?boxpos)
    )
  )

  (:action push_up
    :parameters (?ag - agent ?b - box ?agpos - position ?boxpos - position ?dest - position)
    :precondition (and
      (at ?ag ?agpos)
      (box-at ?b ?boxpos)
      (succ ?boxpos ?agpos)
      (succ ?dest ?boxpos)
      (not (box-at ?b ?dest))
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?dest)
      (not (at ?ag ?agpos))
      (at ?ag ?boxpos)
    )
  )
)