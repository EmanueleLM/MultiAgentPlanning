(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (empty ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push
    :parameters (?p - position ?bpos - position ?t - position ?b - box)
    :precondition (and
      (player_at ?p)
      (adjacent ?p ?bpos)
      (box_at ?b ?bpos)
      (adjacent ?bpos ?t)
      (empty ?t)
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?bpos)
      (not (box_at ?b ?bpos))
      (box_at ?b ?t)
      (not (empty ?t))
      (not (empty ?bpos))
      (empty ?p)
    )
  )
)