(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing)
  (:types
    agent box cell
  )

  (:predicates
    (adjacent_up ?from - cell ?to - cell)
    (adjacent_down ?from - cell ?to - cell)
    (player_at ?a - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (clear ?c - cell)
    (goal_cell ?c - cell)
  )

  (:action move_up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (player_at ?a ?from)
      (adjacent_up ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?to)
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (player_at ?a ?from)
      (adjacent_down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?to)
    )
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?player_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (player_at ?a ?player_cell)
      (box_at ?b ?box_cell)
      (adjacent_up ?player_cell ?box_cell)
      (adjacent_up ?box_cell ?dest_cell)
      (clear ?dest_cell)
    )
    :effect (and
      (not (player_at ?a ?player_cell))
      (player_at ?a ?box_cell)
      (not (box_at ?b ?box_cell))
      (box_at ?b ?dest_cell)
      (clear ?box_cell)
      (not (clear ?dest_cell))
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?player_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (player_at ?a ?player_cell)
      (box_at ?b ?box_cell)
      (adjacent_down ?player_cell ?box_cell)
      (adjacent_down ?box_cell ?dest_cell)
      (clear ?dest_cell)
    )
    :effect (and
      (not (player_at ?a ?player_cell))
      (player_at ?a ?box_cell)
      (not (box_at ?b ?box_cell))
      (box_at ?b ?dest_cell)
      (clear ?box_cell)
      (not (clear ?dest_cell))
    )
  )
)