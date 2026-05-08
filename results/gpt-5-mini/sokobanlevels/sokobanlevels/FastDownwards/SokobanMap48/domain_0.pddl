(define (domain jack_of_all_trades_sokoban)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell box player goal_marker)
  (:predicates
    (adj ?c1 - cell ?c2 - cell)
    (at_player ?p - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (is_goal ?g - goal_marker ?c - cell)
    (cell_free ?c - cell)
  )

  (:action move-right
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adj ?from ?to)
      (cell_free ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move-left
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adj ?to ?from)
      (cell_free ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push-right
    :parameters (?p - player ?b - box ?player_cell - cell ?box_cell - cell ?box_dest - cell)
    :precondition (and
      (at_player ?p ?player_cell)
      (at_box ?b ?box_cell)
      (adj ?player_cell ?box_cell)
      (adj ?box_cell ?box_dest)
      (cell_free ?box_dest)
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?box_dest)
      (not (at_player ?p ?player_cell))
      (at_player ?p ?box_cell)
      (cell_free ?box_cell)
      (not (cell_free ?box_dest))
    )
  )

  (:action push-left
    :parameters (?p - player ?b - box ?player_cell - cell ?box_cell - cell ?box_dest - cell)
    :precondition (and
      (at_player ?p ?player_cell)
      (at_box ?b ?box_cell)
      (adj ?box_cell ?player_cell)
      (adj ?box_dest ?box_cell)
      (cell_free ?box_dest)
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?box_dest)
      (not (at_player ?p ?player_cell))
      (at_player ?p ?box_cell)
      (cell_free ?box_cell)
      (not (cell_free ?box_dest))
    )
  )
)