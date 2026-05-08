(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types position agent box)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p ?q - position)
    (empty ?p - position)
  )

  (:action move_up
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)    ; ?to is north of ?from
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_down
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?to ?from)    ; ?to is south of ?from
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_up
    :parameters (?player_pos ?box_pos ?target_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (adjacent ?player_pos ?box_pos)   ; player immediately south of the box
      (adjacent ?box_pos ?target_pos)   ; target is north of the box
      (box_at ?box_pos)
      (empty ?target_pos)
    )
    :effect (and
      (not (box_at ?box_pos))
      (box_at ?target_pos)
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (empty ?target_pos))
      (empty ?box_pos)
    )
  )

  (:action push_down
    :parameters (?player_pos ?box_pos ?target_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (adjacent ?box_pos ?player_pos)   ; player immediately north of the box
      (adjacent ?target_pos ?box_pos)   ; target is south of the box
      (box_at ?box_pos)
      (empty ?target_pos)
    )
    :effect (and
      (not (box_at ?box_pos))
      (box_at ?target_pos)
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (empty ?target_pos))
      (empty ?box_pos)
    )
  )
)