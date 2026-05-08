(define (domain sokobanmap42)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    direction
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (connected ?l1 ?l2 - location ?dir - direction)
  )

  ;; Player movement actions
  (:action move_player_left
    :parameters (?from - location ?to - location)
    :precondition
      (and
        (at_player ?from)
        (connected ?from ?to left)
        (not (is_wall ?to))
        (not (at_box ?to))
      )
    :effect
      (and
        (not (at_player ?from))
        (at_player ?to)
      )
  )

  (:action move_player_right
    :parameters (?from - location ?to - location)
    :precondition
      (and
        (at_player ?from)
        (connected ?from ?to right)
        (not (is_wall ?to))
        (not (at_box ?to))
      )
    :effect
      (and
        (not (at_player ?from))
        (at_player ?to)
      )
  )

  (:action move_player_up
    :parameters (?from - location ?to - location)
    :precondition
      (and
        (at_player ?from)
        (connected ?from ?to up)
        (not (is_wall ?to))
        (not (at_box ?to))
      )
    :effect
      (and
        (not (at_player ?from))
        (at_player ?to)
      )
  )

  (:action move_player_down
    :parameters (?from - location ?to - location)
    :precondition
      (and
        (at_player ?from)
        (connected ?from ?to down)
        (not (is_wall ?to))
        (not (at_box ?to))
      )
    :effect
      (and
        (not (at_player ?from))
        (at_player ?to)
      )
  )

  ;; Box pushing actions
  (:action push_box_left
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition
      (and
        (at_player ?player_from)
        (at_box ?box_from)
        (connected ?player_from ?box_from right) ; Player is to the right of the box
        (connected ?box_from ?box_to left)     ; Box moves left
        (not (is_wall ?box_to))
        (not (at_box ?box_to))                 ; Cannot push box onto another box
      )
    :effect
      (and
        (not (at_player ?player_from))
        (at_player ?box_from)                  ; Player moves to where box was
        (not (at_box ?box_from))
        (at_box ?box_to)
      )
  )

  (:action push_box_right
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition
      (and
        (at_player ?player_from)
        (at_box ?box_from)
        (connected ?player_from ?box_from left) ; Player is to the left of the box
        (connected ?box_from ?box_to right)    ; Box moves right
        (not (is_wall ?box_to))
        (not (at_box ?box_to))
      )
    :effect
      (and
        (not (at_player ?player_from))
        (at_player ?box_from)
        (not (at_box ?box_from))
        (at_box ?box_to)
      )
  )

  (:action push_box_up
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition
      (and
        (at_player ?player_from)
        (at_box ?box_from)
        (connected ?player_from ?box_from down) ; Player is below the box
        (connected ?box_from ?box_to up)       ; Box moves up
        (not (is_wall ?box_to))
        (not (at_box ?box_to))
      )
    :effect
      (and
        (not (at_player ?player_from))
        (at_player ?box_from)
        (not (at_box ?box_from))
        (at_box ?box_to)
      )
  )

  (:action push_box_down
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition
      (and
        (at_player ?player_from)
        (at_box ?box_from)
        (connected ?player_from ?box_from up)   ; Player is above the box
        (connected ?box_from ?box_to down)     ; Box moves down
        (not (is_wall ?box_to))
        (not (at_box ?box_to))
      )
    :effect
      (and
        (not (at_player ?player_from))
        (at_player ?box_from)
        (not (at_box ?box_from))
        (at_box ?box_to)
      )
  )
)