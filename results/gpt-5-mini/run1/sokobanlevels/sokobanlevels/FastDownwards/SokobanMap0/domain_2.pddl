(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types position box)

  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (free ?p - position)
    (adjacent_up ?below ?above - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?to ?from)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push_up
    :parameters (?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (box_at ?b ?boxpos)
      (adjacent_up ?from ?boxpos)
      (adjacent_up ?boxpos ?to)
      (free ?to)
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?to)
      (not (player_at ?from))
      (player_at ?boxpos)
      (not (free ?to))
      (not (free ?boxpos))
      (free ?from)
    )
  )

  (:action push_down
    :parameters (?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (box_at ?b ?boxpos)
      (adjacent_up ?boxpos ?from)
      (adjacent_up ?to ?boxpos)
      (free ?to)
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?to)
      (not (player_at ?from))
      (player_at ?boxpos)
      (not (free ?to))
      (not (free ?boxpos))
      (free ?from)
    )
  )
)