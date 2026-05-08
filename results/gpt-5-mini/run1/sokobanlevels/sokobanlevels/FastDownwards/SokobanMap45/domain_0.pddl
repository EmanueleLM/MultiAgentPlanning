(define (domain sokoban_linear_1box)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)
  (:predicates
    (player_at ?pos - position)
    (box_at ?pos - position)
    (goal ?pos - position)
    (adjacent ?from - position ?to - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (not (box_at ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
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