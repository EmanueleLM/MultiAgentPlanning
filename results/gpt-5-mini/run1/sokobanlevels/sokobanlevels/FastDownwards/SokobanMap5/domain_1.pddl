(define (domain sokoban_corridor)
  (:requirements :strips)
  (:predicates
    (player_at ?p)
    (box_at ?p)
    (goal ?p)
    (adj ?p ?q)
    (free ?p)
  )

  (:action move
    :parameters (?from ?to)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push
    :parameters (?from ?boxpos ?dest)
    :precondition (and
      (player_at ?from)
      (adj ?from ?boxpos)
      (box_at ?boxpos)
      (adj ?boxpos ?dest)
      (free ?dest)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?boxpos)
      (not (box_at ?boxpos))
      (box_at ?dest)
      (free ?from)
      (not (free ?boxpos))
      (not (free ?dest))
    )
  )
)