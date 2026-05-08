(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (adjacent ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from ?to - location ?d - direction)
    :precondition (and (at_player ?from) (adjacent ?from ?to ?d) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - location ?d - direction)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adjacent ?p_from ?b_from ?d) (adjacent ?b_from ?b_to ?d) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?b_from) (not (clear ?b_to)))
  )
)