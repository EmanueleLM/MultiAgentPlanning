(define (domain sokoban)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    entity 
    player - entity
    box - entity
    location)

  (:predicates 
    (at_player ?loc - location)
    (at_box ?box - box ?loc - location)
    (box_at_goal ?box - box ?goal - location)
    (clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location))

  (:action move_right
    :parameters (?p1 - location ?p2 - location)
    :precondition (and 
      (at_player ?p1)
      (adjacent ?p1 ?p2)
      (clear ?p2))
    :effect (and 
      (not (at_player ?p1))
      (at_player ?p2)))

  (:action move_left
    :parameters (?p1 - location ?p2 - location)
    :precondition (and 
      (at_player ?p1)
      (adjacent ?p2 ?p1)
      (clear ?p2))
    :effect (and 
      (not (at_player ?p1))
      (at_player ?p2)))

  (:action push_right
    :parameters (?p1 - location ?p2 - location ?p3 - location ?b - box)
    :precondition (and 
      (at_player ?p1)
      (at_box ?b ?p2)
      (adjacent ?p1 ?p2)
      (adjacent ?p2 ?p3)
      (clear ?p3))
    :effect (and 
      (not (at_box ?b ?p2))
      (at_box ?b ?p3)
      (not (at_player ?p1))
      (at_player ?p2)))

  (:action push_left
    :parameters (?p1 - location ?p2 - location ?p3 - location ?b - box)
    :precondition (and 
      (at_player ?p1)
      (at_box ?b ?p2)
      (adjacent ?p2 ?p1)
      (adjacent ?p3 ?p2)
      (clear ?p3))
    :effect (and 
      (not (at_box ?b ?p2))
      (at_box ?b ?p3)
      (not (at_player ?p1))
      (at_player ?p2)))
)