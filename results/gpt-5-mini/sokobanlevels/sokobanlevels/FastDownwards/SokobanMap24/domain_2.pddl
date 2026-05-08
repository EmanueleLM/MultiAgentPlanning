(define (domain sokoban_vertical_100)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell player box)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (occupied ?c - cell) ;; true if a box currently occupies the cell
    (wall ?c - cell)
    (goal ?c - cell)
    (neighbor_up ?from - cell ?to - cell)
    (neighbor_down ?from - cell ?to - cell)
  )

  ;; simple step actions: the player moves into an adjacent empty (non-wall, non-occupied) cell
  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (neighbor_up ?from ?to)
      (not (wall ?to))
      (not (occupied ?to))
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
      (not (occupied ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; push actions: player pushes a box one cell up/down. Player ends up in the box's former cell.
  (:action push_up
    :parameters (?p_from - cell ?b - box ?b_from - cell ?b_to - cell)
    :precondition (and
      (player_at ?p_from)
      (neighbor_up ?p_from ?b_from)   ;; player is below the box
      (box_at ?b ?b_from)
      (neighbor_up ?b_from ?b_to)     ;; target cell is above the box
      (not (wall ?b_to))
      (not (occupied ?b_to))
    )
    :effect (and
      ;; move box
      (not (box_at ?b ?b_from))
      (box_at ?b ?b_to)
      ;; update occupancy
      (not (occupied ?b_from))
      (occupied ?b_to)
      ;; move player into former box cell
      (not (player_at ?p_from))
      (player_at ?b_from)
    )
  )

  (:action push_down
    :parameters (?p_from - cell ?b - box ?b_from - cell ?b_to - cell)
    :precondition (and
      (player_at ?p_from)
      (neighbor_down ?p_from ?b_from) ;; player is above the box
      (box_at ?b ?b_from)
      (neighbor_down ?b_from ?b_to)   ;; target cell is below the box
      (not (wall ?b_to))
      (not (occupied ?b_to))
    )
    :effect (and
      ;; move box
      (not (box_at ?b ?b_from))
      (box_at ?b ?b_to)
      ;; update occupancy
      (not (occupied ?b_from))
      (occupied ?b_to)
      ;; move player into former box cell
      (not (player_at ?p_from))
      (player_at ?b_from)
    )
  )
)