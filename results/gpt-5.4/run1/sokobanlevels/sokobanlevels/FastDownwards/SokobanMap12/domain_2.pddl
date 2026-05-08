(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    location
  )

  (:predicates
    (adjacent ?from - location ?to - location)
    (at_player ?a - agent ?l - location)
    (at_box ?b - box ?l - location)
    (clear ?l - location)
  )

  (:action move_up
    :parameters (?a - agent ?from - location ?to - location)
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

  (:action move_down
    :parameters (?a - agent ?from - location ?to - location)
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

  (:action push_up
    :parameters (?a - agent ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest)
      (clear ?dest)
      (not (at_player ?a ?box_loc))
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent ?player_loc ?box_loc)
      (adjacent ?box_loc ?dest)
      (clear ?dest)
      (not (at_player ?a ?box_loc))
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
    )
  )
)