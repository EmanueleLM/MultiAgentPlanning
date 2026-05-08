(define (domain sokoban_line)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (adj ?a - cell ?b - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?p - player ?player_cell - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?player_cell)
      (box_at b1 ?box_cell)
      (adj ?player_cell ?box_cell)
      (adj ?box_cell ?target)
      (not (box_at b1 ?target))
    )
    :effect (and
      (not (player_at ?player_cell))
      (player_at ?box_cell)
      (not (box_at b1 ?box_cell))
      (box_at b1 ?target)
    )
  )
)