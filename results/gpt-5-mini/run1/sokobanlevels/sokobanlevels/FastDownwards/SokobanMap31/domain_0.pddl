(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (adjacent ?p - position ?q - position)
    (wall ?p - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (wall ?to))
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?p - position ?bpos - position ?t - position)
    :precondition (and
      (player_at ?p)
      (adjacent ?p ?bpos)
      (box_at box1 ?bpos)
      (adjacent ?bpos ?t)
      (not (wall ?t))
      (not (box_at box1 ?t))
    )
    :effect (and
      (not (box_at box1 ?bpos))
      (box_at box1 ?t)
      (not (player_at ?p))
      (player_at ?bpos)
    )
  )
)