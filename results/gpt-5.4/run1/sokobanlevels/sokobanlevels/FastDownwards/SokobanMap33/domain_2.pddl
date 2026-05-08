(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player box location
  )

  (:predicates
    (adjacent ?from - location ?to - location)
    (goal_loc ?l - location)
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
  )

  (:action move
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)