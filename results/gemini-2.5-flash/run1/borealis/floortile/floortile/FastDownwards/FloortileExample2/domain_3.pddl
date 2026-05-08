(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (painted-with ?t - tile ?c - color) ; A tile has been painted with a specific color.
    (tile-unoccupied ?t - tile) ; True if no robot is on the tile.
    (tile-unpainted ?t - tile) ; True if the tile has not been painted with any color.

    ; Connectivity predicates
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
      (not (robot-has ?r ?newc)) ; Robot must not already have the new color (enforces actual change)
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
      (up ?robot_pos ?target_tile) ; ?target_tile is above ?robot_pos
      (tile-unpainted ?target_tile) ; Target tile must be unpainted to be painted
      ; The NL says "tile above is clear" for painting. This implies it's unpainted.
      ; It doesn't imply unoccupied, as a robot paints from its position to an adjacent tile.
    )
    :effect (and
      (painted-with ?target_tile ?c)
      (not (tile-unpainted ?target_tile)) ; Painted tile is no longer unpainted
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (down ?robot_pos ?target_tile) ; ?target_tile is below ?robot_pos
      (tile-unpainted ?target_tile) ; Target tile must be unpainted to be painted
    )
    :effect (and
      (painted-with ?target_tile ?c)
      (not (tile-unpainted ?target_tile)) ; Painted tile is no longer unpainted
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?from ?to)
      (tile-unoccupied ?to) ; Target tile must not be occupied by another robot
      (tile-unpainted ?to) ; Cannot move onto a painted tile (as per problem statement "once a tile is painted, no robot can stand on it")
      ; The NL for movement says "tile above is clear". This implies both unoccupied and unpainted.
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (tile-unoccupied ?from) ; Old tile becomes unoccupied
      (not (tile-unoccupied ?to)) ; New tile becomes occupied
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?from ?to)
      (tile-unoccupied ?to) ; Target tile must not be occupied by another robot
      (tile-unpainted ?to) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (tile-unoccupied ?from) ; Old tile becomes unoccupied
      (not (tile-unoccupied ?to)) ; New tile becomes occupied
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?from ?to)
      (tile-unoccupied ?to) ; Target tile must not be occupied by another robot
      (tile-unpainted ?to) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (tile-unoccupied ?from) ; Old tile becomes unoccupied
      (not (tile-unoccupied ?to)) ; New tile becomes occupied
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?from ?to)
      (tile-unoccupied ?to) ; Target tile must not be occupied by another robot
      (tile-unpainted ?to) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (tile-unoccupied ?from) ; Old tile becomes unoccupied
      (not (tile-unoccupied ?to)) ; New tile becomes occupied
      (increase (total-cost) 1)
    )
  )
)