(define (domain jack_of_all_trades_sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:constants box1 - box)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?s - cell ?bcell - cell ?d - cell)
    :precondition (and
      (player_at ?p ?s)
      (box_at ?b ?bcell)
      (adj ?s ?bcell)
      (adj ?bcell ?d)
      (not (box_at box1 ?d))
    )
    :effect (and
      (not (box_at ?b ?bcell))
      (box_at ?b ?d)
      (not (player_at ?p ?s))
      (player_at ?p ?bcell)
    )
  )
)