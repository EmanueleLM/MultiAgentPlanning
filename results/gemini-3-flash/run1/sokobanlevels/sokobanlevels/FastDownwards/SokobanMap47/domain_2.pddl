(define (domain sokoban_map_47)
  (:requirements :strips :typing)
  (:types location box)
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (adjacent ?l1 ?l2 - location)
    (clear ?l - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?p_from ?b_loc ?b_to - location ?b - box)
    :precondition (and (at_player ?p_from) (at_box ?b ?b_loc) (adjacent ?p_from ?b_loc) (adjacent ?b_loc ?b_to) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_loc) (not (at_box ?b ?b_loc)) (at_box ?b ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )
)