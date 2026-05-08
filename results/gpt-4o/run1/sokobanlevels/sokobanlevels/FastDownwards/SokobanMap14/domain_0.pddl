(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types movable static - object
          player box - movable
          wall goal - static
          position)
  (:predicates
    (at ?entity - movable ?pos - position)
    (adjacent ?pos1 ?pos2 - position)
    (clear ?pos - position)
    (goal ?pos - position)
    (box_at_goal ?box - box ?goal - goal))
  
  (:action move_left
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2)))

  (:action move_right
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2)))

  (:action move_up
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2)))

  (:action move_down
    :parameters (?p1 ?p2 - position)
    :precondition (and (at player ?p1) (adjacent ?p1 ?p2) (clear ?p2))
    :effect (and (not (at player ?p1)) (at player ?p2)))

  (:action push_left
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at player ?p1) (at box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at player ?p1)) (not (at box ?p2)) (at player ?p2) (at box ?p3)))

  (:action push_right
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at player ?p1) (at box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at player ?p1)) (not (at box ?p2)) (at player ?p2) (at box ?p3)))

  (:action push_up
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at player ?p1) (at box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at player ?p1)) (not (at box ?p2)) (at player ?p2) (at box ?p3)))

  (:action push_down
    :parameters (?p1 ?p2 ?p3 - position)
    :precondition (and (at player ?p1) (at box ?p2) (adjacent ?p1 ?p2) (adjacent ?p2 ?p3) (clear ?p3))
    :effect (and (not (at player ?p1)) (not (at box ?p2)) (at player ?p2) (at box ?p3)))
)