(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
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
      (not (= ?old_c ?new_c))
    )
    :effect (and
      (not (robot-has ?r ?old_c))
      (robot-has ?r ?new_c)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?current_tile - tile ?tile_above - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?current_tile)
      (up ?current_tile ?tile_above)
      (clear ?tile_above)
    )
    :effect (and
      (not (clear ?tile_above))
      (painted ?tile_above ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?current_tile - tile ?tile_below - tile ?c - color)
    :precondition (and
      (robot-has ?r ?c)
      (robot-at ?r ?current_tile)
      (down ?current_tile ?tile_below)
      (clear ?tile_below)
    )
    :effect (and
      (not (clear ?tile_below))
      (painted ?tile_below ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (up ?from_tile ?to_tile)
      (clear ?to_tile)
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile)
      (not (clear ?to_tile))
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (down ?from_tile ?to_tile)
      (clear ?to_tile)
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile)
      (not (clear ?to_tile))
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (right ?from_tile ?to_tile)
      (clear ?to_tile)
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile)
      (not (clear ?to_tile))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from_tile - tile ?to_tile - tile)
    :precondition (and
      (robot-at ?r ?from_tile)
      (left ?from_tile ?to_tile)
      (clear ?to_tile)
    )
    :effect (and
      (not (robot-at ?r ?from_tile))
      (robot-at ?r ?to_tile)
      (clear ?from_tile)
      (not (clear ?to_tile))
      (increase (total-cost) 1)
    )
  )
)