(define (domain sokoban_map12)
  (:requirements :typing :strips)
  (:types cell box player)

  (:predicates
    (at_box ?b - box ?c - cell)
    (at_player ?p - player ?c - cell)
    (free ?c - cell)                           ; true iff no box on this cell
    (adjacent_up ?upper - cell ?lower - cell) ; ?upper is immediately above ?lower
  )

  ;; player moves one cell up into a free cell
  (:action move_up
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?pl ?from)
      (adjacent_up ?to ?from)
      (free ?to)
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  ;; player moves one cell down into a free cell
  (:action move_down
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?pl ?from)
      (adjacent_up ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  ;; push a box one cell up: player must be immediately below the box,
  ;; the cell above the box must be free. Player ends up in the box's previous cell.
  (:action push_up
    :parameters (?b - box ?upper - cell ?lower - cell ?below - cell ?pl - player)
    :precondition (and
      (at_box ?b ?lower)
      (adjacent_up ?upper ?lower)
      (adjacent_up ?lower ?below)
      (at_player ?pl ?below)
      (free ?upper)
    )
    :effect (and
      (not (at_box ?b ?lower))
      (at_box ?b ?upper)
      (not (free ?upper))
      (free ?lower)
      (not (at_player ?pl ?below))
      (at_player ?pl ?lower)
    )
  )

  ;; push a box one cell down: player must be immediately above the box,
  ;; the cell below the box must be free. Player ends up in the box's previous cell.
  (:action push_down
    :parameters (?b - box ?lower - cell ?upper - cell ?above - cell ?pl - player)
    :precondition (and
      (at_box ?b ?upper)
      (adjacent_up ?upper ?lower)
      (adjacent_up ?above ?upper)
      (at_player ?pl ?above)
      (free ?lower)
    )
    :effect (and
      (not (at_box ?b ?upper))
      (at_box ?b ?lower)
      (not (free ?lower))
      (free ?upper)
      (not (at_player ?pl ?above))
      (at_player ?pl ?upper)
    )
  )
)