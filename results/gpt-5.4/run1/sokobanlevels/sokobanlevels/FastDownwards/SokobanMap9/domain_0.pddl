(define (domain sokoban_single_lane_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    cell box
  )

  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (clear ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?from))
      (clear ?from)
      (player_at ?to)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?player_from)
      (box_at ?b ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?player_from))
      (clear ?player_from)
      (not (box_at ?b ?box_from))
      (player_at ?box_from)
      (not (clear ?box_to))
      (box_at ?b ?box_to)
    )
  )
)