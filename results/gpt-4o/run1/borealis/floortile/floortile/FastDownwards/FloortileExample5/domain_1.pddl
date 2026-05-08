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
    :parameters (?r - robot ?old_c - color ?new_c - color)
    :precondition (and (robot-has ?r ?old_c) (available-color ?new_c) (not (= ?old_c ?new_c)))
    :effect (and (not (robot-has ?r ?old_c)) (robot-has ?r ?new_c) (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current_t) (adjacent-up ?current_t ?target_t) (clear ?target_t))
    :effect (and (not (clear ?target_t)) (painted ?target_t ?c) (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?current_t - tile ?target_t - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current_t) (adjacent-down ?current_t ?target_t) (clear ?target_t))
    :effect (and (not (clear ?target_t)) (painted ?target_t ?c) (increase (total-cost) 2))
  )

  (:action move-up
    :parameters (?r - robot ?current_t - tile ?target_t - tile)
    :precondition (and (robot-at ?r ?current_t) (adjacent-up ?current_t ?target_t) (clear ?target_t))
    :effect (and (robot-at ?r ?target_t) (clear ?current_t) (not (clear ?target_t)) (increase (total-cost) 3))
  )

  (:action move-down
    :parameters (?r - robot ?current_t - tile ?target_t - tile)
    :precondition (and (robot-at ?r ?current_t) (adjacent-down ?current_t ?target_t) (clear ?target_t))
    :effect (and (robot-at ?r ?target_t) (clear ?current_t) (not (clear ?target_t)) (increase (total-cost) 1))
  )
  
  (:action move-left
    :parameters (?r - robot ?current_t - tile ?target_t - tile)
    :precondition (and (robot-at ?r ?current_t) (adjacent-left ?current_t ?target_t) (clear ?target_t))
    :effect (and (robot-at ?r ?target_t) (clear ?current_t) (not (clear ?target_t)) (increase (total-cost) 1))
  )

  (:action move-right
    :parameters (?r - robot ?current_t - tile ?target_t - tile)
    :precondition (and (robot-at ?r ?current_t) (adjacent-right ?current_t ?target_t) (clear ?target_t))
    :effect (and (robot-at ?r ?target_t) (clear ?current_t) (not (clear ?target_t)) (increase (total-cost) 1))
  )
)