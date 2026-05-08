(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (goal ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (free ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?p - cell ?b - cell ?t - cell)
    :precondition (and
      (player_at ?p)
      (adj ?p ?b)
      (box_at ?b)
      (adj ?b ?t)
      (free ?t)
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?b)
      (not (box_at ?b))
      (box_at ?t)
      (not (free ?t))
      (free ?b)
    )
  )
)