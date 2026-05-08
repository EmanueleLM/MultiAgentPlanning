(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    box
  )

  (:predicates
    (adjacent ?from - location ?to - location)
    (goal_cell ?l - location)
    (player_at ?l - location)
    (box_at ?b - box ?l - location)
  )

  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at b1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at b1 ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (box_at b1 ?box_to))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)
      (not (box_at b1 ?box_from))
      (box_at b1 ?box_to)
    )
  )
)