(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types cell movable agent)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - movable ?c - cell)
    (goal ?c - cell)
    (adjacent_up ?a - cell ?b - cell)
    (adjacent_down ?a - cell ?b - cell)
    (free ?c - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (adjacent_up ?from ?to) (free ?to))
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (adjacent_down ?from ?to) (free ?to))
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push_up
    :parameters (?player_from - cell ?box_from - cell ?box_to - cell ?b - movable)
    :precondition (and
      (player_at ?player_from)
      (adjacent_up ?player_from ?box_from)
      (box_at ?b ?box_from)
      (adjacent_up ?box_from ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (free ?box_to))
      (free ?player_from)
    )
  )

  (:action push_down
    :parameters (?player_from - cell ?box_from - cell ?box_to - cell ?b - movable)
    :precondition (and
      (player_at ?player_from)
      (adjacent_down ?player_from ?box_from)
      (box_at ?b ?box_from)
      (adjacent_down ?box_from ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (free ?box_to))
      (free ?player_from)
    )
  )
)