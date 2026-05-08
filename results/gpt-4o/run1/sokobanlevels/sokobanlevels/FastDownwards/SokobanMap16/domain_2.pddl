(define (domain sokoban)
  (:requirements :strips :typing)
  (:types entity location)
  (:predicates
    (at ?e - entity ?l - location)
    (goal_at ?l - location)
    (accessible ?l - location)
    (adjacent ?l1 ?l2 - location)
  )
  (:action move_left
    :parameters (?from ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (accessible ?to)
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )
  (:action move_right
    :parameters (?from ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (accessible ?to)
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )
  (:action move_up
    :parameters (?from ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (accessible ?to)
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )
  (:action move_down
    :parameters (?from ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (accessible ?to)
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )
  (:action push_left
    :parameters (?from_player ?from_box ?to_box - location)
    :precondition (and
      (at player ?from_player)
      (at box ?from_box)
      (adjacent ?from_player ?from_box)
      (adjacent ?from_box ?to_box)
      (accessible ?to_box)
    )
    :effect (and
      (not (at box ?from_box))
      (at box ?to_box)
      (not (at player ?from_player))
      (at player ?from_box)
    )
  )
  (:action push_right
    :parameters (?from_player ?from_box ?to_box - location)
    :precondition (and
      (at player ?from_player)
      (at box ?from_box)
      (adjacent ?from_player ?from_box)
      (adjacent ?from_box ?to_box)
      (accessible ?to_box)
    )
    :effect (and
      (not (at box ?from_box))
      (at box ?to_box)
      (not (at player ?from_player))
      (at player ?from_box)
    )
  )
  (:action push_up
    :parameters (?from_player ?from_box ?to_box - location)
    :precondition (and
      (at player ?from_player)
      (at box ?from_box)
      (adjacent ?from_player ?from_box)
      (adjacent ?from_box ?to_box)
      (accessible ?to_box)
    )
    :effect (and
      (not (at box ?from_box))
      (at box ?to_box)
      (not (at player ?from_player))
      (at player ?from_box)
    )
  )
  (:action push_down
    :parameters (?from_player ?from_box ?to_box - location)
    :precondition (and
      (at player ?from_player)
      (at box ?from_box)
      (adjacent ?from_player ?from_box)
      (adjacent ?from_box ?to_box)
      (accessible ?to_box)
    )
    :effect (and
      (not (at box ?from_box))
      (at box ?to_box)
      (not (at player ?from_player))
      (at player ?from_box)
    )
  )
)