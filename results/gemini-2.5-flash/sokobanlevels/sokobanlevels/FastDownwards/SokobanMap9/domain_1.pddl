(define (domain sokoban-map9)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location - object)
  (:predicates
    (player-at ?l - location)
    (box-at ?l - location)
    (is-wall ?l - location)
    (is-goal ?l - location)
    (adj-up ?from ?to - location)
    (adj-down ?from ?to - location)
  )

  (:functions
    (total-cost) - number
  )

  ;; Player movement actions
  ;; Move Up
  (:action move-up
    :parameters (?from ?to - location)
    :precondition (and
      (player-at ?from)
      (adj-up ?from ?to)
      (not (is-wall ?to))
      (not (box-at ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Move Down
  (:action move-down
    :parameters (?from ?to - location)
    :precondition (and
      (player-at ?from)
      (adj-down ?from ?to)
      (not (is-wall ?to))
      (not (box-at ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Box pushing actions
  ;; Push Up
  (:action push-up
    :parameters (?player_loc ?box_loc ?target_loc - location)
    :precondition (and
      (player-at ?player_loc)
      (box-at ?box_loc)
      (adj-up ?player_loc ?box_loc) ; Player is below box_loc, box_loc is above player_loc
      (adj-up ?box_loc ?target_loc) ; target_loc is above box_loc
      (not (is-wall ?target_loc))
      (not (box-at ?target_loc)) ; Cannot push into another box
    )
    :effect (and
      (not (player-at ?player_loc))
      (player-at ?box_loc) ; Player moves to box's previous spot
      (not (box-at ?box_loc))
      (box-at ?target_loc)
      (increase (total-cost) 1)
    )
  )

  ;; Push Down
  (:action push-down
    :parameters (?player_loc ?box_loc ?target_loc - location)
    :precondition (and
      (player-at ?player_loc)
      (box-at ?box_loc)
      (adj-down ?player_loc ?box_loc) ; Player is above box_loc, box_loc is below player_loc
      (adj-down ?box_loc ?target_loc) ; target_loc is below box_loc
      (not (is-wall ?target_loc))
      (not (box-at ?target_loc)) ; Cannot push into another box
    )
    :effect (and
      (not (player-at ?player_loc))
      (player-at ?box_loc) ; Player moves to box's previous spot
      (not (box-at ?box_loc))
      (box-at ?target_loc)
      (increase (total-cost) 1)
    )
  )
)