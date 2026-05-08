(define (domain sokoban_single_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    cell
  )

  (:predicates
    (adjacent ?from ?to - cell)
    (player_at ?c - cell)
    (box_at ?c - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?from ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?from ?mid ?to - cell)
    :precondition (and
      (player_at ?from)
      (box_at ?mid)
      (adjacent ?from ?mid)
      (adjacent ?mid ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?mid)
      (not (box_at ?mid))
      (box_at ?to)
    )
  )
)