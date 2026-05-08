(define (domain sokoban_jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?from - cell ?box_cell - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (box_at ?b ?box_cell)
      (adjacent ?from ?box_cell)
      (adjacent ?box_cell ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?box_cell)
      (not (box_at ?b ?box_cell))
      (box_at ?b ?to)
    )
  )
)