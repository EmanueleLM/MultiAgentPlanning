(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location)
  (:predicates
    (at-player ?l - location)
    (at-box ?l - location)
    (adj ?l1 ?l2 - location)
  )
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at-player ?from) (adj ?from ?to) (not (at-box ?to)))
    :effect (and (not (at-player ?from)) (at-player ?to))
  )
  (:action push
    :parameters (?p_loc ?b_from ?b_to - location)
    :precondition (and (at-player ?p_loc) (at-box ?b_from) (adj ?p_loc ?b_from) (adj ?b_from ?b_to) (not (at-box ?b_to)))
    :effect (and (not (at-player ?p_loc)) (at-player ?b_from) (not (at-box ?b_from)) (at-box ?b_to))
  )
)