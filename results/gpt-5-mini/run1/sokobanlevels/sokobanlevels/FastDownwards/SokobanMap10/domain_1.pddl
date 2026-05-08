(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types position agent box)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p ?q - position)
  )

  (:action move
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at ?to))
      (not (player_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?player_pos ?box_pos ?target_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (adjacent ?player_pos ?box_pos)   ; player is adjacent to the box (from)
      (adjacent ?box_pos ?target_pos)   ; target is on the other side of the box
      (box_at ?box_pos)
      (not (box_at ?target_pos))
      (not (player_at ?target_pos))
    )
    :effect (and
      (not (box_at ?box_pos))
      (box_at ?target_pos)
      (not (player_at ?player_pos))
      (player_at ?box_pos)
    )
  )
)