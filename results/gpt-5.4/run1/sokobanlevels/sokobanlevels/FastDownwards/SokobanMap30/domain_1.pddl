(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    position
  )

  (:predicates
    (at_player ?a - agent ?p - position)
    (at_box ?b - box ?p - position)
    (adjacent ?from - position ?to - position)
    (goal_pos ?p - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?player_from - position ?box_from - position ?box_to - position)
    :precondition (and
      (at_player ?a ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (at_box box_1 ?box_to))
    )
    :effect (and
      (not (at_player ?a ?player_from))
      (at_player ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)