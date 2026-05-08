(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types player box position)
  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adj_up ?p1 - position ?p2 - position)
    (free ?p - position)
  )

  (:action move-up
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_up ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move-down
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_up ?to ?from)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push-up
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (player_at ?pl ?p_player)
      (box_at ?b ?p_box)
      (adj_up ?p_player ?p_box)
      (adj_up ?p_box ?p_target)
      (free ?p_target)
    )
    :effect (and
      (not (player_at ?pl ?p_player))
      (player_at ?pl ?p_box)
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_target)
      (not (free ?p_target))
      (free ?p_box)
      (free ?p_player)
    )
  )

  (:action push-down
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (player_at ?pl ?p_player)
      (box_at ?b ?p_box)
      (adj_up ?p_box ?p_player)
      (adj_up ?p_target ?p_box)
      (free ?p_target)
    )
    :effect (and
      (not (player_at ?pl ?p_player))
      (player_at ?pl ?p_box)
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_target)
      (not (free ?p_target))
      (free ?p_box)
      (free ?p_player)
    )
  )
)