(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (is_goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (empty ?p - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (adjacent ?to ?from)
      (at_player ?from)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (adjacent ?from ?to)
      (at_player ?from)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push_up
    :parameters (?player_pos - position ?box_pos - position ?dest - position ?b - box)
    :precondition (and
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?dest)
      (at_player ?player_pos)
      (at_box ?b ?box_pos)
      (empty ?dest)
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?dest)
      (not (at_player ?player_pos))
      (at_player ?box_pos)
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?dest))
    )
  )

  (:action push_down
    :parameters (?player_pos - position ?box_pos - position ?dest - position ?b - box)
    :precondition (and
      (adjacent ?box_pos ?player_pos)
      (adjacent ?dest ?box_pos)
      (at_player ?player_pos)
      (at_box ?b ?box_pos)
      (empty ?dest)
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?dest)
      (not (at_player ?player_pos))
      (at_player ?box_pos)
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?dest))
    )
  )
)