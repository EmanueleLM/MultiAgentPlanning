(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (adjacent ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?oldc - color ?newc - color)
    :precondition (and (robot-has ?r ?oldc) (available-color ?newc))
    :effect (and (not (robot-has ?r ?oldc)) (robot-has ?r ?newc) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?u - tile ?t - tile ?c - color)
    :precondition (and (robot-at ?r ?u) (adjacent ?u ?t) (clear ?t) (robot-has ?r ?c))
    :effect (and (not (clear ?t)) (painted ?t ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?d - tile ?t - tile ?c - color)
    :precondition (and (robot-at ?r ?d) (adjacent ?d ?t) (clear ?t) (robot-has ?r ?c))
    :effect (and (not (clear ?t)) (painted ?t ?c) (increase (total-cost) 2))
  )

  (:action move
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and (robot-at ?r ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (robot-at ?r ?from)) (robot-at ?r ?to) (not (clear ?to)) (clear ?from) (increase (total-cost) 1))
  )
)