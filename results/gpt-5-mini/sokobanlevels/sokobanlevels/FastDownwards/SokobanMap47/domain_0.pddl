(define (domain jack_of_all_trades_sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (at_player ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (connected ?c1 - cell ?c2 - cell)
  )

  ;; move: player moves from one cell to an adjacent cell that is not occupied by any box
  (:action move
    :parameters (?from - cell ?to - cell ?b - box)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to)
      (not (at_box ?b ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  ;; push: player pushes a box from its cell into an adjacent empty cell;
  ;; player moves into the box's former cell
  (:action push
    :parameters (?player_from - cell ?box_pos - cell ?box_to - cell ?b - box)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_pos)
      (connected ?player_from ?box_pos)
      (connected ?box_pos ?box_to)
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?box_to)
    )
  )
)