(define (domain sokoban_1d_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell ?b - box)
    :precondition (and
      (at ?p ?from)
      (adj ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?pf - cell ?b - box ?bf - cell ?bt - cell)
    :precondition (and
      (at ?p ?pf)
      (box_at ?b ?bf)
      (adj ?pf ?bf)
      (adj ?bf ?bt)
      (not (box_at ?b ?bt))
    )
    :effect (and
      (not (box_at ?b ?bf))
      (box_at ?b ?bt)
      (not (at ?p ?pf))
      (at ?p ?bf)
    )
  )
)