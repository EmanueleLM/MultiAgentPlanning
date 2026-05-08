(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent box)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
  )
  (:action walk
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )
  (:action push
    :parameters (?pfrom - cell ?boxfrom - cell ?boxto - cell)
    :precondition (and
      (player_at ?pfrom)
      (box_at box1 ?boxfrom)
      (adjacent ?pfrom ?boxfrom)
      (adjacent ?boxfrom ?boxto)
      (not (box_at box1 ?boxto))
      (not (player_at ?boxto))
    )
    :effect (and
      (not (box_at box1 ?boxfrom))
      (box_at box1 ?boxto)
      (not (player_at ?pfrom))
      (player_at ?boxfrom)
    )
  )
)