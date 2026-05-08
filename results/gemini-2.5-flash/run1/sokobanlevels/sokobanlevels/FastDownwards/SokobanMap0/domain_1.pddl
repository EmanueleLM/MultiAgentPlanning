(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    player
    box
    goal
    location
  )
  (:predicates
    (player_at ?l - location)
    (box_at ?l - location)
    (goal_at ?l - location)
    (wall_at ?l - location)
    (connected_up ?l1 ?l2 - location)
    (connected_down ?l1 ?l2 - location)
    (connected_left ?l1 ?l2 - location)
    (connected_right ?l1 ?l2 - location)
  )

  (:action move_player_up
    :parameters (?from ?to - location)
    :precondition (and
      (player_at ?from)
      (connected_up ?from ?to)
      (not (wall_at ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_player_down
    :parameters (?from ?to - location)
    :precondition (and
      (player_at ?from)
      (connected_down ?from ?to)
      (not (wall_at ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_player_left
    :parameters (?from ?to - location)
    :precondition (and
      (player_at ?from)
      (connected_left ?from ?to)
      (not (wall_at ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_player_right
    :parameters (?from ?to - location)
    :precondition (and
      (player_at ?from)
      (connected_right ?from ?to)
      (not (wall_at ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_box_up
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (connected_up ?player_from ?box_from) ; Player is immediately below the box
      (connected_up ?box_from ?box_to)      ; Box can move upwards to an empty spot
      (not (wall_at ?box_to))
      (not (box_at ?box_to)) ; Target must not be occupied by another box
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from) ; Player moves to the box's previous location
      (not (box_at ?box_from))
      (box_at ?box_to)
    )
  )

  (:action push_box_down
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (connected_down ?player_from ?box_from) ; Player is immediately above the box
      (connected_down ?box_from ?box_to)      ; Box can move downwards to an empty spot
      (not (wall_at ?box_to))
      (not (box_at ?box_to))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at ?box_from))
      (box_at ?box_to)
    )
  )

  (:action push_box_left
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (connected_left ?player_from ?box_from) ; Player is immediately to the right of the box
      (connected_left ?box_from ?box_to)       ; Box can move leftwards to an empty spot
      (not (wall_at ?box_to))
      (not (box_at ?box_to))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at ?box_from))
      (box_at ?box_to)
    )
  )

  (:action push_box_right
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (connected_right ?player_from ?box_from) ; Player is immediately to the left of the box
      (connected_right ?box_from ?box_to)      ; Box can move rightwards to an empty spot
      (not (wall_at ?box_to))
      (not (box_at ?box_to))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at ?box_from))
      (box_at ?box_to)
    )
  )
)