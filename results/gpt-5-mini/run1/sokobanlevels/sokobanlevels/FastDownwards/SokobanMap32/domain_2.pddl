(define (domain sokoban_line)
  (:requirements :strips :typing :negative-preconditions)
  (:types player cell)
  (:predicates
    (player_at ?pl - player ?c - cell)
    (box_at ?c - cell)
    (adj ?a - cell ?b - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?player_cell - cell ?box_cell - cell ?target - cell)
    :precondition (and
      (player_at ?p ?player_cell)
      (box_at ?box_cell)
      (adj ?player_cell ?box_cell)
      (adj ?box_cell ?target)
      (not (box_at ?target))
    )
    :effect (and
      (not (player_at ?p ?player_cell))
      (player_at ?p ?box_cell)
      (not (box_at ?box_cell))
      (box_at ?target)
    )
  )
)