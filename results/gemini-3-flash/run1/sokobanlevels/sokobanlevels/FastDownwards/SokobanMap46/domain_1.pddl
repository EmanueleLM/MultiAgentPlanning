(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_empty ?l - location)
    (adjacent ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (adjacent ?from ?to) (is_empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (is_empty ?from) (not (is_empty ?to)))
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adjacent ?p_from ?b_from) (adjacent ?b_from ?b_to) (is_empty ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (is_empty ?p_from) (not (is_empty ?b_to)))
  )
)