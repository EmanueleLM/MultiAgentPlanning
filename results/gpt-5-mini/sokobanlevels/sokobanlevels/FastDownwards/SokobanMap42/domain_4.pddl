(define (domain sokoban_map42)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box player)
  (:predicates
    (at_box ?b - box ?p - position)
    (at_player ?a - player ?p - position)
    (goal ?p - position)
    (neighbor ?from - position ?to - position)
    (free ?p - position)
  )

  ;; simple move along a directed neighbor relation; requires the target to be free
  (:action move
    :parameters (?a - player ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (neighbor ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  ;; push a box from p_box to p_dest by a player standing at p_player (adjacent behind the box).
  (:action push
    :parameters (?a - player ?b - box ?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (at_player ?a ?p_player)
      (at_box ?b ?p_box)
      (neighbor ?p_player ?p_box)
      (neighbor ?p_box ?p_dest)
      (free ?p_dest)
    )
    :effect (and
      (not (at_player ?a ?p_player))
      (at_player ?a ?p_box)
      (not (at_box ?b ?p_box))
      (at_box ?b ?p_dest)
      ;; update free-ness: player leaves p_player, destination becomes occupied
      (free ?p_player)
      (not (free ?p_dest))
      ;; ensure p_box is not marked free (it's occupied by player after the push)
      (not (free ?p_box))
    )
  )
)