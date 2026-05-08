(define (domain sokoban_corridor_single_box)
  (:requirements :strips :typing :negative-preconditions)
  (:types location)

  (:predicates
    (adjacent ?from - location ?to - location)
    (player_at ?l - location)
    (box_at ?l - location)
    (clear ?l - location)
  )

  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (player_at ?player_from))
      (clear ?player_from)
      (player_at ?box_from)
      (not (box_at ?box_from))
      (box_at ?box_to)
      (not (clear ?box_to))
    )
  )
)