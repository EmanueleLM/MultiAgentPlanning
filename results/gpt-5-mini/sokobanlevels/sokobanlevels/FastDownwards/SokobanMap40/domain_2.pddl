(define (domain sokoban_map40)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)

  (:predicates
    (at_player ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p - position ?bpos - position ?t - position)
    :precondition (and
      (at_player ?p)
      (box_at ?bpos)
      (adjacent ?p ?bpos)
      (adjacent ?bpos ?t)
      (not (box_at ?t))
    )
    :effect (and
      (not (box_at ?bpos))
      (box_at ?t)
      (not (at_player ?p))
      (at_player ?bpos)
    )
  )
)