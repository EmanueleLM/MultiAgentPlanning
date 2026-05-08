(define (domain sokoban)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell box player)

  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (occupied ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?pfrom - cell ?b - box ?bcell - cell ?target - cell)
    :precondition (and
      (player_at ?pfrom)
      (box_at ?b ?bcell)
      (adjacent ?pfrom ?bcell)
      (adjacent ?bcell ?target)
      (not (occupied ?target))
    )
    :effect (and
      (not (box_at ?b ?bcell))
      (box_at ?b ?target)
      (not (occupied ?bcell))
      (occupied ?target)
      (not (player_at ?pfrom))
      (player_at ?bcell)
    )
  )
)