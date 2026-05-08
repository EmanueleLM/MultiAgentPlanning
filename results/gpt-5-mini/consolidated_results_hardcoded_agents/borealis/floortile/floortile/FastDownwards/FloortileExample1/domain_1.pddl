(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs :fluents)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?x - tile ?y - tile)
    (down ?x - tile ?y - tile)
    (right ?x - tile ?y - tile)
    (left ?x - tile ?y - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and
      (robot-at ?r ?t)
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
    :parameters (?r - robot ?x - tile ?y - tile ?c - color)
    :precondition (and
      (robot-at ?r ?x)
      (robot-has ?r ?c)
      (up ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (clear ?y))
      (painted ?y ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?x - tile ?y - tile ?c - color)
    :precondition (and
      (robot-at ?r ?x)
      (robot-has ?r ?c)
      (down ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (clear ?y))
      (painted ?y ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (up ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (down ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
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
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and
      (robot-at ?r ?x)
      (left ?x ?y)
      (clear ?y)
    )
    :effect (and
      (not (robot-at ?r ?x))
      (robot-at ?r ?y)
      (clear ?x)
      (not (clear ?y))
      (increase (total-cost) 1)
    )
  )
)