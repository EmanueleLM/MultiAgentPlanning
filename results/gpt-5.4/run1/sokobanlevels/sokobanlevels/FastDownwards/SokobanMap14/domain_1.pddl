(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    position
    box
  )

  (:predicates
    (adjacent_up ?from - position ?to - position)
    (adjacent_down ?from - position ?to - position)
    (goal_pos ?p - position)
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (box_free ?p - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (box_free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_down ?from ?to)
      (box_free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push_up
    :parameters (?b - box ?player_pos - position ?box_pos - position ?dest - position)
    :precondition (and
      (player_at ?player_pos)
      (box_at ?b ?box_pos)
      (adjacent_up ?player_pos ?box_pos)
      (adjacent_up ?box_pos ?dest)
      (box_free ?dest)
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?b ?box_pos))
      (box_at ?b ?dest)
      (box_free ?box_pos)
      (not (box_free ?dest))
    )
  )

  (:action push_down
    :parameters (?b - box ?player_pos - position ?box_pos - position ?dest - position)
    :precondition (and
      (player_at ?player_pos)
      (box_at ?b ?box_pos)
      (adjacent_down ?player_pos ?box_pos)
      (adjacent_down ?box_pos ?dest)
      (box_free ?dest)
    )
    :effect (and
      (not (player_at ?player_pos))
      (player_at ?box_pos)
      (not (box_at ?b ?box_pos))
      (box_at ?b ?dest)
      (box_free ?box_pos)
      (not (box_free ?dest))
    )
  )
)