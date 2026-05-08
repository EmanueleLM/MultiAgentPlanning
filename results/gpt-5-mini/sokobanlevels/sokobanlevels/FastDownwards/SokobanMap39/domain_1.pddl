(define (domain sokoban_map39)
  (:requirements :strips :typing :negative-preconditions)
  (:types player cell)
  (:predicates
    (at ?p - player ?c - cell)
    (box_at ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at ?p ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?pf - cell ?bf - cell ?bt - cell)
    :precondition (and
      (at ?p ?pf)
      (box_at ?bf)
      (adj ?pf ?bf)
      (adj ?bf ?bt)
      (not (box_at ?bt))
    )
    :effect (and
      (not (box_at ?bf))
      (box_at ?bt)
      (not (at ?p ?pf))
      (at ?p ?bf)
    )
  )
)