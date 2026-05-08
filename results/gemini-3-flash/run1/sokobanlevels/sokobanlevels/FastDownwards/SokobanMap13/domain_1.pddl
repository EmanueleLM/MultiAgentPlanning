(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at-player ?l - location)
    (at-box ?l - location)
    (is-empty ?l - location)
    (adjacent ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at-player ?from) (adjacent ?from ?to) (is-empty ?to))
    :effect (and (not (at-player ?from)) (at-player ?to) (is-empty ?from) (not (is-empty ?to)))
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at-player ?p_from) (at-box ?b_from) (adjacent ?p_from ?b_from) (adjacent ?b_from ?b_to) (is-empty ?b_to))
    :effect (and (not (at-player ?p_from)) (at-player ?b_from) (is-empty ?p_from) (not (at-box ?b_from)) (at-box ?b_to) (not (is-empty ?b_to)))
  )
)