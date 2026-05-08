(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile) ; Tile is clear, can be moved onto or painted
    (painted ?t - tile ?c - color) ; Tile ?t is painted with color ?c
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
      (not (= ?old_c ?new_c)) ; Robot must have current color, and new color must be different
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
      (clear ?target_t)
      (not (painted ?target_t white)) ; Ensure it's not painted any color (assuming only white/black)
      (not (painted ?target_t black))
    )
    :effect (and
      (painted ?target_t ?c)
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
      (clear ?target_t)
      (not (painted ?target_t white)) ; Ensure it's not painted any color
      (not (painted ?target_t black))
    )
    :effect (and
      (painted ?target_t ?c)
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
      (not (painted ?to_t white)) ; And not painted with white
      (not (painted ?to_t black)) ; And not painted with black
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; Source tile becomes clear
      (not (clear ?to_t)) ; Destination tile becomes not clear
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (down ?from_t ?to_t)
      (clear ?to_t) ; Destination tile must be clear
      (not (painted ?to_t white)) ; And not painted with white
      (not (painted ?to_t black)) ; And not painted with black
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
      (not (painted ?to_t white)) ; And not painted with white
      (not (painted ?to_t black)) ; And not painted with black
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
      (not (painted ?to_t white)) ; And not painted with white
      (not (painted ?to_t black)) ; And not painted with black
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