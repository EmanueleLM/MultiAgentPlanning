(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    cell
  )

  (:predicates
    (adjacent_up ?from - cell ?to - cell)
    (adjacent_down ?from - cell ?to - cell)
    (goal_cell ?c - cell)
    (at_player ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (clear ?c - cell)
  )

  (:action move_up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?a ?from)
      (adjacent_up ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?a ?from)
      (adjacent_down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?player_cell - cell ?box_cell - cell ?dest - cell)
    :precondition (and
      (at_player ?a ?player_cell)
      (at_box ?b ?box_cell)
      (adjacent_up ?player_cell ?box_cell)
      (adjacent_up ?box_cell ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?a ?player_cell))
      (at_player ?a ?box_cell)
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest)
      (clear ?player_cell)
      (not (clear ?dest))
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?player_cell - cell ?box_cell - cell ?dest - cell)
    :precondition (and
      (at_player ?a ?player_cell)
      (at_box ?b ?box_cell)
      (adjacent_down ?player_cell ?box_cell)
      (adjacent_down ?box_cell ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?a ?player_cell))
      (at_player ?a ?box_cell)
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest)
      (clear ?player_cell)
      (not (clear ?dest))
    )
  )
)