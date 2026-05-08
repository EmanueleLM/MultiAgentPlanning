(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?new - color ?old - color)
    :precondition (and (robot-has ?r ?old) (available-color ?new))
    :effect (and (not (robot-has ?r ?old)) (robot-has ?r ?new) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (up ?y ?x) (robot-has ?r ?c) (clear ?y))
    :effect (and (not (clear ?y)) (painted ?y ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (down ?y ?x) (robot-has ?r ?c) (clear ?y))
    :effect (and (not (clear ?y)) (painted ?y ?c) (increase (total-cost) 2))
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (up ?x ?y) (clear ?x))
    :effect (and (robot-at ?r ?x) (not (robot-at ?r ?y)) (clear ?y) (not (clear ?x)) (increase (total-cost) 3))
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (down ?x ?y) (clear ?x))
    :effect (and (robot-at ?r ?x) (not (robot-at ?r ?y)) (clear ?y) (not (clear ?x)) (increase (total-cost) 1))
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (right ?x ?y) (clear ?x))
    :effect (and (robot-at ?r ?x) (not (robot-at ?r ?y)) (clear ?y) (not (clear ?x)) (increase (total-cost) 1))
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (left ?x ?y) (clear ?x))
    :effect (and (robot-at ?r ?x) (not (robot-at ?r ?y)) (clear ?y) (not (clear ?x)) (increase (total-cost) 1))
  )
)