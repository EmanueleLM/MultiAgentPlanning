(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types player box position)
  (:predicates
    (player-at ?pl - player ?p - position)
    (box-at ?b - box ?p - position)
    (adj ?p1 - position ?p2 - position)
    (clear ?p - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and (player-at ?pl ?from) (adj ?from ?to) (clear ?to))
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?pl - player ?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adj ?from ?boxpos)
      (box-at ?b ?boxpos)
      (adj ?boxpos ?to)
      (clear ?to)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
      (clear ?from)
      (not (clear ?to))
      (not (clear ?boxpos))
    )
  )
)