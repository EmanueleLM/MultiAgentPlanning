(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (painted ?t - tile ?c - color)
    (clear ?t - tile) ; True if tile is not painted, allowing robots to stand on it
    (available-color ?c - color) ; To ensure only specific colors can be held
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c_from - color ?c_to - color)
    :precondition (and
      (robot-has ?r ?c_from)
      (available-color ?c_to)
      (not (= ?c_from ?c_to)) ; Robot cannot change to the same color it already has
    )
    :effect (and
      (not (robot-has ?r ?c_from))
      (robot-has ?r ?c_to)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (robot-has ?r ?c)
      (up ?from ?to)
      (clear ?to) ; Tile must not be painted to be painted
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to)) ; Once painted, tile is no longer clear
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (robot-has ?r ?c)
      (down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?from ?to)
      (clear ?to) ; Robot can only move onto a clear tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (increase (total-cost) 1)
    )
  )
)