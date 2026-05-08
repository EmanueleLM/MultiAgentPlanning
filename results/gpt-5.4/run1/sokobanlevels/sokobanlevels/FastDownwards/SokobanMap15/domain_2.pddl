(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player
    box
    position
  )

  (:predicates
    (adjacent ?from - position ?to - position)
    (at_player ?p - player ?c - position)
    (at_box ?b - box ?c - position)
  )

  (:action move
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (not (at_box b1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?src - position ?box_from - position ?box_to - position)
    :precondition (and
      (at_player ?p ?src)
      (at_box ?b ?box_from)
      (adjacent ?src ?box_from)
      (adjacent ?box_from ?box_to)
      (not (at_box b1 ?box_to))
      (not (at_player ?p ?box_to))
    )
    :effect (and
      (not (at_player ?p ?src))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)