(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object direction)
  (:predicates 
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (adjacent ?t1 - tile ?t2 - tile ?dir - direction)
  )
  (:functions 
    (total-cost)
  )

  (:action change-color
    :parameters (?r - robot ?new - color ?old - color)
    :precondition (and (robot-has ?r ?old) (available-color ?new) (not (= ?old ?new)))
    :effect (and (not (robot-has ?r ?old))
                 (robot-has ?r ?new)
                 (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y up) (robot-has ?r ?c))
    :effect (and (painted ?y ?c) (not (clear ?y))
                 (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y down) (robot-has ?r ?c))
    :effect (and (painted ?y ?c) (not (clear ?y))
                 (increase (total-cost) 2))
  )

  (:action move-up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y up))
    :effect (and (not (robot-at ?r ?x))
                 (robot-at ?r ?y)
                 (clear ?x) (not (clear ?y))
                 (increase (total-cost) 3))
  )

  (:action move-down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y down))
    :effect (and (not (robot-at ?r ?x))
                 (robot-at ?r ?y)
                 (clear ?x) (not (clear ?y))
                 (increase (total-cost) 1))
  )

  (:action move-right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y right))
    :effect (and (not (robot-at ?r ?x))
                 (robot-at ?r ?y)
                 (clear ?x) (not (clear ?y))
                 (increase (total-cost) 1))
  )

  (:action move-left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (clear ?y) (adjacent ?x ?y left))
    :effect (and (not (robot-at ?r ?x))
                 (robot-at ?r ?y)
                 (clear ?x) (not (clear ?y))
                 (increase (total-cost) 1))
  )
)