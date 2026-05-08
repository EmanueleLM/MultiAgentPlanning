(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates 
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?x - tile ?y - tile)
    (down ?x - tile ?y - tile)
    (right ?x - tile ?y - tile)
    (left ?x - tile ?y - tile)
    (available-color ?c - color)
  )
  (:functions (total-cost))
  
  (:action change-color
    :parameters (?r - robot ?new-color - color ?current-color - color)
    :precondition (and 
      (robot-has ?r ?current-color) 
      (available-color ?new-color)
    )
    :effect (and 
      (not (robot-has ?r ?current-color)) 
      (robot-has ?r ?new-color) 
      (increase (total-cost) 5)
    )
  )
  
  (:action paint-up
    :parameters (?r - robot ?current-tile - tile ?above-tile - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (up ?current-tile ?above-tile) 
      (robot-has ?r ?c) 
      (clear ?above-tile)
    )
    :effect (and 
      (not (clear ?above-tile)) 
      (painted ?above-tile ?c) 
      (increase (total-cost) 2)
    )
  )
  
  (:action paint-down
    :parameters (?r - robot ?current-tile - tile ?below-tile - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (down ?current-tile ?below-tile) 
      (robot-has ?r ?c) 
      (clear ?below-tile)
    )
    :effect (and 
      (not (clear ?below-tile)) 
      (painted ?below-tile ?c) 
      (increase (total-cost) 2)
    )
  )
  
  (:action up
    :parameters (?r - robot ?current-tile - tile ?above-tile - tile)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (up ?current-tile ?above-tile) 
      (clear ?above-tile)
    )
    :effect (and 
      (robot-at ?r ?above-tile) 
      (not (robot-at ?r ?current-tile)) 
      (not (clear ?above-tile)) 
      (clear ?current-tile) 
      (increase (total-cost) 3)
    )
  )
  
  (:action down
    :parameters (?r - robot ?current-tile - tile ?below-tile - tile)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (down ?current-tile ?below-tile) 
      (clear ?below-tile)
    )
    :effect (and 
      (robot-at ?r ?below-tile) 
      (not (robot-at ?r ?current-tile))
      (not (clear ?below-tile)) 
      (clear ?current-tile) 
      (increase (total-cost) 1)
    )
  )
  
  (:action right
    :parameters (?r - robot ?current-tile - tile ?right-tile - tile)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (right ?current-tile ?right-tile) 
      (clear ?right-tile)
    )
    :effect (and 
      (robot-at ?r ?right-tile) 
      (not (robot-at ?r ?current-tile)) 
      (not (clear ?right-tile)) 
      (clear ?current-tile) 
      (increase (total-cost) 1)
    )
  )
  
  (:action left
    :parameters (?r - robot ?current-tile - tile ?left-tile - tile)
    :precondition (and 
      (robot-at ?r ?current-tile) 
      (left ?current-tile ?left-tile) 
      (clear ?left-tile)
    )
    :effect (and 
      (robot-at ?r ?left-tile) 
      (not (robot-at ?r ?current-tile)) 
      (not (clear ?left-tile)) 
      (clear ?current-tile) 
      (increase (total-cost) 1)
    )
  )
)