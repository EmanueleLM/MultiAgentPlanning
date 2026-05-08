(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing)
  (:types
    cell box
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (clear ?c - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?p - cell ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p)
      (box_at ?b ?from)
      (adjacent ?p ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?from)
      (not (box_at ?b ?from))
      (box_at ?b ?to)
      (clear ?p)
      (not (clear ?from))
      (not (clear ?to))
    )
  )
)