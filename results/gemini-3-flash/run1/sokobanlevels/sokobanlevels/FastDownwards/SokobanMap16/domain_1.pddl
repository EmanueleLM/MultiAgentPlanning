(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (can_move ?l1 ?l2 - location ?d - direction)
    (clear ?l - location)
  )

  (:action move
    :parameters (?from - location ?to - location ?d - direction)
    :precondition (and (at_player ?from) (can_move ?from ?to ?d) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?p_from - location ?b_from - location ?b_to - location ?d - direction)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (can_move ?p_from ?b_from ?d) (can_move ?b_from ?b_to ?d) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )
)