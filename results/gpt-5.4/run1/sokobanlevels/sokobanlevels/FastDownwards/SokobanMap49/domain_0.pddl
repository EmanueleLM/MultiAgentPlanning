(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    location
  )

  (:predicates
    (at_player ?a - agent ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent_left ?from - location ?to - location)
    (adjacent_right ?from - location ?to - location)
    (goal_loc ?l - location)
    (clear ?l - location)
  )

  (:action move_left
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?a ?from)
      (adjacent_left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_right
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_player ?a ?from)
      (adjacent_right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push_left
    :parameters (?a - agent ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent_left ?player_loc ?box_loc)
      (adjacent_left ?box_loc ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
      (not (clear ?box_loc))
    )
  )

  (:action push_right
    :parameters (?a - agent ?b - box ?player_loc - location ?box_loc - location ?dest - location)
    :precondition (and
      (at_player ?a ?player_loc)
      (at_box ?b ?box_loc)
      (adjacent_right ?player_loc ?box_loc)
      (adjacent_right ?box_loc ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (at_player ?a ?player_loc))
      (at_player ?a ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?dest)
      (clear ?player_loc)
      (not (clear ?dest))
      (not (clear ?box_loc))
    )
  )
)