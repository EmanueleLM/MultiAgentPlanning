(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (painted ?t - tile ?c - color)
    (adjacent ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?new - color ?old - color)
    :precondition (and 
      (robot-has ?r ?old) 
      (not (= ?new ?old)))
    :effect (and 
      (not (robot-has ?r ?old)) 
      (robot-has ?r ?new) 
      (increase (total-cost) 5))
  )

  (:action paint-up
    :parameters (?r - robot ?from - tile ?to - tile ?c - color)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent ?from ?to) 
      (robot-has ?r ?c)
      (not (painted ?to ?c)))
    :effect (and 
      (painted ?to ?c) 
      (increase (total-cost) 2))
  )

  (:action move
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and 
      (robot-at ?r ?from) 
      (adjacent ?from ?to) 
      (not (painted ?to ?c)))
    :effect (and 
      (not (robot-at ?r ?from)) 
      (robot-at ?r ?to) 
      (increase (total-cost) 1))
  )
)