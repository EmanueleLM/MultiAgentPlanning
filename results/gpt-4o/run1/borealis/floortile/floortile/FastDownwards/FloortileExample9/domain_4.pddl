(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  (:predicates 
    (robot_at ?r - robot ?t - tile)
    (robot_has ?r - robot ?c - color)
    (available_color ?c - color)
    (clear ?t - tile)
    (painted ?t - tile ?c - color)
    (adjacent ?t1 ?t2 - tile)
  )
  (:functions (total-cost))

  (:action change_color
    :parameters (?r - robot ?c_old - color ?c_new - color)
    :precondition (and (robot_has ?r ?c_old) (available_color ?c_new) (not (= ?c_old ?c_new)))
    :effect (and (not (robot_has ?r ?c_old)) (robot_has ?r ?c_new) (increase (total-cost) 5))
  )

  (:action paint_up
    :parameters (?r - robot ?t_curr - tile ?t_up - tile ?c - color)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_curr ?t_up) (robot_has ?r ?c) (clear ?t_up))
    :effect (and (painted ?t_up ?c) (not (clear ?t_up)) (increase (total-cost) 2))
  )

  (:action paint_down
    :parameters (?r - robot ?t_curr - tile ?t_down - tile ?c - color)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_down ?t_curr) (robot_has ?r ?c) (clear ?t_down))
    :effect (and (painted ?t_down ?c) (not (clear ?t_down)) (increase (total-cost) 2))
  )

  (:action move_up
    :parameters (?r - robot ?t_curr - tile ?t_up - tile)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_curr ?t_up) (clear ?t_up))
    :effect (and (robot_at ?r ?t_up) (clear ?t_curr) (not (robot_at ?r ?t_curr)) (not (clear ?t_up)) (increase (total-cost) 1))
  )

  (:action move_down
    :parameters (?r - robot ?t_curr - tile ?t_down - tile)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_down ?t_curr) (clear ?t_down))
    :effect (and (robot_at ?r ?t_down) (clear ?t_curr) (not (robot_at ?r ?t_curr)) (not (clear ?t_down)) (increase (total-cost) 1))
  )

  (:action move_right
    :parameters (?r - robot ?t_curr - tile ?t_right - tile)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_curr ?t_right) (clear ?t_right))
    :effect (and (robot_at ?r ?t_right) (clear ?t_curr) (not (robot_at ?r ?t_curr)) (not (clear ?t_right)) (increase (total-cost) 1))
  )

  (:action move_left
    :parameters (?r - robot ?t_curr - tile ?t_left - tile)
    :precondition (and (robot_at ?r ?t_curr) (adjacent ?t_left ?t_curr) (clear ?t_left))
    :effect (and (robot_at ?r ?t_left) (clear ?t_curr) (not (robot_at ?r ?t_curr)) (not (clear ?t_left)) (increase (total-cost) 1))
  )
)