(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types
    loc dir
  )
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (clear ?l - loc)
    (adj ?l1 ?l2 - loc ?d - dir)
  )
  (:action move
    :parameters (?from - loc ?to - loc ?d - dir)
    :precondition (and
      (at_player ?from)
      (adj ?from ?to ?d)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )
  (:action push
    :parameters (?p_from - loc ?b_from - loc ?b_to - loc ?d - dir)
    :precondition (and
      (at_player ?p_from)
      (adj ?p_from ?b_from ?d)
      (at_box ?b_from)
      (adj ?b_from ?b_to ?d)
      (clear ?b_to)
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
      (clear ?b_from)
      (not (clear ?b_to))
    )
  )
)