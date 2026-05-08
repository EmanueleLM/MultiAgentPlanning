(define (domain sokoban_single_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell)

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?c - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
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
    :parameters (?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (player_at ?box_to))
      (not (box_at ?box_to))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at ?box_from))
      (box_at ?box_to)
    )
  )
)