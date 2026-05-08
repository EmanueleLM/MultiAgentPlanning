(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?pl - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (adj ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?from - cell ?boxpos - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (box_at box1 ?boxpos)
      (adj ?from ?boxpos)
      (adj ?boxpos ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxpos)
      (not (box_at box1 ?boxpos))
      (box_at box1 ?to)
    )
  )
)