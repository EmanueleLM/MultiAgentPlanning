(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box location)
  
  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (goal_location ?l - location)
    (adjacent ?l1 ?l2 - location)
    (clear ?l - location)
  )
  
  (:action move_left
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_to))
  )
  
  (:action move_right
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_to))
  )
  
  (:action move_up
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_to))
  )
  
  (:action move_down
    :parameters (?p - player ?l_from ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_to))
  )
  
  (:action push_left
    :parameters (?p - player ?b - box ?l_from ?l_box ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_box) (at_box ?b ?l_box) (adjacent ?l_box ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_box) (not (at_box ?b ?l_box)) (at_box ?b ?l_to))
  )
  
  (:action push_right
    :parameters (?p - player ?b - box ?l_from ?l_box ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_box) (at_box ?b ?l_box) (adjacent ?l_box ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_box) (not (at_box ?b ?l_box)) (at_box ?b ?l_to))
  )
  
  (:action push_up
    :parameters (?p - player ?b - box ?l_from ?l_box ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_box) (at_box ?b ?l_box) (adjacent ?l_box ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_box) (not (at_box ?b ?l_box)) (at_box ?b ?l_to))
  )
  
  (:action push_down
    :parameters (?p - player ?b - box ?l_from ?l_box ?l_to - location)
    :precondition (and (at_player ?p ?l_from) (adjacent ?l_from ?l_box) (at_box ?b ?l_box) (adjacent ?l_box ?l_to) (clear ?l_to))
    :effect (and (not (at_player ?p ?l_from)) (at_player ?p ?l_box) (not (at_box ?b ?l_box)) (at_box ?b ?l_to))
  )
)