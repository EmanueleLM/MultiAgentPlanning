(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types box position)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (free ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (free ?to))
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?p - position ?b - box ?boxpos - position ?target - position)
    :precondition (and
      (player_at ?p)
      (adjacent ?p ?boxpos)
      (box_at ?b ?boxpos)
      (adjacent ?boxpos ?target)
      (free ?target)
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?target)
      (not (player_at ?p))
      (player_at ?boxpos)
      (not (free ?target))
      (free ?boxpos)
    )
  )
)