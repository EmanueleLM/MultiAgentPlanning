(define (domain sokoban_map_18)
  (:requirements :strips :typing)
  (:types
    pos dir
  )
  (:predicates
    (at_player ?p - pos)
    (at_box ?p - pos)
    (clear ?p - pos)
    (adj ?p1 ?p2 - pos ?d - dir)
  )

  (:action move
    :parameters (?d - dir ?from - pos ?to - pos)
    :precondition (and
      (at_player ?from)
      (adj ?from ?to ?d)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action push
    :parameters (?d - dir ?p_from - pos ?b_from - pos ?b_to - pos)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (adj ?p_from ?b_from ?d)
      (adj ?b_from ?b_to ?d)
      (clear ?b_to)
    )
    :effect (and
      (not (at_player ?p_from))
      (at_player ?b_from)
      (not (at_box ?b_from))
      (at_box ?b_to)
      (not (clear ?b_to))
      (clear ?p_from)
    )
  )
)