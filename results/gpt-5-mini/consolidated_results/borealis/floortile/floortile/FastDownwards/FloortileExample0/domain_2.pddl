(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (available-color ?c - color)
  )

  (:functions (total-cost))

  ;; change-color: robot swaps carried color to another available color
  (:action change-color
    :parameters (?r - robot ?cfrom - color ?cto - color)
    :precondition (and
                    (robot-has ?r ?cfrom)
                    (available-color ?cto)
                    (not (robot-has ?r ?cto))
                  )
    :effect (and
              (not (robot-has ?r ?cfrom))
              (robot-has ?r ?cto)
              (increase (total-cost) 5)
            )
  )

  ;; Paint the tile above the robot's current tile.
  ;; Requires the above tile to be clear (unoccupied and not painted).
  ;; Painting makes the tile painted with the carried color and not clear.
  (:action paint-up
    :parameters (?r - robot ?from - tile ?above - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?from)
                    (up ?from ?above)
                    (robot-has ?r ?c)
                    (clear ?above)
                  )
    :effect (and
              (not (clear ?above))
              (painted ?above ?c)
              (increase (total-cost) 2)
            )
  )

  ;; Paint the tile below the robot's current tile.
  (:action paint-down
    :parameters (?r - robot ?from - tile ?below - tile ?c - color)
    :precondition (and
                    (robot-at ?r ?from)
                    (down ?from ?below)
                    (robot-has ?r ?c)
                    (clear ?below)
                  )
    :effect (and
              (not (clear ?below))
              (painted ?below ?c)
              (increase (total-cost) 2)
            )
  )

  ;; Move up: requires destination tile to be clear. After moving, origin becomes clear and destination not clear.
  (:action move-up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (up ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 3)
            )
  )

  ;; Move down
  (:action move-down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (down ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  ;; Move right
  (:action move-right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (right ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )

  ;; Move left
  (:action move-left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
                    (robot-at ?r ?from)
                    (left ?from ?to)
                    (clear ?to)
                  )
    :effect (and
              (not (robot-at ?r ?from))
              (robot-at ?r ?to)
              (clear ?from)
              (not (clear ?to))
              (increase (total-cost) 1)
            )
  )
)