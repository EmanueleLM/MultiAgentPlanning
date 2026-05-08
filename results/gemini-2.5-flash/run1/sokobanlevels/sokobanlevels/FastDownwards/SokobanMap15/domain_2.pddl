(define (domain sokoban-map15)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adjacent_left ?l1 ?l2 - location)
    (adjacent_right ?l1 ?l2 - location)
    (adjacent_up ?l1 ?l2 - location)
    (adjacent_down ?l1 ?l2 - location)
  )

  (:functions
    (total-cost) - number
  )

  ;; Player movement actions
  (:action move_player_left
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (adjacent_left ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_right
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (adjacent_right ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (adjacent_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_player_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (adjacent_down ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Box pushing actions
  (:action push_box_left
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (adjacent_left ?player_from ?box_from)
      (adjacent_left ?box_from ?box_to)
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_right
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (adjacent_right ?player_from ?box_from)
      (adjacent_right ?box_from ?box_to)
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_up
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (adjacent_up ?player_from ?box_from)
      (adjacent_up ?box_from ?box_to)
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?box_from))
      (at_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box_down
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?box_from)
      (adjacent_down ?player_from ?box_from)
      (adjacent_down ?box_from ?box_to)
      (not (is_wall ?box_to))
      (not (at_box ?box_to))
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