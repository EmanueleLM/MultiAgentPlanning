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
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (and (robot-has ?r ?c2) (available-color ?c) (not (= ?c ?c2)))
    :effect (and
      (not (robot-has ?r ?c2))
      (robot-has ?r ?c)
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
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and 
      (robot-at ?r ?t2)
      (clear ?t1)
      (up ?t1 ?t2)
    )
    :effect (and
      (robot-at ?r ?t1)
      (not (robot-at ?r ?t2))
      (clear ?t2)
      (not (clear ?t1))
      (increase (total-cost) 3)
    )
  )

  (:action move-down
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and 
      (robot-at ?r ?t2)
      (clear ?t1)
      (down ?t1 ?t2)
    )
    :effect (and
      (robot-at ?r ?t1)
      (not (robot-at ?r ?t2))
      (clear ?t2)
      (not (clear ?t1))
      (increase (total-cost) 1)
    )
  )

  (:action move-right
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and 
      (robot-at ?r ?t2)
      (clear ?t1)
      (right ?t1 ?t2)
    )
    :effect (and
      (robot-at ?r ?t1)
      (not (robot-at ?r ?t2))
      (clear ?t2)
      (not (clear ?t1))
      (increase (total-cost) 1)
    )
  )

  (:action move-left
    :parameters (?r - robot ?t1 - tile ?t2 - tile)
    :precondition (and 
      (robot-at ?r ?t2)
      (clear ?t1)
      (left ?t1 ?t2)
    )
    :effect (and
      (robot-at ?r ?t1)
      (not (robot-at ?r ?t2))
      (clear ?t2)
      (not (clear ?t1))
      (increase (total-cost) 1)
    )
  )
)