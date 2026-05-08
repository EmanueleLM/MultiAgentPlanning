(define (domain sokoban_map2)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (adjacent_up ?lower - position ?upper - position) ; lower is below upper
    (goal_pos ?p - position)
  )

  ;; move the player up into an empty cell (no box present)
  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; move the player down into an empty cell (no box present)
  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?to ?from)  ; ?to is below ?from
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; push the box up: player at ?p_from (below box), box at ?p_box, destination ?p_dest above box
  (:action push_up
    :parameters (?p_from - position ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_from)
      (adjacent_up ?p_from ?p_box)   ; player is below the box
      (box_at ?p_box)
      (adjacent_up ?p_box ?p_dest)   ; destination is above the box
      (not (box_at ?p_dest))
    )
    :effect (and
      (not (box_at ?p_box))
      (box_at ?p_dest)
      (not (player_at ?p_from))
      (player_at ?p_box)
    )
  )

  ;; push the box down: player at ?p_from (above box), box at ?p_box, destination ?p_dest below box
  (:action push_down
    :parameters (?p_from - position ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_from)
      (adjacent_up ?p_box ?p_from)   ; player is above the box
      (box_at ?p_box)
      (adjacent_up ?p_dest ?p_box)   ; destination is below the box
      (not (box_at ?p_dest))
    )
    :effect (and
      (not (box_at ?p_box))
      (box_at ?p_dest)
      (not (player_at ?p_from))
      (player_at ?p_box)
    )
  )
)