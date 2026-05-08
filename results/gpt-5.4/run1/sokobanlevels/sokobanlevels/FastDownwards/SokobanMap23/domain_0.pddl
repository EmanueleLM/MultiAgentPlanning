(define (domain sokoban_single_column_instance)
  (:requirements :strips :typing)
  (:types
    cell
    box
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (at_player ?c - cell)
    (at_box ?b - box ?c - cell)
    (clear ?c - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (clear ?player_from)
      (not (clear ?box_to))
    )
  )
)