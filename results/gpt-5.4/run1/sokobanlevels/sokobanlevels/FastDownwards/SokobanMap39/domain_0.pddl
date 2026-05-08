(define (domain sokoban_corridor_94)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    cell
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (goal_cell ?c - cell)
    (at_player ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (empty ?c - cell)
  )

  (:action move
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (empty ?from)
      (not (empty ?to))
      (at_player ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?player_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (at_player ?a ?player_cell)
      (at_box ?b ?box_cell)
      (adjacent ?player_cell ?box_cell)
      (adjacent ?box_cell ?dest_cell)
      (empty ?dest_cell)
    )
    :effect (and
      (not (at_player ?a ?player_cell))
      (empty ?player_cell)
      (not (at_box ?b ?box_cell))
      (at_player ?a ?box_cell)
      (not (empty ?dest_cell))
      (at_box ?b ?dest_cell)
    )
  )
)