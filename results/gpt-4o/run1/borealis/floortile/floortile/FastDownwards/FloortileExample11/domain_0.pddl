(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates 
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (available-color ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
  )
  (:functions (total-cost))
  
  (:action change-color
    :parameters (?r - robot ?c1 - color ?c2 - color)
    :precondition (and (robot-has ?r ?c1) (available-color ?c2))
    :effect (and (not (robot-has ?r ?c1)) (robot-has ?r ?c2) (increase (total-cost) 5))
  )
  
  (:action paint-up
    :parameters (?r - robot ?current - tile ?above - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current) (up ?above ?current) (clear ?above))
    :effect (and (not (clear ?above)) (painted ?above ?c) (increase (total-cost) 2))
  )
  
  (:action paint-down
    :parameters (?r - robot ?current - tile ?below - tile ?c - color)
    :precondition (and (robot-has ?r ?c) (robot-at ?r ?current) (down ?below ?current) (clear ?below))
    :effect (and (not (clear ?below)) (painted ?below ?c) (increase (total-cost) 2))
  )
  
  (:action up
    :parameters (?r - robot ?current - tile ?above - tile)
    :precondition (and (robot-at ?r ?current) (clear ?above) (up ?above ?current))
    :effect (and (not (robot-at ?r ?current)) (robot-at ?r ?above) (clear ?current) (not (clear ?above)) (increase (total-cost) 3))
  )
  
  (:action down
    :parameters (?r - robot ?current - tile ?below - tile)
    :precondition (and (robot-at ?r ?current) (clear ?below) (down ?below ?current))
    :effect (and (not (robot-at ?r ?current)) (robot-at ?r ?below) (clear ?current) (not (clear ?below)) (increase (total-cost) 1))
  )
  
  (:action right
    :parameters (?r - robot ?current - tile ?right - tile)
    :precondition (and (robot-at ?r ?current) (clear ?right) (right ?right ?current))
    :effect (and (not (robot-at ?r ?current)) (robot-at ?r ?right) (clear ?current) (not (clear ?right)) (increase (total-cost) 1))
  )
  
  (:action left
    :parameters (?r - robot ?current - tile ?left - tile)
    :precondition (and (robot-at ?r ?current) (clear ?left) (left ?left ?current))
    :effect (and (not (robot-at ?r ?current)) (robot-at ?r ?left) (clear ?current) (not (clear ?left)) (increase (total-cost) 1))
  )
)