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
    :parameters (?from - location ?to - location ?d - direction)
    :precondition (and (at_player ?from) (adjacent ?from ?to ?d) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?p_loc - location ?b_loc - location ?t_loc - location ?d - direction)
    :precondition (and (at_player ?p_loc) (at_box ?b_loc) (adjacent ?p_loc ?b_loc ?d) (adjacent ?b_loc ?t_loc ?d) (clear ?t_loc))
    :effect (and (not (at_player ?p_loc)) (at_player ?b_loc) (not (at_box ?b_loc)) (at_box ?t_loc) (clear ?b_loc) (not (clear ?t_loc)))
  )
)