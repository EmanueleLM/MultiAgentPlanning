(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (clear ?c - cell)
    (adj_up ?c1 - cell ?c2 - cell)
    (adj_down ?c1 - cell ?c2 - cell)
  )

  (:action move_up
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj_up ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (not (clear ?to))
      (player_at ?p ?to)
      (clear ?from)
    )
  )

  (:action move_down
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj_down ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (not (clear ?to))
      (player_at ?p ?to)
      (clear ?from)
    )
  )

  (:action push_up
    :parameters (?p - player ?player_cell - cell ?b - box ?box_cell - cell ?box_target - cell)
    :precondition (and
      (player_at ?p ?player_cell)
      (adj_up ?player_cell ?box_cell)
      (box_at ?b ?box_cell)
      (adj_up ?box_cell ?box_target)
      (clear ?box_target)
    )
    :effect (and
      (not (player_at ?p ?player_cell))
      (not (box_at ?b ?box_cell))
      (not (clear ?box_target))
      (player_at ?p ?box_cell)
      (box_at ?b ?box_target)
      (clear ?player_cell)
    )
  )

  (:action push_down
    :parameters (?p - player ?player_cell - cell ?b - box ?box_cell - cell ?box_target - cell)
    :precondition (and
      (player_at ?p ?player_cell)
      (adj_down ?player_cell ?box_cell)
      (box_at ?b ?box_cell)
      (adj_down ?box_cell ?box_target)
      (clear ?box_target)
    )
    :effect (and
      (not (player_at ?p ?player_cell))
      (not (box_at ?b ?box_cell))
      (not (clear ?box_target))
      (player_at ?p ?box_cell)
      (box_at ?b ?box_target)
      (clear ?player_cell)
    )
  )
)