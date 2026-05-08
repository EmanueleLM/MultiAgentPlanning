(define (domain sokoban_corridor)
  (:requirements :typing :strips)
  (:types position agent box)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (free ?p - position)
    (adjacent ?p ?q - position)
  )

  (:action move
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push
    :parameters (?player_pos ?box_pos ?target_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?target_pos)
      (box_at ?box_pos)
      (free ?target_pos)
    )
    :effect (and
      (not (box_at ?box_pos))
      (box_at ?target_pos)
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (free ?box_pos)
      (not (free ?target_pos))
    )
  )
)