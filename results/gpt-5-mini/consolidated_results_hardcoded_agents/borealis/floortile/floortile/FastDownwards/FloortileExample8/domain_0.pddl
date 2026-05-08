(define (domain painting-robots)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (has-color ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (north ?from - tile ?to - tile)
    (south ?from - tile ?to - tile)
    (east ?from - tile ?to - tile)
    (west ?from - tile ?to - tile)
  )

  (:functions (total-cost))

  ;; change-color: robot changes its paint color (cannot "change" to the color it already has)
  (:action change-color
    :parameters (?r - robot ?cfrom - color ?cto - color)
    :precondition (and
      (has-color ?r ?cfrom)
      (not (has-color ?r ?cto))
    )
    :effect (and
      (not (has-color ?r ?cfrom))
      (has-color ?r ?cto)
      (increase (total-cost) 5)
    )
  )

  ;; paint the tile north of the robot's current tile
  ;; painting requires the target tile to be clear (unpainted) and paints it with the robot's current color
  ;; painted tiles become non-clear (and thus cannot be entered)
  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (north ?from ?to)
      (clear ?to)
      (has-color ?r ?c)
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; paint the tile south of the robot's current tile
  (:action paint-down
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and
      (robot-at ?r ?from)
      (south ?from ?to)
      (clear ?to)
      (has-color ?r ?c)
    )
    :effect (and
      (painted ?to ?c)
      (not (clear ?to))
      (increase (total-cost) 2)
    )
  )

  ;; movement actions: robots may move only to clear tiles (painted tiles are not clear and thus cannot be entered)

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (north ?from ?to)
      (clear ?to)
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
      (south ?from ?to)
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
      (east ?from ?to)
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
      (west ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (increase (total-cost) 1)
    )
  )

)