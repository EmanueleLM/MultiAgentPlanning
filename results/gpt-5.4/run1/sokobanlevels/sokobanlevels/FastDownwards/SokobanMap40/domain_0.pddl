(define (domain sokoban_single_box_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player box cell
  )

  (:predicates
    (at_player ?p - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (clear ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (clear ?box_from)
      (not (clear ?box_to))
    )
  )
)