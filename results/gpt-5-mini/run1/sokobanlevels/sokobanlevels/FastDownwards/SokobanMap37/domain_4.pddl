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
    :parameters (?p - cell ?b - cell ?to - cell)
    :precondition (and
      (player_at ?p)
      (box_at ?b)
      (adj ?p ?b)
      (adj ?b ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?b)
      (not (box_at ?b))
      (box_at ?to)
    )
  )
)