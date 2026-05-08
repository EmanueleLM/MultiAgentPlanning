(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (painted ?t - tile ?c - color)
    (clear ?t - tile)
    (up ?t1 ?t2 - tile)
    (down ?t1 ?t2 - tile)
    (right ?t1 ?t2 - tile)
    (left ?t1 ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and (robot-has ?r ?c) (available-color ?c2))
    :effect (and 
      (not (robot-has ?r ?c)) 
      (robot-has ?r ?c2) 
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (robot-has ?r ?c) (up ?y ?x) (clear ?y))
    :effect (and 
      (not (clear ?y)) 
      (painted ?y ?c) 
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and (robot-at ?r ?x) (robot-has ?r ?c) (down ?y ?x) (clear ?y))
    :effect (and 
      (not (clear ?y)) 
      (painted ?y ?c) 
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (up ?x ?y) (clear ?x))
    :effect (and 
      (not (robot-at ?r ?y)) 
      (robot-at ?r ?x) 
      (not (clear ?x)) 
      (clear ?y) 
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (down ?x ?y) (clear ?x))
    :effect (and 
      (not (robot-at ?r ?y)) 
      (robot-at ?r ?x) 
      (not (clear ?x)) 
      (clear ?y) 
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (right ?x ?y) (clear ?x))
    :effect (and 
      (not (robot-at ?r ?y)) 
      (robot-at ?r ?x) 
      (not (clear ?x)) 
      (clear ?y) 
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (and (robot-at ?r ?y) (left ?x ?y) (clear ?x))
    :effect (and 
      (not (robot-at ?r ?y)) 
      (robot-at ?r ?x) 
      (not (clear ?x)) 
      (clear ?y) 
      (increase (total-cost) 1)
    )
  )
)