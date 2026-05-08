(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    player box location)
  (:predicates 
    (at ?p - player ?loc - location)
    (box_at ?b - box ?loc - location)
    (goal ?loc - location)
    (clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location))
  (:action move
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and 
      (at ?p ?from)
      (adjacent ?from ?to)
      (clear ?to))
    :effect (and 
      (not (at ?p ?from))
      (at ?p ?to)))
  (:action push
    :parameters (?p - player ?b - box ?from - location ?to - location ?next - location)
    :precondition (and 
      (at ?p ?from)
      (box_at ?b ?to)
      (adjacent ?from ?to)
      (adjacent ?to ?next)
      (clear ?next))
    :effect (and 
      (not (box_at ?b ?to))
      (box_at ?b ?next)
      (not (at ?p ?from))
      (at ?p ?to)))
)