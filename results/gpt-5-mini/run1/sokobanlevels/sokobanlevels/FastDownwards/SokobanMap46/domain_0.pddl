(define (domain sokoban_linear_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (at_player ?p - position)
    (at_box ?p - position)
    (free ?p - position)
    (adjacent ?p1 ?p2 - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_from - position ?b_from - position ?b_to - position)
    :precondition (and
      (at_player ?p_from)
      (at_box ?b_from)
      (adjacent ?p_from ?b_from)
      (adjacent ?b_from ?b_to)
      (free ?b_to)
    )
    :effect (and
      (not (at_box ?b_from))
      (at_box ?b_to)
      (free ?b_from)
      (not (free ?b_to))
      (not (at_player ?p_from))
      (at_player ?b_from)
    )
  )
)