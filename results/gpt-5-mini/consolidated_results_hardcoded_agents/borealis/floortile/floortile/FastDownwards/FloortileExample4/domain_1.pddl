(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
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

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and
      (robot-has ?r ?c)
      (available-color ?c2)
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
      (robot-has ?r ?c)
      (up ?x ?y)
      (clear ?x)
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
      (robot-has ?r ?c)
      (down ?x ?y)
      (clear ?x)
    )
    :effect (and
      (painted ?x ?c)
      (not (clear ?x))
      (increase (total-cost) 2)
    )
  )

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