(define (domain sokoban_corridor)
  (:requirements :typing)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (succ ?p1 ?p2 - position)
    (empty ?p - position)
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (succ ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (succ ?to ?from)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push_down
    :parameters (?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_player)
      (succ ?p_player ?p_box)
      (box_at ?p_box)
      (succ ?p_box ?p_dest)
      (empty ?p_dest)
    )
    :effect (and
      (not (player_at ?p_player))
      (player_at ?p_box)
      (not (box_at ?p_box))
      (box_at ?p_dest)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_dest))
    )
  )

  (:action push_up
    :parameters (?p_player - position ?p_box - position ?p_dest - position)
    :precondition (and
      (player_at ?p_player)
      (succ ?p_dest ?p_box)
      (succ ?p_box ?p_player)
      (box_at ?p_box)
      (empty ?p_dest)
    )
    :effect (and
      (not (player_at ?p_player))
      (player_at ?p_box)
      (not (box_at ?p_box))
      (box_at ?p_dest)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_dest))
    )
  )
)