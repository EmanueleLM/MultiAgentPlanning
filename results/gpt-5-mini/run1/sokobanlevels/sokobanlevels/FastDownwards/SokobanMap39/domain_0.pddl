(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)

  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (floor ?c - cell)
    (adj ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (floor ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?pf - cell ?bf - cell ?bt - cell)
    :precondition (and
      (player_at ?p ?pf)
      (box_at box1 ?bf)
      (adj ?pf ?bf)
      (adj ?bf ?bt)
      (floor ?bt)
      (not (box_at box1 ?bt))
    )
    :effect (and
      (not (box_at box1 ?bf))
      (box_at box1 ?bt)
      (not (player_at ?p ?pf))
      (player_at ?p ?bf)
    )
  )
)