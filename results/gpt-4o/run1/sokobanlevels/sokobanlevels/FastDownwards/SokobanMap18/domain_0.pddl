(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity location)
  (:predicates
    (at ?e - entity ?l - location)
    (goal ?l - location)
    (clear ?l - location)
    (adjacent ?l1 - location ?l2 - location)
  )
  
  (:action move
    :parameters (?p - entity ?from - location ?to - location)
    :precondition (and (at ?p ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (clear ?from) (not (clear ?to)))
  )
  
  (:action push
    :parameters (?p - entity ?b - entity ?from - location ?to - location ?next - location)
    :precondition (and (at ?p ?from) (at ?b ?to) (clear ?next) (adjacent ?from ?to) (adjacent ?to ?next))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (at ?b ?to)) (at ?b ?next) (clear ?from) (not (clear ?next)))
  )
)