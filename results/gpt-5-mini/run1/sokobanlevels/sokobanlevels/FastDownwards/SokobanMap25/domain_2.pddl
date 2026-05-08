(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)

  (:predicates
    (player-at ?pl - player ?p - position)
    (box-at ?b - box ?p - position)
    (adj ?p1 - position ?p2 - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?pl - player ?from - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adj ?from ?to)
      (not (box-at ?b ?to))
      (not (player-at ?pl ?to))
    )
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adj ?from ?boxpos)
      (box-at ?b ?boxpos)
      (adj ?boxpos ?to)
      (not (box-at ?b ?to))
      (not (player-at ?pl ?to))
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
    )
  )
)