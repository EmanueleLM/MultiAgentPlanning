(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player)

  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (clear ?p - position)         ; true iff there is no box at the position
    (adjacent ?p - position ?q - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (clear ?to)
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
      (adjacent ?p ?bpos)
      (box_at ?bpos)
      (adjacent ?bpos ?to)
      (clear ?to)
    )
    :effect (and
      (not (box_at ?bpos))
      (box_at ?to)
      (not (player_at ?p))
      (player_at ?bpos)
      (clear ?bpos)
      (not (clear ?to))
    )
  )
)