(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_empty ?l - location)
    (next ?l1 ?l2 - location)
  )

  (:action move_up
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (next ?to ?from) (is_empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (is_empty ?from) (not (is_empty ?to)))
  )

  (:action move_down
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (next ?from ?to) (is_empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (is_empty ?from) (not (is_empty ?to)))
  )

  (:action push_up
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (is_empty ?b_to) (next ?b_from ?p_from) (next ?b_to ?b_from))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (is_empty ?p_from) (not (is_empty ?b_to)))
  )

  (:action push_down
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (is_empty ?b_to) (next ?p_from ?b_from) (next ?b_from ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (is_empty ?p_from) (not (is_empty ?b_to)))
  )
)