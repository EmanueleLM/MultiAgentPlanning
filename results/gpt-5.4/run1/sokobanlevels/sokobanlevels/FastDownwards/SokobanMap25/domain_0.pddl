(define (domain sokoban_vertical_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    box
    location
  )

  (:predicates
    (at_player ?a - agent ?l - location)
    (at_box ?b - box ?l - location)
    (goal_cell ?l - location)
    (adj_up ?from - location ?to - location)
    (adj_down ?from - location ?to - location)
  )

  (:action move_up
    :parameters (?a - agent ?from - location ?to - location ?b - box)
    :precondition (and
      (at_player ?a ?from)
      (adj_up ?from ?to)
      (not (at_box ?b ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - location ?to - location ?b - box)
    :precondition (and
      (at_player ?a ?from)
      (adj_down ?from ?to)
      (not (at_box ?b ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?a ?player_from)
      (at_box ?b ?box_from)
      (adj_up ?player_from ?box_from)
      (adj_up ?box_from ?box_to)
      (not (at_player ?a ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?a ?player_from))
      (at_player ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?a ?player_from)
      (at_box ?b ?box_from)
      (adj_down ?player_from ?box_from)
      (adj_down ?box_from ?box_to)
      (not (at_player ?a ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?a ?player_from))
      (at_player ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)