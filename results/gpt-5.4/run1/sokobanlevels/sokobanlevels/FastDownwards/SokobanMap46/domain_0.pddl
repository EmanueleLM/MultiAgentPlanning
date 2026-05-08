(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing)
  (:types
    cell player box
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (at_player ?p - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (empty ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (empty ?box_to)
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (empty ?player_from)
      (not (empty ?box_to))
    )
  )
)