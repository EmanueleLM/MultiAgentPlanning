(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    cell box
  )

  (:predicates
    (adj_left ?from - cell ?to - cell)
    (adj_right ?from - cell ?to - cell)
    (goal_cell ?c - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
  )

  (:action move_left
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj_left ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_right
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj_right ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_left
    :parameters (?player_cell - cell ?box_cell - cell ?dest - cell)
    :precondition (and
      (player_at ?player_cell)
      (adj_left ?player_cell ?box_cell)
      (box_at b1 ?box_cell)
      (adj_left ?box_cell ?dest)
      (not (box_at b1 ?dest))
    )
    :effect (and
      (not (player_at ?player_cell))
      (player_at ?box_cell)
      (not (box_at b1 ?box_cell))
      (box_at b1 ?dest)
    )
  )

  (:action push_right
    :parameters (?player_cell - cell ?box_cell - cell ?dest - cell)
    :precondition (and
      (player_at ?player_cell)
      (adj_right ?player_cell ?box_cell)
      (box_at b1 ?box_cell)
      (adj_right ?box_cell ?dest)
      (not (box_at b1 ?dest))
    )
    :effect (and
      (not (player_at ?player_cell))
      (player_at ?box_cell)
      (not (box_at b1 ?box_cell))
      (box_at b1 ?dest)
    )
  )
)