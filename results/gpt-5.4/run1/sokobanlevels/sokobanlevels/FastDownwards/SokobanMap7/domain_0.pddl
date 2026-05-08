(define (domain sokoban_single_box_vertical_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    actor
    box
    location
  )

  (:predicates
    (adjacent ?from - location ?to - location)
    (goal_loc ?l - location)
    (at_player ?a - actor ?l - location)
    (at_box ?b - box ?l - location)
    (clear ?l - location)
  )

  (:action move
    :parameters (?a - actor ?from - location ?to - location)
    :precondition (and
      (at_player ?a ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push
    :parameters (?a - actor ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?box_loc)
      (not (clear ?dest))
    )
  )
)