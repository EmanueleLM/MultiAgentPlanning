(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    player
    box
    goal
    location
    direction
  )
  (:predicates
    (player_at ?l - location)
    (box_at ?l - location)
    (goal_at ?l - location)
    (wall_at ?l - location)
    (connected ?l1 ?l2 - location ?d - direction)
  )

  (:action move_player_up
    :parameters (?from ?to - location)
    :precondition (and
      (player_at ?from)
      (connected ?from ?to up)
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
      (connected ?from ?to down)
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
      (connected ?from ?to left)
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
      (connected ?from ?to right)
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
      (connected ?player_from ?box_from up) ; Player is immediately below the box
      (connected ?box_from ?box_to up)      ; Box can move upwards to an empty spot
      (not (wall_at ?box_to))
      (not (box_at ?box_to)) ; Target must not be occupied by another box (always true for a single box)
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
      (connected ?player_from ?box_from down) ; Player is immediately above the box
      (connected ?box_from ?box_to down)      ; Box can move downwards to an empty spot
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
      (connected ?player_from ?box_from left) ; Player is immediately to the right of the box
      (connected ?box_from ?box_to left)       ; Box can move leftwards to an empty spot
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
      (connected ?player_from ?box_from right) ; Player is immediately to the left of the box
      (connected ?box_from ?box_to right)      ; Box can move rightwards to an empty spot
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