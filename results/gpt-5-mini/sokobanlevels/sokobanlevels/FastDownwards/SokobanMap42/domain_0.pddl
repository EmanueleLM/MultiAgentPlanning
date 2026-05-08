(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box agent)
  (:predicates
    (at_box ?b - box ?p - position)
    (at_player ?a - agent ?p - position)
    (empty ?p - position)
    (goal ?p - position)
    (neighbor_right ?from - position ?to - position)
    (neighbor_left ?from - position ?to - position)
  )

  (:action move_right
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (neighbor_right ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_left
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (neighbor_left ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push_right
    :parameters (?a - agent ?b - box ?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (at_player ?a ?p_player)
      (at_box ?b ?p_box)
      (neighbor_right ?p_player ?p_box)
      (neighbor_right ?p_box ?p_dest)
      (empty ?p_dest)
    )
    :effect (and
      (not (at_player ?a ?p_player))
      (not (at_box ?b ?p_box))
      (at_player ?a ?p_box)
      (at_box ?b ?p_dest)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_dest))
    )
  )

  (:action push_left
    :parameters (?a - agent ?b - box ?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (at_player ?a ?p_player)
      (at_box ?b ?p_box)
      (neighbor_left ?p_player ?p_box)
      (neighbor_left ?p_box ?p_dest)
      (empty ?p_dest)
    )
    :effect (and
      (not (at_player ?a ?p_player))
      (not (at_box ?b ?p_box))
      (at_player ?a ?p_box)
      (at_box ?b ?p_dest)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_dest))
    )
  )
)