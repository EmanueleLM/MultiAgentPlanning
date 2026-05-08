(define (domain sokoban_map39)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types cell)

  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (goal ?c - cell)
    (floor ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (floor ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?pfrom - cell ?bfrom - cell ?bto - cell)
    :precondition (and
      (player_at ?pfrom)
      (box_at ?bfrom)
      (adj ?pfrom ?bfrom)
      (adj ?bfrom ?bto)
      (floor ?bto)
      (not (box_at ?bto))
      (not (= ?bto ?pfrom))
    )
    :effect (and
      (not (box_at ?bfrom))
      (box_at ?bto)
      (not (player_at ?pfrom))
      (player_at ?bfrom)
    )
  )
)