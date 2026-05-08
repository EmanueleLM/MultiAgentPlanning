(define (domain sokoban_linear)
  (:requirements :strips :typing)
  (:types player box position)
  (:predicates
    (player-at ?pl - player ?p - position)
    (box-at ?b - box ?p - position)
    (goal ?p - position)
    (adj ?p1 - position ?p2 - position)
    (empty ?p - position)
  )

  (:action move-up
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and (player-at ?pl ?from) (adj ?to ?from) (empty ?to))
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-down
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and (player-at ?pl ?from) (adj ?to ?from) (empty ?to))
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push-up
    :parameters (?pl - player ?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adj ?boxpos ?from)
      (box-at ?b ?boxpos)
      (adj ?to ?boxpos)
      (empty ?to)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
      (not (empty ?to))
      (empty ?from)
      (not (empty ?boxpos))
    )
  )

  (:action push-down
    :parameters (?pl - player ?from - position ?boxpos - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adj ?boxpos ?from)
      (box-at ?b ?boxpos)
      (adj ?to ?boxpos)
      (empty ?to)
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
      (not (empty ?to))
      (empty ?from)
      (not (empty ?boxpos))
    )
  )
)