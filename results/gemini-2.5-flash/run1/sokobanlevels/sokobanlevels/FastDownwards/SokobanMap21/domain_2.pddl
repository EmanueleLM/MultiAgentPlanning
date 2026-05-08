(define (domain sokoban_map21)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    box
    direction
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?b - box ?l - location)
    (is_wall ?l - location)
    (connected ?l1 - location ?l2 - location ?dir - direction)
  )

  (:action move_player_up
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to direction_up)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_down
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to direction_down)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_left
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to direction_left)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_right
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (connected ?from ?to direction_right)
      (not (is_wall ?to))
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_box_up
    :parameters (?p_curr ?b_curr ?b_next - location)
    :precondition (and
      (at_player ?p_curr)
      (at_box box_1 ?b_curr)
      (connected ?p_curr ?b_curr direction_down)
      (connected ?b_curr ?b_next direction_up)
      (not (is_wall ?b_next))
      (not (at_box box_1 ?b_next))
    )
    :effect (and
      (not (at_player ?p_curr))
      (at_player ?b_curr)
      (not (at_box box_1 ?b_curr))
      (at_box box_1 ?b_next)
    )
  )

  (:action push_box_down
    :parameters (?p_curr ?b_curr ?b_next - location)
    :precondition (and
      (at_player ?p_curr)
      (at_box box_1 ?b_curr)
      (connected ?p_curr ?b_curr direction_up)
      (connected ?b_curr ?b_next direction_down)
      (not (is_wall ?b_next))
      (not (at_box box_1 ?b_next))
    )
    :effect (and
      (not (at_player ?p_curr))
      (at_player ?b_curr)
      (not (at_box box_1 ?b_curr))
      (at_box box_1 ?b_next)
    )
  )

  (:action push_box_left
    :parameters (?p_curr ?b_curr ?b_next - location)
    :precondition (and
      (at_player ?p_curr)
      (at_box box_1 ?b_curr)
      (connected ?p_curr ?b_curr direction_right)
      (connected ?b_curr ?b_next direction_left)
      (not (is_wall ?b_next))
      (not (at_box box_1 ?b_next))
    )
    :effect (and
      (not (at_player ?p_curr))
      (at_player ?b_curr)
      (not (at_box box_1 ?b_curr))
      (at_box box_1 ?b_next)
    )
  )

  (:action push_box_right
    :parameters (?p_curr ?b_curr ?b_next - location)
    :precondition (and
      (at_player ?p_curr)
      (at_box box_1 ?b_curr)
      (connected ?p_curr ?b_curr direction_left)
      (connected ?b_curr ?b_next direction_right)
      (not (is_wall ?b_next))
      (not (at_box box_1 ?b_next))
    )
    :effect (and
      (not (at_player ?p_curr))
      (at_player ?b_curr)
      (not (at_box box_1 ?b_curr))
      (at_box box_1 ?b_next)
    )
  )
)