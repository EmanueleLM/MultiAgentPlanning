(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; A tile is clear if it's unpainted AND no robot is on it.
    (painted ?t - tile ?c - color) ; A tile is painted with a specific color. (Implies not clear)
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?oldc - color ?newc - color)
    :precondition (and
      (robot-has ?r ?oldc)
      (available-color ?newc)
      (not (= ?oldc ?newc))
    )
    :effect (and
      (not (robot-has ?r ?oldc))
      (robot-has ?r ?newc)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (up ?robot_pos ?target_tile)
      (clear ?target_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (clear ?target_tile)) ; Target tile is no longer clear
      (painted ?target_tile ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (down ?robot_pos ?target_tile)
      (clear ?target_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (clear ?target_tile)) ; Target tile is no longer clear
      (painted ?target_tile ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (up ?from_tile ?to_tile)
      (clear ?to_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile) ; Tile robot left becomes clear (unoccupied and unpainted)
      (not (clear ?to_tile)) ; Tile robot moved to is no longer clear (occupied)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (down ?from_tile ?to_tile)
      (clear ?to_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile) ; Tile robot left becomes clear
      (not (clear ?to_tile)) ; Tile robot moved to is no longer clear
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (right ?from_tile ?to_tile)
      (clear ?to_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile) ; Tile robot left becomes clear
      (not (clear ?to_tile)) ; Tile robot moved to is no longer clear
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (left ?from_tile ?to_tile)
      (clear ?to_tile) ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile) ; Tile robot left becomes clear
      (not (clear ?to_tile)) ; Tile robot moved to is no longer clear
      (increase (total-cost) 1)
    )
  )
)