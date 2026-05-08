(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?from - cell ?boxpos - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (box_at ?boxpos)
      (adj ?from ?boxpos)
      (adj ?boxpos ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?boxpos)
      (not (box_at ?boxpos))
      (box_at ?to)
    )
  )
)