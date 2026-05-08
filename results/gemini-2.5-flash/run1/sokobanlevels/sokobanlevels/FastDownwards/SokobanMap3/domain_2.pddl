(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    box
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_wall ?l - location)
    (is_goal ?l - location)
    (connected_left ?l1 - location ?l2 - location)
    (connected_right ?l1 - location ?l2 - location)
    (connected_up ?l1 - location ?l2 - location)
    (connected_down ?l1 - location ?l2 - location)
  )

  (:action move_player_left
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_left ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_right
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_right ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_down ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_box_left
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_left ?player_from ?box_from) ; Player is to the right of the box, so box is left of player
      (connected_left ?box_from ?box_to)      ; Box moves left
      (not (is_wall ?box_to))
      (not (at_box ?box_to))                  ; Cannot push box into another box
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)                   ; Player moves to box's old spot
      (not (at_box ?box_from))
      (at_box ?box_to)
    )
  )

  (:action push_box_right
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_right ?player_from ?box_from) ; Player is to the left of the box, so box is right of player
      (connected_right ?box_from ?box_to)     ; Box moves right
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
    )
  )

  (:action push_box_up
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_up ?player_from ?box_from)    ; Player is below the box, so box is up from player
      (connected_up ?box_from ?box_to)        ; Box moves up
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
    )
  )

  (:action push_box_down
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_down ?player_from ?box_from)  ; Player is above the box, so box is down from player
      (connected_down ?box_from ?box_to)      ; Box moves down
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
    )
  )
)