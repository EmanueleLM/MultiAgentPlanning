(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?p - player ?from - cell ?to - cell ?b - box)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?from - cell ?boxcell - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (box_at ?b ?boxcell)
      (adjacent ?from ?boxcell)
      (adjacent ?boxcell ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (box_at ?b ?boxcell))
      (box_at ?b ?to)
      (not (player_at ?p ?from))
      (player_at ?p ?boxcell)
    )
  )
)