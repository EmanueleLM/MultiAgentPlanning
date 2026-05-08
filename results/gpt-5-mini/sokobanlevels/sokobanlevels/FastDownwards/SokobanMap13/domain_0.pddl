(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types player box position)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (free ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and (at_player ?from) (adjacent ?from ?to) (free ?to))
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push
    :parameters (?p - position ?boxpos - position ?target - position)
    :precondition (and
      (at_player ?p)
      (adjacent ?p ?boxpos)
      (at_box box1 ?boxpos)
      (adjacent ?boxpos ?target)
      (free ?target)
    )
    :effect (and
      (not (at_box box1 ?boxpos))
      (at_box box1 ?target)
      (not (at_player ?p))
      (at_player ?boxpos)
      (not (free ?target))
      (not (free ?boxpos))
      (free ?p)
    )
  )
)