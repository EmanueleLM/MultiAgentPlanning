(define (domain sokoban_vertical_corridor_96)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    cell
    box
  )

  (:predicates
    (adj_up ?from - cell ?to - cell)
    (adj_down ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal_cell ?c - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell ?b - box)
    :precondition (and
      (player_at ?from)
      (adj_up ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell ?b - box)
    :precondition (and
      (player_at ?from)
      (adj_down ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_up
    :parameters (?player_cell - cell ?box_cell - cell ?target_cell - cell ?b - box)
    :precondition (and
      (player_at ?player_cell)
      (box_at ?b ?box_cell)
      (adj_up ?player_cell ?box_cell)
      (adj_up ?box_cell ?target_cell)
      (not (box_at ?b ?target_cell))
    )
    :effect (and
      (not (player_at ?player_cell))
      (player_at ?box_cell)
      (not (box_at ?b ?box_cell))
      (box_at ?b ?target_cell)
    )
  )

  (:action push_down
    :parameters (?player_cell - cell ?box_cell - cell ?target_cell - cell ?b - box)
    :precondition (and
      (player_at ?player_cell)
      (box_at ?b ?box_cell)
      (adj_down ?player_cell ?box_cell)
      (adj_down ?box_cell ?target_cell)
      (not (box_at ?b ?target_cell))
    )
    :effect (and
      (not (player_at ?player_cell))
      (player_at ?box_cell)
      (not (box_at ?b ?box_cell))
      (box_at ?b ?target_cell)
    )
  )
)