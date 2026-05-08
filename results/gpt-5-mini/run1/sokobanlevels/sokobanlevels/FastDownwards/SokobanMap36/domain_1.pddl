(define (domain sokoban_1d)
  (:requirements :typing :negative-preconditions :strips)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (free ?c - cell)
  )

  (:action move
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?b - box ?from - cell ?via - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (box_at ?b ?via)
      (adjacent ?from ?via)
      (adjacent ?via ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?via)
      (not (box_at ?b ?via))
      (box_at ?b ?to)
      (free ?via)
      (not (free ?to))
    )
  )
)