(define (domain sokoban)
  (:requirements :strips :typing)
  (:types loc dir)
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (adj ?l1 ?l2 - loc ?d - dir)
    (clear ?l - loc)
  )

  (:action move
    :parameters (?from ?to - loc ?d - dir)
    :precondition (and (at_player ?from) (adj ?from ?to ?d) (clear ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - loc ?d - dir)
    :precondition (and (at_player ?p_from) (at_box ?b_from) (adj ?p_from ?b_from ?d) (adj ?b_from ?b_to ?d) (clear ?b_to))
    :effect (and (not (at_player ?p_from)) (at_player ?b_from) (clear ?p_from) (not (at_box ?b_from)) (at_box ?b_to) (not (clear ?b_to)))
  )
)