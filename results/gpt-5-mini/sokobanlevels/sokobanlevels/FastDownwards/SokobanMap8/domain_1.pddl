(define (domain sokoban_vertical)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell box player)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (above ?higher - cell ?lower - cell)
    (goal_cell ?c - cell)
    (free ?c - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (above ?to ?from)
      (free ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (above ?from ?to)
      (free ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
    )
  )

  (:action push_up
    :parameters (?p_from - cell ?box_from - cell ?box_to - cell ?b - box)
    :precondition (and
      (player_at ?p_from)
      (adjacent ?p_from ?box_from)
      (adjacent ?box_from ?box_to)
      (above ?box_to ?box_from)
      (above ?box_from ?p_from)
      (box_at ?b ?box_from)
      (free ?box_to)
    )
    :effect (and
      (player_at ?box_from)
      (not (player_at ?p_from))
      (box_at ?b ?box_to)
      (not (box_at ?b ?box_from))
      (free ?box_from)
      (not (free ?box_to))
    )
  )

  (:action push_down
    :parameters (?p_from - cell ?box_from - cell ?box_to - cell ?b - box)
    :precondition (and
      (player_at ?p_from)
      (adjacent ?p_from ?box_from)
      (adjacent ?box_from ?box_to)
      (above ?box_from ?box_to)
      (above ?p_from ?box_from)
      (box_at ?b ?box_from)
      (free ?box_to)
    )
    :effect (and
      (player_at ?box_from)
      (not (player_at ?p_from))
      (box_at ?b ?box_to)
      (not (box_at ?b ?box_from))
      (free ?box_from)
      (not (free ?box_to))
    )
  )
)