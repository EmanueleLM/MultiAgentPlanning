(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    position agent box
  )

  (:predicates
    (adjacent ?from - position ?to - position)
    (at_player ?a - agent ?p - position)
    (at_box ?b - box ?p - position)
    (goal_pos ?p - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?player_pos - position ?box_pos - position ?dest - position)
    :precondition (and
      (at_player ?a ?player_pos)
      (at_box ?b ?box_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?dest)
      (not (at_box ?b ?dest))
    )
    :effect (and
      (not (at_player ?a ?player_pos))
      (at_player ?a ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?dest)
    )
  )
)