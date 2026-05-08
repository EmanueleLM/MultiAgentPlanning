(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing)
  (:types cell player box)

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (at_player ?p - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (clear ?c - cell)
    (goal_cell ?c - cell)
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
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?player_cell - cell ?box_cell - cell ?dest - cell)
    :precondition (and
      (at_player ?p ?player_cell)
      (at_box ?b ?box_cell)
      (adjacent ?player_cell ?box_cell)
      (adjacent ?box_cell ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?p ?player_cell))
      (at_player ?p ?box_cell)
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest)
      (clear ?player_cell)
      (not (clear ?box_cell))
      (not (clear ?dest))
    )
  )
)