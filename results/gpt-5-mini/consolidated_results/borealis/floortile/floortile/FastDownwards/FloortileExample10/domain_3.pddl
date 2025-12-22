(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (occupied ?t - tile)
    (painted ?t - tile ?c - color)
    (painted-any ?t - tile)
    (up ?from - tile ?to - tile)    ; ?to is the tile above ?from
    (right ?from - tile ?to - tile) ; ?to is the tile to the right of ?from
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
      (up ?y ?x)                         ; ?x is above ?y
      (not (occupied ?x))
      (not (painted-any ?x))
    )
    :effect (and
      (painted ?x ?c)
      (painted-any ?x)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and
      (robot-at ?r ?y)
      (robot-has ?r ?c)
      (up ?x ?y)                         ; ?x is below ?y
      (not (occupied ?x))
      (not (painted-any ?x))
    )
    :effect (and
      (painted ?x ?c)
      (painted-any ?x)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)
      (not (occupied ?y))
      (not (painted-any ?y))
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (occupied ?x))
      (occupied ?y)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?y ?x)                         ; ?y is below ?x
      (not (occupied ?y))
      (not (painted-any ?y))
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (occupied ?x))
      (occupied ?y)
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (right ?x ?y)
      (not (occupied ?y))
      (not (painted-any ?y))
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (occupied ?x))
      (occupied ?y)
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (right ?y ?x)                      ; ?y is to the left of ?x
      (not (occupied ?y))
      (not (painted-any ?y))
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (not (occupied ?x))
      (occupied ?y)
      (increase (total-cost) 1)
    )
  )
)