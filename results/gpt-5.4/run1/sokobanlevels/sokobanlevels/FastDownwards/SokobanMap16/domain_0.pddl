(define (domain sokoban_single_box_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player
    box
    location
  )

  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent_up ?from - location ?to - location)
    (adjacent_down ?from - location ?to - location)
    (goal_loc ?l - location)
    (occupied ?l - location)
  )

  (:action move_up
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent_up ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (not (occupied ?from))
      (occupied ?to)
    )
  )

  (:action move_down
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adjacent_down ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (not (occupied ?from))
      (occupied ?to)
    )
  )

  (:action push_up
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent_up ?player_from ?box_from)
      (adjacent_up ?box_from ?box_to)
      (not (occupied ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (not (occupied ?player_from))
      (occupied ?box_from)
      (occupied ?box_to)
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent_down ?player_from ?box_from)
      (adjacent_down ?box_from ?box_to)
      (not (occupied ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (not (occupied ?player_from))
      (occupied ?box_from)
      (occupied ?box_to)
    )
  )
)