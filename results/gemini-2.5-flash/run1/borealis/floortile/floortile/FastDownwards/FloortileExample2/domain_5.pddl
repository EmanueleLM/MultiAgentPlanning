(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (painted-with ?t - tile ?c - color)
    (unoccupied ?t - tile)
    (unpainted ?t - tile)
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
      (not (robot-has ?r ?newc))
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
      (unpainted ?target_tile)
    )
    :effect (and
      (painted-with ?target_tile ?c)
      (not (unpainted ?target_tile))
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (down ?robot_pos ?target_tile)
      (unpainted ?target_tile)
    )
    :effect (and
      (painted-with ?target_tile ?c)
      (not (unpainted ?target_tile))
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?from ?to)
      (unoccupied ?to)
      (unpainted ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (unoccupied ?from)
      (not (unoccupied ?to))
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?from ?to)
      (unoccupied ?to)
      (unpainted ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (unoccupied ?from)
      (not (unoccupied ?to))
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?from ?to)
      (unoccupied ?to)
      (unpainted ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (unoccupied ?from)
      (not (unoccupied ?to))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?from ?to)
      (unoccupied ?to)
      (unpainted ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (unoccupied ?from)
      (not (unoccupied ?to))
      (increase (total-cost) 1)
    )
  )
)