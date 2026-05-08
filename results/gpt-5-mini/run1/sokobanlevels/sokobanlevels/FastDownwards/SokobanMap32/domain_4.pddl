(define (domain sokoban_line)
  (:requirements :strips :typing :negative-preconditions)
  (:types player cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?c - cell)
    (adj ?a - cell ?b - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?from - cell ?box - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?box)
      (box_at ?box)
      (adj ?box ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?box)
      (not (box_at ?box))
      (box_at ?to)
    )
  )
)