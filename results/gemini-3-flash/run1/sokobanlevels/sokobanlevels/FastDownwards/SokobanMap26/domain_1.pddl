(define (domain sokoban_map_26)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from - location ?to - location ?dir - direction)
    :precondition (and (at_player ?from) (adj ?from ?to ?dir) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?p_from - location ?b_from - location ?b_to - location ?dir - direction)
    :precondition (and (at_player ?p_from) (adj ?p_from ?b_from ?dir) (at_box ?b_from) (adj ?b_from ?b_to ?dir) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?b_from) (not (clear ?b_to)))
  )
)