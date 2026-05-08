(define (domain sokoban_single_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    loc
    player
    box
  )

  (:predicates
    (adjacent ?from - loc ?to - loc)
    (goal_cell ?l - loc)
    (at_player ?p - player ?l - loc)
    (at_box ?b - box ?l - loc)
    (empty ?l - loc)
  )

  (:action move
    :parameters (?p - player ?from - loc ?to - loc)
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
    :parameters (?p - player ?b - box ?player_from - loc ?box_from - loc ?box_to - loc)
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
      (not (empty ?box_from))
      (not (empty ?box_to))
    )
  )
)