(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)
  (:predicates
    (player_at ?a - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
  )

  (:action move
    :parameters (?a - agent ?from - cell ?to - cell ?b - box)
    :precondition (and
      (player_at ?a ?from)
      (adjacent ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?to)
    )
  )

  (:action push
    :parameters (?a - agent ?from - cell ?boxcell - cell ?target - cell ?b - box)
    :precondition (and
      (player_at ?a ?from)
      (box_at ?b ?boxcell)
      (adjacent ?from ?boxcell)
      (adjacent ?boxcell ?target)
      (not (box_at ?b ?target))
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?boxcell)
      (not (box_at ?b ?boxcell))
      (box_at ?b ?target)
    )
  )
)