(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    cell box
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (empty ?c - cell)
    (goal_cell ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push
    :parameters (?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (empty ?box_to)
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (empty ?player_from)
      (not (empty ?box_from))
      (not (empty ?box_to))
    )
  )
)