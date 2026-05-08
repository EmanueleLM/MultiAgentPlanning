(define (domain sokoban_linear)
  (:requirements :typing :negative-preconditions :strips)
  (:types player box cell dir)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (floor ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell ?d - dir)
    (free ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell ?d - dir)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?from ?to ?d)
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
    :parameters (?p - player ?b - box ?pfrom - cell ?bcell - cell ?tocell - cell ?d - dir)
    :precondition (and
      (player_at ?p ?pfrom)
      (box_at ?b ?bcell)
      (adjacent ?pfrom ?bcell ?d)
      (adjacent ?bcell ?tocell ?d)
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