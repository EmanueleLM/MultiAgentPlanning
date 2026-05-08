(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location)
  (:predicates
    (at_agent ?a - agent ?l - location)
    (box_at ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adj_up ?l1 ?l2 - location)
    (adj_down ?l1 ?l2 - location)
    (adj_left ?l1 ?l2 - location)
    (adj_right ?l1 ?l2 - location)
  )

  (:action move_up_action
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_agent ?a ?from)
      (adj_up ?from ?to)
      (not (is_wall ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action move_down_action
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_agent ?a ?from)
      (adj_down ?from ?to)
      (not (is_wall ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action move_left_action
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_agent ?a ?from)
      (adj_left ?from ?to)
      (not (is_wall ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action move_right_action
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_agent ?a ?from)
      (adj_right ?from ?to)
      (not (is_wall ?to))
      (not (box_at ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action push_up_action
    :parameters (?a - agent ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (box_at ?l_box)
      (adj_up ?l_agent ?l_box)
      (adj_up ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (box_at ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (box_at ?l_box))
      (box_at ?l_target)
    )
  )

  (:action push_down_action
    :parameters (?a - agent ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (box_at ?l_box)
      (adj_down ?l_agent ?l_box)
      (adj_down ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (box_at ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (box_at ?l_box))
      (box_at ?l_target)
    )
  )

  (:action push_left_action
    :parameters (?a - agent ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (box_at ?l_box)
      (adj_left ?l_agent ?l_box)
      (adj_left ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (box_at ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (box_at ?l_box))
      (box_at ?l_target)
    )
  )

  (:action push_right_action
    :parameters (?a - agent ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (box_at ?l_box)
      (adj_right ?l_agent ?l_box)
      (adj_right ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (box_at ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (box_at ?l_box))
      (box_at ?l_target)
    )
  )
)