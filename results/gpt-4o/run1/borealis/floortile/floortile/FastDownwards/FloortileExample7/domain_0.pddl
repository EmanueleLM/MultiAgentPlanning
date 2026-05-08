(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates 
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (painted ?t - tile ?c - color)
    (clear ?t - tile)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (available-color ?c - color)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old - color ?new - color)
    :precondition (and (robot-has ?r ?old) (available-color ?new) (not (= ?old ?new)))
    :effect (and (not (robot-has ?r ?old)) (robot-has ?r ?new) (increase (total-cost) 5))
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (clear ?to) (up ?to ?from))
    :effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to) (clear ?from) (not (clear ?to)) (increase (total-cost) 3))
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (clear ?to) (down ?to ?from))
    :effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to) (clear ?from) (not (clear ?to)) (increase (total-cost) 1))
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (clear ?to) (left ?to ?from))
    :effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to) (clear ?from) (not (clear ?to)) (increase (total-cost) 1))
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (clear ?to) (right ?to ?from))
    :effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to) (clear ?from) (not (clear ?to)) (increase (total-cost) 1))
  )

  (:action paint-up
    :parameters (?r - robot ?current - tile ?upper - tile ?c - color)
    :precondition (and (robot-at ?r ?current) (robot-has ?r ?c) (clear ?upper) (up ?upper ?current))
    :effect (and (not (clear ?upper)) (painted ?upper ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?current - tile ?lower - tile ?c - color)
    :precondition (and (robot-at ?r ?current) (robot-has ?r ?c) (clear ?lower) (down ?lower ?current))
    :effect (and (not (clear ?lower)) (painted ?lower ?c) (increase (total-cost) 2))
  )
)