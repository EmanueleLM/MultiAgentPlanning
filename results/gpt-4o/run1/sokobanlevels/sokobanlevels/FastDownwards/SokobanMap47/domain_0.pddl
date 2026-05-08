(define (domain sokoban)

  (:requirements :strips :typing :negative-preconditions)

  (:types 
    entity 
    player - entity
    box - entity
    location)

  (:predicates 
    (at ?entity - entity ?loc - location)
    (box-at-goal ?box - box ?goal - location)
    (clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (wall ?loc - location))

  (:action move_right
    :parameters (?p1 - location ?p2 - location)
    :precondition (and 
      (at player ?p1)
      (adjacent ?p1 ?p2)
      (clear ?p2))
    :effect (and 
      (not (at player ?p1))
      (at player ?p2)))

  (:action move_left
    :parameters (?p1 - location ?p2 - location)
    :precondition (and 
      (at player ?p1)
      (adjacent ?p2 ?p1)
      (clear ?p2))
    :effect (and 
      (not (at player ?p1))
      (at player ?p2)))

  (:action push_right
    :parameters (?p1 - location ?p2 - location ?p3 - location)
    :precondition (and 
      (at player ?p1)
      (at box ?p2)
      (adjacent ?p1 ?p2)
      (adjacent ?p2 ?p3)
      (clear ?p3))
    :effect (and 
      (not (at box ?p2))
      (at box ?p3)
      (not (at player ?p1))
      (at player ?p2)))

  (:action push_left
    :parameters (?p1 - location ?p2 - location ?p3 - location)
    :precondition (and 
      (at player ?p1)
      (at box ?p2)
      (adjacent ?p2 ?p1)
      (adjacent ?p3 ?p2)
      (clear ?p3))
    :effect (and 
      (not (at box ?p2))
      (at box ?p3)
      (not (at player ?p1))
      (at player ?p2)))
)