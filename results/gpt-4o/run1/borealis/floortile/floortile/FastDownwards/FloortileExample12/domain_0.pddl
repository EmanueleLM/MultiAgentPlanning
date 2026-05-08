(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (adjacent-up ?from ?to - tile)
    (adjacent-down ?from ?to - tile)
    (adjacent-right ?from ?to - tile)
    (adjacent-left ?from ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?new - color ?old - color)
    :precondition (and 
      (robot-has ?r ?old) 
      (available-color ?new))
    :effect (and 
      (not (robot-has ?r ?old)) 
      (robot-has ?r ?new) 
      (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?t - tile ?above - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?t) 
      (adjacent-up ?t ?above) 
      (clear ?above) 
      (robot-has ?r ?c))
    :effect (and 
      (not (clear ?above)) 
      (painted ?above ?c) 
      (increase (total-cost) 2))
  )

  (:action paint-down
    :parameters (?r - robot ?t - tile ?below - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?t) 
      (adjacent-down ?t ?below) 
      (clear ?below) 
      (robot-has ?r ?c))
    :effect (and 
      (not (clear ?below)) 
      (painted ?below ?c) 
      (increase (total-cost) 2))
  )

  (:action move-up
    :parameters (?r - robot ?from ?to - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent-up ?from ?to) 
      (clear ?to))
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (clear ?from) 
      (not (clear ?to)) 
      (increase (total-cost) 3))
  )

  (:action move-down
    :parameters (?r - robot ?from ?to - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent-down ?from ?to) 
      (clear ?to))
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (clear ?from) 
      (not (clear ?to)) 
      (increase (total-cost) 1))
  )

  (:action move-right
    :parameters (?r - robot ?from ?to - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent-right ?from ?to) 
      (clear ?to))
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (clear ?from) 
      (not (clear ?to)) 
      (increase (total-cost) 1))
  )

  (:action move-left
    :parameters (?r - robot ?from ?to - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent-left ?from ?to) 
      (clear ?to))
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (clear ?from) 
      (not (clear ?to)) 
      (increase (total-cost) 1))
  )
)