(define (domain sokoban_map42)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box player)
  (:predicates
    (at_box ?b - box ?p - position)
    (at_player ?a - player ?p - position)
    (goal ?p - position)
    (neighbor_right ?from - position ?to - position)
  )

  (:action move_right
    :parameters (?a - player ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (neighbor_right ?from ?to)
      (not (at_box ?to))
      (not (at_player ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action move_left
    :parameters (?a - player ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (neighbor_right ?to ?from) ;; left is right reversed
      (not (at_box ?to))
      (not (at_player ?to))
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
    )
  )

  (:action push_right
    :parameters (?a - player ?b - box ?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (at_player ?a ?p_player)
      (at_box ?b ?p_box)
      (neighbor_right ?p_player ?p_box)
      (neighbor_right ?p_box ?p_dest)
      (not (at_box ?p_dest))
      (not (at_player ?p_dest))
    )
    :effect (and
      (not (at_player ?a ?p_player))
      (at_player ?a ?p_box)
      (not (at_box ?b ?p_box))
      (at_box ?b ?p_dest)
    )
  )

  (:action push_left
    :parameters (?a - player ?b - box ?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (at_player ?a ?p_player)
      (at_box ?b ?p_box)
      (neighbor_right ?p_box ?p_player) ;; left push uses reversed neighbor_right
      (neighbor_right ?p_dest ?p_box)
      (not (at_box ?p_dest))
      (not (at_player ?p_dest))
    )
    :effect (and
      (not (at_player ?a ?p_player))
      (at_player ?a ?p_box)
      (not (at_box ?b ?p_box))
      (at_box ?b ?p_dest)
    )
  )
)