(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types 
    robot 
    tile 
    color - object
  )
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; A tile is clear if it is neither painted nor occupied by a robot.
    (painted ?t - tile ?c - color)

    ; Connectivity predicates: (direction ?from_tile ?to_tile)
    ; These predicates define the 'target' tile (?to) relative to the 'source' tile (?from).
    ; The interpretation of 'right' and 'left' is derived directly from the provided problem template's init block.
    (up ?from - tile ?to - tile)    ; ?to is above ?from (smaller row index)
    (down ?from - tile ?to - tile)  ; ?to is below ?from (larger row index)
    (right ?from - tile ?to - tile) ; ?to is to the right of ?from (smaller column index, non-standard but consistent with template)
    (left ?from - tile ?to - tile)  ; ?to is to the left of ?from (larger column index, non-standard but consistent with template)
  )
  (:functions 
    (total-cost)
  )

  (:action change-color
    :parameters (?r - robot ?old_c - color ?new_c - color)
    :precondition (and
      (robot-has ?r ?old_c)
      (available-color ?new_c)
      (not (= ?old_c ?new_c)) ; Cannot change to the same color
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
      (robot-has ?r ?c)
      (up ?current_t ?target_t) ; Target tile must be above the current tile
      (clear ?target_t)         ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (clear ?target_t))   ; Target tile is now painted, so it's no longer clear
      (painted ?target_t ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and
      (robot-at ?r ?current_t)
      (robot-has ?r ?c)
      (down ?current_t ?target_t) ; Target tile must be below the current tile
      (clear ?target_t)           ; Target tile must be unpainted and unoccupied
    )
    :effect (and
      (not (clear ?target_t))     ; Target tile is now painted, so it's no longer clear
      (painted ?target_t ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (up ?from_t ?to_t)      ; ?to_t must be the tile above ?from_t
      (clear ?to_t)           ; Destination tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t)         ; Robot moves off, so ?from_t becomes clear (unoccupied, was unpainted)
      (not (clear ?to_t))     ; Robot moves onto ?to_t, so it's no longer clear
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (down ?from_t ?to_t)    ; ?to_t must be the tile below ?from_t
      (clear ?to_t)           ; Destination tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t)         ; Robot moves off, so ?from_t becomes clear
      (not (clear ?to_t))     ; Robot moves onto ?to_t, so it's no longer clear
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (right ?from_t ?to_t)   ; ?to_t must be the tile to the right of ?from_t
      (clear ?to_t)           ; Destination tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t)         ; Robot moves off, so ?from_t becomes clear
      (not (clear ?to_t))     ; Robot moves onto ?to_t, so it's no longer clear
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from_t - tile ?to_t - tile)
    :precondition (and
      (robot-at ?r ?from_t)
      (left ?from_t ?to_t)    ; ?to_t must be the tile to the left of ?from_t
      (clear ?to_t)           ; Destination tile must be unpainted and unoccupied
    )
    :effect (and
      (not (robot-at ?r ?from_t))
      (robot-at ?r ?to_t)
      (clear ?from_t)         ; Robot moves off, so ?from_t becomes clear
      (not (clear ?to_t))     ; Robot moves onto ?to_t, so it's no longer clear
      (increase (total-cost) 1)
    )
  )
)