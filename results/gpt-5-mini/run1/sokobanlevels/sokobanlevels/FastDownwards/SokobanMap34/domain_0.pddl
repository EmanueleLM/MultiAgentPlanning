(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (left_of ?l - position ?r - position)
  )

  (:action move_left
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (left_of ?to ?from)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_right
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (left_of ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_left
    :parameters (?player_pos - position ?box_pos - position ?dest_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (left_of ?box_pos ?player_pos)
      (box_at ?box_pos)
      (left_of ?dest_pos ?box_pos)
      (not (box_at ?dest_pos))
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?box_pos))
      (box_at ?dest_pos)
    )
  )

  (:action push_right
    :parameters (?player_pos - position ?box_pos - position ?dest_pos - position)
    :precondition (and
      (player_at ?player_pos)
      (left_of ?player_pos ?box_pos)
      (box_at ?box_pos)
      (left_of ?box_pos ?dest_pos)
      (not (box_at ?dest_pos))
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?box_pos))
      (box_at ?dest_pos)
    )
  )
)