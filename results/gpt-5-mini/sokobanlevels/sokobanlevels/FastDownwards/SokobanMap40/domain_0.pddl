(define (domain sokoban_corridor_p95)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)
  (:constants box1 - box)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (not (at_box box1 ?to))
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
      (at_box box1 ?bpos)
      (adjacent ?p ?bpos)
      (adjacent ?bpos ?t)
      (not (at_box box1 ?t))
    )
    :effect (and
      (not (at_box box1 ?bpos))
      (at_box box1 ?t)
      (not (at_player ?p))
      (at_player ?bpos)
    )
  )
)