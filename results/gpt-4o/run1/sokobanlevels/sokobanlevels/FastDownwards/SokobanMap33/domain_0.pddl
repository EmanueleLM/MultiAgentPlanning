(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    entity 
    player - entity 
    box - entity 
    goal - entity
    wall - entity
    space - entity
    position)
  
  (:predicates
    (at ?e - entity ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (goal ?p - position)
    (empty ?p - position)
    (movable ?p - position))

  (:action move_left
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to)))

  (:action move_right
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to)))

  (:action move_up
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to)))

  (:action move_down
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to)))

  (:action push_left
    :parameters (?p - player ?b - box ?from - position ?box_from - position ?box_to - position)
    :precondition (and (at ?p ?from) (at ?b ?box_from) (adjacent ?from ?box_from) (adjacent ?box_from ?box_to) (empty ?box_to))
    :effect (and (not (at ?p ?from)) (not (at ?b ?box_from)) (at ?p ?box_from) (at ?b ?box_to)))

  (:action push_right
    :parameters (?p - player ?b - box ?from - position ?box_from - position ?box_to - position)
    :precondition (and (at ?p ?from) (at ?b ?box_from) (adjacent ?from ?box_from) (adjacent ?box_from ?box_to) (empty ?box_to))
    :effect (and (not (at ?p ?from)) (not (at ?b ?box_from)) (at ?p ?box_from) (at ?b ?box_to)))

  (:action push_up
    :parameters (?p - player ?b - box ?from - position ?box_from - position ?box_to - position)
    :precondition (and (at ?p ?from) (at ?b ?box_from) (adjacent ?from ?box_from) (adjacent ?box_from ?box_to) (empty ?box_to))
    :effect (and (not (at ?p ?from)) (not (at ?b ?box_from)) (at ?p ?box_from) (at ?b ?box_to)))

  (:action push_down
    :parameters (?p - player ?b - box ?from - position ?box_from - position ?box_to - position)
    :precondition (and (at ?p ?from) (at ?b ?box_from) (adjacent ?from ?box_from) (adjacent ?box_from ?box_to) (empty ?box_to))
    :effect (and (not (at ?p ?from)) (not (at ?b ?box_from)) (at ?p ?box_from) (at ?b ?box_to)))
)