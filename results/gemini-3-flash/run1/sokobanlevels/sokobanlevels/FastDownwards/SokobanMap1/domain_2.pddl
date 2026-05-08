(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (adj ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (adj ?from ?to) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adj ?p_from ?b_from) (adj ?b_from ?b_to) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?b_from) (not (clear ?b_to)))
  )
)