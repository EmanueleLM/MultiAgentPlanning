(define (domain sokoban_single_row_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    actor
    box
    location
  )

  (:predicates
    (at_player ?a - actor ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent ?from - location ?to - location)
    (goal_loc ?l - location)
  )

  (:action move
    :parameters (?a - actor ?from - location ?to - location ?b - box)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (not (at_box ?b ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push
    :parameters (?a - actor ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?a ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (at_box ?b ?box_to))
      (not (at_player ?a ?box_to))
    )
    :effect (and
      (not (at_player ?a ?player_from))
      (at_player ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)