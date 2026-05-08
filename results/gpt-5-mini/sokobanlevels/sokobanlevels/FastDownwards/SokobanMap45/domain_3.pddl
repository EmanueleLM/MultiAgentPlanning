(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (adj ?p - position ?q - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?player_pos - position ?box_pos - position ?to - position)
    :precondition (and
      (player_at ?player_pos)
      (box_at ?box_pos)
      (adj ?player_pos ?box_pos)
      (adj ?box_pos ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?box_pos))
      (box_at ?to)
    )
  )
)