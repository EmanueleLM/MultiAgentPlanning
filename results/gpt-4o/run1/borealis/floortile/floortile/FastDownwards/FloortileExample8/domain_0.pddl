(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types 
    robot tile color)
  (:predicates
    (robot_at ?r - robot ?t - tile)
    (robot_has ?r - robot ?c - color)
    (available_color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (adjacent ?t1 - tile ?t2 - tile))
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?old - color ?new - color)
    :precondition (and 
      (robot_has ?r ?old) 
      (available_color ?new))
    :effect (and 
      (not (robot_has ?r ?old)) 
      (robot_has ?r ?new) 
      (increase (total-cost) 5)))

  (:action paint-up
    :parameters (?r - robot ?t_current - tile ?t_above - tile ?c - color)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_above) 
      (robot_has ?r ?c) 
      (adjacent ?t_current ?t_above))
    :effect (and 
      (not (clear ?t_above)) 
      (painted ?t_above ?c) 
      (increase (total-cost) 2)))

  (:action paint-down
    :parameters (?r - robot ?t_current - tile ?t_below - tile ?c - color)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_below) 
      (robot_has ?r ?c) 
      (adjacent ?t_current ?t_below))
    :effect (and 
      (not (clear ?t_below)) 
      (painted ?t_below ?c) 
      (increase (total-cost) 2)))

  (:action move-up
    :parameters (?r - robot ?t_current - tile ?t_above - tile)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_above) 
      (adjacent ?t_current ?t_above))
    :effect (and 
      (robot_at ?r ?t_above) 
      (clear ?t_current) 
      (not (clear ?t_above)) 
      (increase (total-cost) 3)))

  (:action move-down
    :parameters (?r - robot ?t_current - tile ?t_below - tile)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_below) 
      (adjacent ?t_current ?t_below))
    :effect (and 
      (robot_at ?r ?t_below) 
      (clear ?t_current) 
      (not (clear ?t_below)) 
      (increase (total-cost) 1)))

  (:action move-right
    :parameters (?r - robot ?t_current - tile ?t_right - tile)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_right) 
      (adjacent ?t_current ?t_right))
    :effect (and 
      (robot_at ?r ?t_right) 
      (clear ?t_current) 
      (not (clear ?t_right)) 
      (increase (total-cost) 1)))

  (:action move-left
    :parameters (?r - robot ?t_current - tile ?t_left - tile)
    :precondition (and 
      (robot_at ?r ?t_current) 
      (clear ?t_left) 
      (adjacent ?t_current ?t_left))
    :effect (and 
      (robot_at ?r ?t_left) 
      (clear ?t_current) 
      (not (clear ?t_left)) 
      (increase (total-cost) 1)))
)