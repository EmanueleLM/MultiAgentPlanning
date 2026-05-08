(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adjacent ?p1 ?p2 - position)
    (free ?p - position)
  )

  (:action move_right
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_left
    :parameters (?from ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_right
    :parameters (?player_pos ?box_pos ?box_target - position)
    :precondition (and
      (player_at ?player_pos)
      (box_at ?box_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?box_target)
      (free ?box_target)
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?box_pos))
      (box_at ?box_target)
      (free ?box_pos)
      (not (free ?box_target))
    )
  )

  (:action push_left
    :parameters (?player_pos ?box_pos ?box_target - position)
    :precondition (and
      (player_at ?player_pos)
      (box_at ?box_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?box_target)
      (free ?box_target)
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?box_pos))
      (box_at ?box_target)
      (free ?box_pos)
      (not (free ?box_target))
    )
  )
)