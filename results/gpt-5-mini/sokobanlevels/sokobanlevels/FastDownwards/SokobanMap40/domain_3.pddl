(define (domain sokoban_map40)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)

  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
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
    :parameters (?p - position ?b - position ?t - position)
    :precondition (and
      (player_at ?p)
      (box_at ?b)
      (adjacent ?p ?b)
      (adjacent ?b ?t)
      (not (box_at ?t))
    )
    :effect (and
      (not (box_at ?b))
      (box_at ?t)
      (not (player_at ?p))
      (player_at ?b)
    )
  )
)