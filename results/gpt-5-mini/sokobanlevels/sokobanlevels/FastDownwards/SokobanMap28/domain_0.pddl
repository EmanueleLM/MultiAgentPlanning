(define (domain sokoban_1d_89)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell player box)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
  )

  (:action move_right
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_left
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?to ?from)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?to ?from)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_right
    :parameters (?player_from - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at b1 ?box_cell)
      (adjacent ?player_from ?box_cell)
      (adjacent ?box_cell ?target)
      (not (box_at b1 ?target))
      (not (player_at ?target))
    )
    :effect (and
      (not (box_at b1 ?box_cell))
      (box_at b1 ?target)
      (not (player_at ?player_from))
      (player_at ?box_cell)
    )
  )

  (:action push_left
    :parameters (?player_from - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at b1 ?box_cell)
      (adjacent ?box_cell ?player_from)
      (adjacent ?target ?box_cell)
      (not (box_at b1 ?target))
      (not (player_at ?target))
    )
    :effect (and
      (not (box_at b1 ?box_cell))
      (box_at b1 ?target)
      (not (player_at ?player_from))
      (player_at ?box_cell)
    )
  )

  (:action push_up
    :parameters (?player_from - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at b1 ?box_cell)
      (adjacent ?player_from ?box_cell)
      (adjacent ?box_cell ?target)
      (not (box_at b1 ?target))
      (not (player_at ?target))
    )
    :effect (and
      (not (box_at b1 ?box_cell))
      (box_at b1 ?target)
      (not (player_at ?player_from))
      (player_at ?box_cell)
    )
  )

  (:action push_down
    :parameters (?player_from - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at b1 ?box_cell)
      (adjacent ?box_cell ?player_from)
      (adjacent ?target ?box_cell)
      (not (box_at b1 ?target))
      (not (player_at ?target))
    )
    :effect (and
      (not (box_at b1 ?box_cell))
      (box_at b1 ?target)
      (not (player_at ?player_from))
      (player_at ?box_cell)
    )
  )
)