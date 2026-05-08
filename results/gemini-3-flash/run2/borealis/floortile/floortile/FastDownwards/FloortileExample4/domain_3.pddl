(define (domain floor-tile)
  (:requirements :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?to - tile ?from - tile)
    (down ?to - tile ?from - tile)
    (right ?to - tile ?from - tile)
    (left ?to - tile ?from - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old - color ?new - color)
    :precondition (and (robot-has ?r ?old) (available-color ?new))
    :effect (and 
      (not (robot-has ?r ?old)) 
      (robot-has ?r ?new) 
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?x) 
      (up ?y ?x) 
      (robot-has ?r ?c) 
      (clear ?y)
    )
    :effect (and 
      (not (clear ?y)) 
      (painted ?y ?c) 
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?x) 
      (down ?y ?x) 
      (robot-has ?r ?c) 
      (clear ?y)
    )
    :effect (and 
      (not (clear ?y)) 
      (painted ?y ?c) 
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?to - tile ?from - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (up ?to ?from) 
      (clear ?to)
    )
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (not (clear ?to)) 
      (clear ?from) 
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?to - tile ?from - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (down ?to ?from) 
      (clear ?to)
    )
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (not (clear ?to)) 
      (clear ?from) 
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?to - tile ?from - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (right ?to ?from) 
      (clear ?to)
    )
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (not (clear ?to)) 
      (clear ?from) 
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?to - tile ?from - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (left ?to ?from) 
      (clear ?to)
    )
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (not (clear ?to)) 
      (clear ?from) 
      (increase (total-cost) 1)
    )
  )
)