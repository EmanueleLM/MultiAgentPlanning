(define (domain jack_of_all_trades_sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?p - player ?b - box ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?from - cell ?bcell - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (box_at ?b ?bcell)
      (adj ?from ?bcell)
      (adj ?bcell ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (box_at ?b ?bcell))
      (box_at ?b ?to)
      (not (player_at ?p ?from))
      (player_at ?p ?bcell)
    )
  )
)