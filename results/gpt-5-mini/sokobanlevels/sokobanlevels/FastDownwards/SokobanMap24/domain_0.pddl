(define (domain sokoban_vertical_100)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell player box)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (wall ?c - cell)
    (goal ?c - cell)
    (neighbor_up ?from - cell ?to - cell)
    (neighbor_down ?from - cell ?to - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (neighbor_up ?from ?to)
      (not (wall ?to))
      (not (box_at box1 ?to))
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
      (neighbor_down ?from ?to)
      (not (wall ?to))
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_up
    :parameters (?p_from - cell ?b_from - cell ?b_to - cell)
    :precondition (and
      (player_at ?p_from)
      (neighbor_up ?p_from ?b_from)
      (box_at box1 ?b_from)
      (neighbor_up ?b_from ?b_to)
      (not (wall ?b_to))
      (not (box_at box1 ?b_to))
    )
    :effect (and
      (not (box_at box1 ?b_from))
      (box_at box1 ?b_to)
      (not (player_at ?p_from))
      (player_at ?b_from)
    )
  )

  (:action push_down
    :parameters (?p_from - cell ?b_from - cell ?b_to - cell)
    :precondition (and
      (player_at ?p_from)
      (neighbor_down ?p_from ?b_from)
      (box_at box1 ?b_from)
      (neighbor_down ?b_from ?b_to)
      (not (wall ?b_to))
      (not (box_at box1 ?b_to))
    )
    :effect (and
      (not (box_at box1 ?b_from))
      (box_at box1 ?b_to)
      (not (player_at ?p_from))
      (player_at ?b_from)
    )
  )
)