(define (domain sokoban-map16)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (connected_up ?from ?to - location)
    (connected_down ?from ?to - location)
    (connected_left ?from ?to - location)
    (connected_right ?from ?to - location)
  )
  (:functions
    (total-cost)
  )

  ;; Player movement actions
  (define (action move_up)
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_up ?from ?to)
      (not (at_box ?to))
      (not (is_wall ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (define (action move_down)
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_down ?from ?to)
      (not (at_box ?to))
      (not (is_wall ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (define (action move_left)
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_left ?from ?to)
      (not (at_box ?to))
      (not (is_wall ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (define (action move_right)
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_right ?from ?to)
      (not (at_box ?to))
      (not (is_wall ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Box pushing actions
  (define (action push_up)
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_up ?player_from ?box_from) ; Player is below box
      (connected_up ?box_from ?box_to)    ; Box moves up to empty spot
      (not (at_box ?box_to))
      (not (at_player ?box_to))
      (not (is_wall ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from) ; Player moves to the box's original spot
      (not (at_box ?box_from))
      (at_box ?box_to)      ; Box moves to the new spot
      (increase (total-cost) 1)
    )
  )

  (define (action push_down)
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_down ?player_from ?box_from) ; Player is above box
      (connected_down ?box_from ?box_to)    ; Box moves down to empty spot
      (not (at_box ?box_to))
      (not (at_player ?box_to))
      (not (is_wall ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (define (action push_left)
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_left ?player_from ?box_from) ; Player is right of box
      (connected_left ?box_from ?box_to)    ; Box moves left to empty spot
      (not (at_box ?box_to))
      (not (at_player ?box_to))
      (not (is_wall ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (define (action push_right)
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (connected_right ?player_from ?box_from) ; Player is left of box
      (connected_right ?box_from ?box_to)    ; Box moves right to empty spot
      (not (at_box ?box_to))
      (not (at_player ?box_to))
      (not (is_wall ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )
)