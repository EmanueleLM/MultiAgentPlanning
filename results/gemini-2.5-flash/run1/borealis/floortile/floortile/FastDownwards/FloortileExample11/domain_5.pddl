(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; A tile is clear if no robot is on it AND it is not painted.
    (painted ?t - tile ?c - color)
    ; Base predicates for grid connectivity
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old_c - color ?new_c - color)
    :precondition (and
      (robot-has ?r ?old_c)
      (available-color ?new_c)
      (not (= ?old_c ?new_c)) ; Robot must change to a different color
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
      (robot-has ?r ?c)
      (robot-at ?r ?current_t)
      (up ?current_t ?target_t)
      (clear ?target_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (clear ?target_t)) ; Tile is no longer clear (it's now painted)
      (painted ?target_t ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?current_t)
      (down ?current_t ?target_t)
      (clear ?target_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (clear ?target_t)) ; Tile is no longer clear (it's now painted)
      (painted ?target_t ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (up ?from_t ?to_t)
      (clear ?to_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; The tile the robot left is now clear (assuming it wasn't painted)
      (not (clear ?to_t)) ; The tile the robot moved to is now occupied, hence not clear
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (down ?from_t ?to_t)
      (clear ?to_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; The tile the robot left is now clear (assuming it wasn't painted)
      (not (clear ?to_t)) ; The tile the robot moved to is now occupied, hence not clear
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (right ?from_t ?to_t)
      (clear ?to_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; The tile the robot left is now clear (assuming it wasn't painted)
      (not (clear ?to_t)) ; The tile the robot moved to is now occupied, hence not clear
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (left ?from_t ?to_t)
      (clear ?to_t) ; Target tile must be clear (unoccupied and unpainted)
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t) ; The tile the robot left is now clear (assuming it wasn't painted)
      (not (clear ?to_t)) ; The tile the robot moved to is now occupied, hence not clear
      (increase (total-cost) 1)
    )
  )