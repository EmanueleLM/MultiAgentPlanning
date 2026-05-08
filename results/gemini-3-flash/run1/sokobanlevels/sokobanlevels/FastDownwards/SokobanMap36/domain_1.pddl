(define (domain sokoban_map36_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (adj_left ?l1 ?l2 - location)
  )

  (:action move_l
    :parameters (?from - location ?to - location)
    :precondition (and (at_player ?from) (adj_left ?to ?from) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action move_r
    :parameters (?from - location ?to - location)
    :precondition (and (at_player ?from) (adj_left ?from ?to) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push_l
    :parameters (?p_from - location ?b_from - location ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adj_left ?b_from ?p_from) (adj_left ?b_to ?b_from) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )

  (:action push_r
    :parameters (?p_from - location ?b_from - location ?b_to - location)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adj_left ?p_from ?b_from) (adj_left ?b_from ?b_to) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (not (at_box ?b_from)) (at_box ?b_to) (clear ?p_from) (not (clear ?b_to)))
  )
)