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
    (right ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))
  
  (:action change-color
    :parameters (?r - robot ?c1 - color ?c2 - color)
    :precondition (and (robot-has ?r ?c1) (available-color ?c2) (not (= ?c1 ?c2)))
    :effect (and (not (robot-has ?r ?c1)) (robot-has ?r ?c2) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?t1 - tile ?t2 - tile ?c - color)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (up ?t2 ?t1) (robot-has ?r ?c))
    :effect (and (not (clear ?t2)) (painted ?t2 ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?t1 - tile ?t2 - tile ?c - color)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (down ?t2 ?t1) (robot-has ?r ?c))
    :effect (and (not (clear ?t2)) (painted ?t2 ?c) (increase (total-cost) 2))
  )

  (:action up
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (up ?t2 ?t1))
    :effect (and (robot-at ?r ?t2) (clear ?t1) (not (clear ?t2)) (increase (total-cost) 3))
  )

  (:action down
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (down ?t2 ?t1))
    :effect (and (robot-at ?r ?t2) (clear ?t1) (not (clear ?t2)) (increase (total-cost) 1))
  )

  (:action right
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (right ?t2 ?t1))
    :effect (and (robot-at ?r ?t2) (clear ?t1) (not (clear ?t2)) (increase (total-cost) 1))
  )

  (:action left
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and (robot-at ?r ?t1) (clear ?t2) (left ?t2 ?t1))
    :effect (and (robot-at ?r ?t2) (clear ?t1) (not (clear ?t2)) (increase (total-cost) 1))
  )
)