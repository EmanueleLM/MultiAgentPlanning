(define (domain sokoban_map2)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (adjacent_up ?lower - position ?upper - position)
    (adjacent_down ?upper - position ?lower - position)
    (goal_pos ?p - position)
  )

  ;; move the player up into an empty cell (no box present)
  (:action move_up
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; move the player down into an empty cell (no box present)
  (:action move_down
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (adjacent_down ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; push the box up: player at ?p_from (below box), box at ?p_box, destination ?p_dest above box
  (:action push_up
    :parameters (?p_from - position ?b - box ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_from)
      (adjacent_up ?p_from ?p_box)
      (box_at ?b ?p_box)
      (adjacent_up ?p_box ?p_dest)
      (not (box_at ?b ?p_dest))
    )
    :effect (and
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_dest)
      (not (player_at ?p_from))
      (player_at ?p_box)
    )
  )

  ;; push the box down: player at ?p_from (above box), box at ?p_box, destination ?p_dest below box
  (:action push_down
    :parameters (?p_from - position ?b - box ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_from)
      (adjacent_down ?p_from ?p_box)
      (box_at ?b ?p_box)
      (adjacent_down ?p_box ?p_dest)
      (not (box_at ?b ?p_dest))
    )
    :effect (and
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_dest)
      (not (player_at ?p_from))
      (player_at ?p_box)
    )
  )
)