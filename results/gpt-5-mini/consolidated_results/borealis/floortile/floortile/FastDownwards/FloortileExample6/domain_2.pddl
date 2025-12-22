(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)

  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    ;; directional adjacency: keep only "up" and "right" facts in problem init;
    ;; "down" and "left" are handled as the inverse of these relations in actions.
    (up ?from - tile ?to - tile)    ;; ?to is above ?from
    (right ?from - tile ?to - tile) ;; ?to is to the right of ?from
  )

  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and
      (robot-has ?r ?c)
      (available-color ?c2)
      (not (robot-has ?r ?c2))
    )
    :effect (and
      (not (robot-has ?r ?c))
      (robot-has ?r ?c2)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?y)
      (up ?y ?x)        ;; ?x is above ?y
      (clear ?x)
      (robot-has ?r ?c)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?y)
      (up ?x ?y)        ;; inverse: ?x is below ?y when up ?x ?y holds
      (clear ?x)
      (robot-has ?r ?c)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)        ;; move to the tile above
      (clear ?y)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?y ?x)        ;; inverse check: ?y is below ?x when up ?y ?x holds
      (clear ?y)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (right ?x ?y)
      (clear ?y)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (right ?y ?x)     ;; inverse check: ?y is to the left of ?x when right ?y ?x holds
      (clear ?y)
    )
    :effect (and
      (robot-at ?r ?y)
      (not (robot-at ?r ?x))
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )
)