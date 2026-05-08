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
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player-at ?pl ?from)
      (adjacent ?from ?to)
      (not (box-at box1 ?to))
    )
    :effect (and
      (not (player-at ?pl ?from))
      (player-at ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?from - position ?boxpos - position ?to - position)
    :precondition (and
      (player-at ?pl ?from)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?to)
      (box-at box1 ?boxpos)
      (not (box-at box1 ?to))
    )
    :effect (and
      (not (box-at box1 ?boxpos))
      (box-at box1 ?to)
      (not (player-at ?pl ?from))
      (player-at ?pl ?boxpos)
    )
  )
)