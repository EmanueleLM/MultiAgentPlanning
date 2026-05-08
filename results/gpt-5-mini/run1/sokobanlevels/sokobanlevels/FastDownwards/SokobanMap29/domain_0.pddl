(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (adjacent ?p ?q - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?p - position ?bpos - position ?to - position)
    :precondition (and
      (player_at ?p)
      (box_at ?bpos)
      (adjacent ?p ?bpos)
      (adjacent ?bpos ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (box_at ?bpos))
      (box_at ?to)
      (not (player_at ?p))
      (player_at ?bpos)
    )
  )
)