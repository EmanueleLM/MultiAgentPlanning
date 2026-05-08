(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box player)
  (:constants box1 - box player1 - player)
  (:predicates
    (adjacent ?p - position ?q - position)
    (player-at ?pl - player ?p - position)
    (box-at ?b - box ?p - position)
    (goal-pos ?p - position)
  )

  (:action move
    :parameters (?pl - player ?from - position ?to - position ?b - box)
    :precondition (and
      (player-at ?pl ?from)
      (adjacent ?from ?to)
      (not (box-at ?b ?to))
    )
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?from - position ?b - box ?boxpos - position ?to - position)
    :precondition (and
      (player-at ?pl ?from)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?to)
      (box-at ?b ?boxpos)
      (not (box-at ?b ?to))
    )
    :effect (and
      (not (box-at ?b ?boxpos))
      (box-at ?b ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
    )
  )
)