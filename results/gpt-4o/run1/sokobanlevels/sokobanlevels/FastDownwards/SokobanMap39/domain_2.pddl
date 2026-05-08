(define (domain sokoban)
  (:requirements :strips :typing)
  (:types agent box goal location)
  (:predicates
    (at-agent ?a - agent ?l - location)
    (at-box ?b - box ?l - location)
    (is-goal ?l - location)
    (adjacent ?l1 - location ?l2 - location)
    (is-empty ?l - location)
  )
  
  (:action move-player
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (at-agent ?p ?from) (adjacent ?from ?to) (is-empty ?to))
    :effect (and (not (at-agent ?p ?from)) (at-agent ?p ?to))
  )
  
  (:action push-box
    :parameters (?p - agent ?b - box ?from - location ?box-loc - location ?to - location)
    :precondition (and (at-agent ?p ?from) (at-box ?b ?box-loc) (adjacent ?from ?box-loc) (adjacent ?box-loc ?to) (is-empty ?to))
    :effect (and (not (at-box ?b ?box-loc)) (at-box ?b ?to) (not (at-agent ?p ?from)) (at-agent ?p ?box-loc))
  )
)