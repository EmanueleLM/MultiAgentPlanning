(define (domain sokoban)
  (:requirements :strips :typing)
  
  (:types position mobile_entity)
  
  (:constants player box - mobile_entity)
  
  (:predicates
    (at ?e - mobile_entity ?p - position)
    (adjacent ?p1 ?p2 - position)
    (empty ?p - position)
    (goal_at ?p - position)
  )
  
  (:action move_left
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (empty ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2) (empty ?p1) (not (empty ?p2)))
  )

  (:action move_right
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (empty ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2) (empty ?p1) (not (empty ?p2)))
  )

  (:action move_up
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (empty ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2) (empty ?p1) (not (empty ?p2)))
  )

  (:action move_down
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (empty ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2) (empty ?p1) (not (empty ?p2)))
  )

  (:action push_left
    :parameters (?p_player ?p_box ?p_new_box - position)
    :precondition (and (at player ?p_player) (at box ?p_box) (adjacent ?p_player ?p_box) 
                       (adjacent ?p_box ?p_new_box) (empty ?p_new_box))
    :effect (and (not (at player ?p_player)) (at player ?p_box) 
                 (not (at box ?p_box)) (at box ?p_new_box)
                 (empty ?p_player) (not (empty ?p_new_box)))
  )

  (:action push_right
    :parameters (?p_player ?p_box ?p_new_box - position)
    :precondition (and (at player ?p_player) (at box ?p_box) (adjacent ?p_player ?p_box)
                       (adjacent ?p_box ?p_new_box) (empty ?p_new_box))
    :effect (and (not (at player ?p_player)) (at player ?p_box)
                 (not (at box ?p_box)) (at box ?p_new_box)
                 (empty ?p_player) (not (empty ?p_new_box)))
  )

  (:action push_up
    :parameters (?p_player ?p_box ?p_new_box - position)
    :precondition (and (at player ?p_player) (at box ?p_box) (adjacent ?p_player ?p_box)
                       (adjacent ?p_box ?p_new_box) (empty ?p_new_box))
    :effect (and (not (at player ?p_player)) (at player ?p_box)
                 (not (at box ?p_box)) (at box ?p_new_box)
                 (empty ?p_player) (not (empty ?p_new_box)))
  )

  (:action push_down
    :parameters (?p_player ?p_box ?p_new_box - position)
    :precondition (and (at player ?p_player) (at box ?p_box) (adjacent ?p_player ?p_box)
                       (adjacent ?p_box ?p_new_box) (empty ?p_new_box))
    :effect (and (not (at player ?p_player)) (at player ?p_box)
                 (not (at box ?p_box)) (at box ?p_new_box)
                 (empty ?p_player) (not (empty ?p_new_box)))
  )
)