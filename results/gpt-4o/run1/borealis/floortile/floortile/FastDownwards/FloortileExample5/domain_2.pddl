(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates 
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (painted ?t - tile ?c - color)
    (clear ?t - tile)
    (adjacent-up ?t1 ?t2 - tile)
    (adjacent-down ?t1 ?t2 - tile)
    (adjacent-left ?t1 ?t2 - tile)
    (adjacent-right ?t1 ?t2 - tile)
    (available-color ?c - color)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?new_c - color)
    :precondition (and (robot-has ?r ?c) (available-color ?new_c) (not (= ?c ?new_c)))
    :effect (and (not (robot-has ?r ?c)) (robot-has ?r ?new_c) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?current ?target - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current) (adjacent-up ?current ?target) (clear ?target))
    :effect (and (not (clear ?target)) (painted ?target ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?current ?target - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current) (adjacent-down ?current ?target) (clear ?target))
    :effect (and (not (clear ?target)) (painted ?target ?c) (increase (total-cost) 2))
  )

  (:action move-up
    :parameters (?r - robot ?current ?target - tile)
    :precondition (and (robot-at ?r ?current) (adjacent-up ?current ?target) (clear ?target))
    :effect (and (robot-at ?r ?target) (clear ?current) (not (clear ?target)) (increase (total-cost) 3))
  )

  (:action move-down
    :parameters (?r - robot ?current ?target - tile)
    :precondition (and (robot-at ?r ?current) (adjacent-down ?current ?target) (clear ?target))
    :effect (and (robot-at ?r ?target) (clear ?current) (not (clear ?target)) (increase (total-cost) 1))
  )
  
  (:action move-left
    :parameters (?r - robot ?current ?target - tile)
    :precondition (and (robot-at ?r ?current) (adjacent-left ?current ?target) (clear ?target))
    :effect (and (robot-at ?r ?target) (clear ?current) (not (clear ?target)) (increase (total-cost) 1))
  )

  (:action move-right
    :parameters (?r - robot ?current ?target - tile)
    :precondition (and (robot-at ?r ?current) (adjacent-right ?current ?target) (clear ?target))
    :effect (and (robot-at ?r ?target) (clear ?current) (not (clear ?target)) (increase (total-cost) 1))
  )
)