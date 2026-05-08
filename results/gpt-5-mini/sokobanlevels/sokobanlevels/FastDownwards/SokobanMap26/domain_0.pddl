(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent crate)
  (:predicates
    (player-at ?c - cell)
    (box-at ?b - crate ?c - cell)
    (goal ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (occupied ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player-at ?from)
      (adj ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
    )
  )

  (:action push
    :parameters (?from - cell ?boxcell - cell ?to - cell ?b - crate)
    :precondition (and
      (player-at ?from)
      (adj ?from ?boxcell)
      (box-at ?b ?boxcell)
      (adj ?boxcell ?to)
      (not (occupied ?to))
      (not (player-at ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?boxcell)
      (not (box-at ?b ?boxcell))
      (box-at ?b ?to)
      (not (occupied ?boxcell))
      (occupied ?to)
    )
  )
)