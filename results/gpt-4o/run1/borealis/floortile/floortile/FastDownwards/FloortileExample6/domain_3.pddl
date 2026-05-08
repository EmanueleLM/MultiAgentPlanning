(define (domain floor-tile)
  (:requirements :strips :typing :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (available-color ?c - color)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old-c - color ?new-c - color)
    :precondition (and 
      (robot-has ?r ?old-c) 
      (available-color ?new-c) 
      (not (= ?old-c ?new-c)))
    :effect (and
      (not (robot-has ?r ?old-c))
      (robot-has ?r ?new-c)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?t - tile ?u - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?t)
      (robot-has ?r ?c)
      (up ?u ?t)
      (clear ?u)
    )
    :effect (and
      (not (clear ?u))
      (painted ?u ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?t - tile ?d - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?t)
      (robot-has ?r ?c)
      (down ?d ?t)
      (clear ?d)
    )
    :effect (and
      (not (clear ?d))
      (painted ?d ?c)
      (increase (total-cost) 2)
    )
  )

  (:action move-up
    :parameters (?r - robot ?from-t - tile ?to-t - tile)
    :precondition (and 
      (robot-at ?r ?from-t)
      (clear ?to-t)
      (up ?from-t ?to-t)
    )
    :effect (and
      (robot-at ?r ?to-t)
      (not (robot-at ?r ?from-t))
      (clear ?from-t)
      (not (clear ?to-t))
      (increase (total-cost) 3)
    )
  )

  (:action move-down
    :parameters (?r - robot ?from-t - tile ?to-t - tile)
    :precondition (and 
      (robot-at ?r ?from-t)
      (clear ?to-t)
      (down ?from-t ?to-t)
    )
    :effect (and
      (robot-at ?r ?to-t)
      (not (robot-at ?r ?from-t))
      (clear ?from-t)
      (not (clear ?to-t))
      (increase (total-cost) 1)
    )
  )

  (:action move-right
    :parameters (?r - robot ?from-t - tile ?to-t - tile)
    :precondition (and 
      (robot-at ?r ?from-t)
      (clear ?to-t)
      (right ?from-t ?to-t)
    )
    :effect (and
      (robot-at ?r ?to-t)
      (not (robot-at ?r ?from-t))
      (clear ?from-t)
      (not (clear ?to-t))
      (increase (total-cost) 1)
    )
  )

  (:action move-left
    :parameters (?r - robot ?from-t - tile ?to-t - tile)
    :precondition (and 
      (robot-at ?r ?from-t)
      (clear ?to-t)
      (left ?from-t ?to-t)
    )
    :effect (and
      (robot-at ?r ?to-t)
      (not (robot-at ?r ?from-t))
      (clear ?from-t)
      (not (clear ?to-t))
      (increase (total-cost) 1)
    )
  )
)