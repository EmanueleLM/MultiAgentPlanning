(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?to - tile ?from - tile)
    (down ?to - tile ?from - tile)
    (right ?to - tile ?from - tile)
    (left ?to - tile ?from - tile)
  )

  (:functions (total-cost))

  ;; change-color: robot changes its paint color to an available color (cannot change to the same color)
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

  ;; paint the tile above the robot's current tile
  ;; requires the target tile to be clear and the robot to have a color
  ;; painting makes the tile non-clear (so no robot can enter it afterwards) and records its color
  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (up ?to ?from)
      (clear ?to)
      (robot-has ?r ?c)
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; paint the tile below the robot's current tile
  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (down ?to ?from)
      (clear ?to)
      (robot-has ?r ?c)
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; movement: move up to adjacent tile that must be clear (not painted and not occupied)
  ;; leaving the previous tile becomes clear after move
  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?to ?from)
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

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?to ?from)
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

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?to ?from)
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

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?to ?from)
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