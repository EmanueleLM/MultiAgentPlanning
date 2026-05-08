(define (domain sokoban_corridor_single_box)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    location
  )

  (:predicates
    (adjacent ?from - location ?to - location)
    (goal_loc ?l - location)
    (at_player ?a - agent ?l - location)
    (at_box ?b - box ?l - location)
  )

  (:action move
    :parameters (?a - agent ?from - location ?to - location ?b - box)
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
    :parameters (?a - agent ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest)
      (not (at_box ?b ?dest))
      (not (at_player ?a ?dest))
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
    )
  )
)