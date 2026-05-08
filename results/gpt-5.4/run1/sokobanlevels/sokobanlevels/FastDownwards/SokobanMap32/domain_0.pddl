(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing)
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
    (clear ?c - cell)
  )

  (:action move
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?p_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_player ?a ?p_from)
      (at_box ?b ?box_from)
      (adjacent ?p_from ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (at_player ?a ?p_from))
      (at_player ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (clear ?p_from)
      (not (clear ?box_to))
    )
  )
)