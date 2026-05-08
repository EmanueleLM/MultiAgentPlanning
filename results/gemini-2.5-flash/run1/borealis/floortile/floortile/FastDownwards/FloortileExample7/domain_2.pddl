(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile) ; Tile is clear, can be moved onto or painted. A robot cannot stand on a non-clear tile.
    (painted ?t - tile ?c - color) ; Tile ?t is painted with color ?c
    (is-painted ?t - tile) ; True if the tile is painted with any color. No robot can move onto a tile that is (is-painted).
    (available-color ?c - color) ; A color that can be picked up by a robot.
    (up ?from - tile ?to - tile) ; ?to is directly above ?from
    (down ?from - tile ?to - tile) ; ?to is directly below ?from
    (right ?from - tile ?to - tile) ; ?to is directly to the right of ?from
    (left ?from - tile ?to - tile) ; ?to is directly to the left of ?from
  )

  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old_c - color ?new_c - color)
    :precondition (and
      (robot-has ?r ?old_c)
      (not (= ?old_c ?new_c)) ; New color must be different from old color
      (available-color ?new_c) ; New color must be available
    )
    :effect (and
      (not (robot-has ?r ?old_c))
      (robot-has ?r ?new_c)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and
      (robot-at ?r ?current_t)
      (up ?current_t ?target_t)
      (robot-has ?r ?c)
      (clear ?target_t) ; Target tile must be clear to be painted
      (not (is-painted ?target_t)) ; Target tile must not be painted already
    )
    :effect (and
      (painted ?target_t ?c)
      (is-painted ?target_t) ; Mark tile as painted
      (not (clear ?target_t)) ; Once painted, it's no longer clear
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and
      (robot-at ?r ?current_t)
      (down ?current_t ?target_t)
      (robot-has ?r ?c)
      (clear ?target_t) ; Target tile must be clear to be painted
      (not (is-painted ?target_t)) ; Target tile must not be painted already
    )
    :effect (and
      (painted ?target_t ?c)
      (is-painted ?target_t) ; Mark tile as painted
      (not (clear ?target_t)) ; Once painted, it's no longer clear
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (up ?from_t ?to_t)
      (clear ?to_t) ; Destination tile must be clear
      (not (is-painted ?to_t)) ; Destination tile must not be painted (robots cannot stand on painted tiles)
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; Source tile becomes clear
      (not (clear ?to_t)) ; Destination tile becomes not clear (because a robot is on it)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (down ?from_t ?to_t)
      (clear ?to_t) ; Destination tile must be clear
      (not (is-painted ?to_t)) ; Destination tile must not be painted
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; Source tile becomes clear
      (not (clear ?to_t)) ; Destination tile becomes not clear
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (right ?from_t ?to_t)
      (clear ?to_t) ; Destination tile must be clear
      (not (is-painted ?to_t)) ; Destination tile must not be painted
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; Source tile becomes clear
      (not (clear ?to_t)) ; Destination tile becomes not clear
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (left ?from_t ?to_t)
      (clear ?to_t) ; Destination tile must be clear
      (not (is-painted ?to_t)) ; Destination tile must not be painted
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; Source tile becomes clear
      (not (clear ?to_t)) ; Destination tile becomes not clear
      (increase (total-cost) 1)
    )
  )
)