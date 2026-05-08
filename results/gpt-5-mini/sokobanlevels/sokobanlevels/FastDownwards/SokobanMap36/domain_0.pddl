(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (empty ?p - position)
    (goal ?p - position)
    (neighbor ?left - position ?right - position)
  )

  (:action move_left
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (neighbor ?to ?from)
      (empty ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_right
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (neighbor ?from ?to)
      (empty ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push_left
    :parameters (?player_pos - position ?box_pos - position ?target - position)
    :precondition (and
      (player_at ?player_pos)
      (neighbor ?box_pos ?player_pos)
      (box_at ?box_pos)
      (neighbor ?target ?box_pos)
      (empty ?target)
    )
    :effect (and
      (box_at ?target)
      (not (box_at ?box_pos))
      (player_at ?box_pos)
      (not (player_at ?player_pos))
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?target))
    )
  )

  (:action push_right
    :parameters (?player_pos - position ?box_pos - position ?target - position)
    :precondition (and
      (player_at ?player_pos)
      (neighbor ?player_pos ?box_pos)
      (box_at ?box_pos)
      (neighbor ?box_pos ?target)
      (empty ?target)
    )
    :effect (and
      (box_at ?target)
      (not (box_at ?box_pos))
      (player_at ?box_pos)
      (not (player_at ?player_pos))
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?target))
    )
  )
)