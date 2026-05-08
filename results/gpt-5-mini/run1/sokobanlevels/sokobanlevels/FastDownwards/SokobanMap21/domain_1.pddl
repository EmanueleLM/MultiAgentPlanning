(define (domain sokoban_linear)
  (:requirements :typing :negative-preconditions :strips)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (free ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?pfrom - cell ?bcell - cell ?tocell - cell)
    :precondition (and
      (player_at ?p ?pfrom)
      (box_at ?b ?bcell)
      (adjacent ?pfrom ?bcell)
      (adjacent ?bcell ?tocell)
      (free ?tocell)
    )
    :effect (and
      (not (box_at ?b ?bcell))
      (box_at ?b ?tocell)
      (not (player_at ?p ?pfrom))
      (player_at ?p ?bcell)
      (not (free ?tocell))
      (not (free ?bcell))
      (free ?pfrom)
    )
  )
)