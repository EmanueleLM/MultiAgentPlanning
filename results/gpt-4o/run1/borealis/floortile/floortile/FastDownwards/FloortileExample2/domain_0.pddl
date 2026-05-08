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
    :precondition (and (robot-has ?r ?c1) (available-color ?c2))
    :effect (and 
      (not (robot-has ?r ?c1)) 
      (robot-has ?r ?c2) 
      (increase (total-cost) 5)
    )
  )
  
  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (up ?y ?x) (robot-has ?r ?c) (clear ?y))
    :effect (and 
      (painted ?y ?c) 
      (not (clear ?y)) 
      (increase (total-cost) 2)
    )
  )
  
  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (down ?y ?x) (robot-has ?r ?c) (clear ?y))
    :effect (and 
      (painted ?y ?c) 
      (not (clear ?y)) 
      (increase (total-cost) 2)
    )
  )
  
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (up ?y ?x) (clear ?y))
    :effect (and 
      (robot-at ?r ?y) 
      (clear ?x) 
      (not (clear ?y)) 
      (increase (total-cost) 3)
    )
  )
  
  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (down ?y ?x) (clear ?y))
    :effect (and 
      (robot-at ?r ?y) 
      (clear ?x) 
      (not (clear ?y)) 
      (increase (total-cost) 1)
    )
  )
  
  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (right ?y ?x) (clear ?y))
    :effect (and 
      (robot-at ?r ?y) 
      (clear ?x) 
      (not (clear ?y)) 
      (increase (total-cost) 1)
    )
  )
  
  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?x) (left ?y ?x) (clear ?y))
    :effect (and 
      (robot-at ?r ?y) 
      (clear ?x) 
      (not (clear ?y)) 
      (increase (total-cost) 1)
    )
  )
)