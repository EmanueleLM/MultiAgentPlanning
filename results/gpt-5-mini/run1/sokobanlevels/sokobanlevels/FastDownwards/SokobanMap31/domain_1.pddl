(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (adjacent ?p - position ?q - position)
    (wall ?p - position)
    (goal ?p - position)
    (empty ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
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
    :parameters (?from - position ?bpos - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?bpos)
      (box_at ?b ?bpos)
      (adjacent ?bpos ?to)
      (empty ?to)
    )
    :effect (and
      (not (box_at ?b ?bpos))
      (box_at ?b ?to)
      (not (player_at ?from))
      (player_at ?bpos)
      (empty ?from)
      (not (empty ?to))
    )
  )
)