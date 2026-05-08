(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?oldc - color ?newc - color)
    :precondition (and (robot-has ?r ?oldc) (available-color ?newc))
    :effect (and (not (robot-has ?r ?oldc)) (robot-has ?r ?newc) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?u - tile ?t - tile ?c - color)
    :precondition (and (robot-at ?r ?u) (up ?u ?t) (clear ?t) (robot-has ?r ?c))
    :effect (and (not (clear ?t)) (painted ?t ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?d - tile ?t - tile ?c - color)
    :precondition (and (robot-at ?r ?d) (down ?d ?t) (clear ?t) (robot-has ?r ?c))
    :effect (and (not (clear ?t)) (painted ?t ?c) (increase (total-cost) 2))
  )

  (:action move-up
    :parameters (?r - robot ?u - tile ?t - tile)
    :precondition (and (robot-at ?r ?u) (up ?u ?t) (clear ?t))
    :effect (and (not (robot-at ?r ?u)) (robot-at ?r ?t) (not (clear ?t)) (clear ?u) (increase (total-cost) 3))
  )

  (:action move-down
    :parameters (?r - robot ?d - tile ?t - tile)
    :precondition (and (robot-at ?r ?d) (down ?d ?t) (clear ?t))
    :effect (and (not (robot-at ?r ?d)) (robot-at ?r ?t) (not (clear ?t)) (clear ?d) (increase (total-cost) 1))
  )

  (:action move-right
    :parameters (?r - robot ?rpos - tile ?t - tile)
    :precondition (and (robot-at ?r ?rpos) (right ?rpos ?t) (clear ?t))
    :effect (and (not (robot-at ?r ?rpos)) (robot-at ?r ?t) (not (clear ?t)) (clear ?rpos) (increase (total-cost) 1))
  )

  (:action move-left
    :parameters (?r - robot ?l - tile ?t - tile)
    :precondition (and (robot-at ?r ?l) (left ?l ?t) (clear ?t))
    :effect (and (not (robot-at ?r ?l)) (robot-at ?r ?t) (not (clear ?t)) (clear ?l) (increase (total-cost) 1))
  )
)