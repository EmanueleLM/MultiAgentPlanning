(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box goal location)
  (:predicates
    (at ?a - agent ?l - location)
    (at ?b - box ?l - location)
    (is-goal ?l - location)
    (adjacent ?l1 - location ?l2 - location)
    (is-empty ?l - location)
  )

  (:action move_player
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (is-empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action push_box
    :parameters (?p - agent ?b - box ?from - location ?box_loc - location ?to - location)
    :precondition (and (at ?p ?from) (at ?b ?box_loc) (adjacent ?from ?box_loc) (adjacent ?box_loc ?to) (is-empty ?to))
    :effect (and (not (at ?b ?box_loc)) (at ?b ?to) (not (at ?p ?from)) (at ?p ?box_loc))
  )
)