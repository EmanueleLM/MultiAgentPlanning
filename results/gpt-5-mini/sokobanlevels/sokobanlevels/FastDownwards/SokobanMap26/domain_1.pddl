(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent crate)
  (:predicates
    (player-at ?c - cell)
    (box-at ?b - crate ?c - cell)
    (goal ?c - cell)
    (next ?c1 - cell ?c2 - cell)        ; successor in the corridor (one direction)
    (occupied ?c - cell)               ; cell occupied by a box
  )

  (:action move_forward
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player-at ?from)
      (next ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
    )
  )

  (:action move_backward
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player-at ?from)
      (next ?to ?from)
      (not (occupied ?to))
    )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
    )
  )

  (:action push_forward
    :parameters (?from - cell ?boxcell - cell ?to - cell ?b - crate)
    :precondition (and
      (player-at ?from)
      (next ?from ?boxcell)
      (box-at ?b ?boxcell)
      (next ?boxcell ?to)
      (not (occupied ?to))
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

  (:action push_backward
    :parameters (?from - cell ?boxcell - cell ?to - cell ?b - crate)
    :precondition (and
      (player-at ?from)
      (next ?boxcell ?from)
      (box-at ?b ?boxcell)
      (next ?to ?boxcell)
      (not (occupied ?to))
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