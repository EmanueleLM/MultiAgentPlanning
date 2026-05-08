(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box location)
  (:predicates
    (at_agent ?a - agent ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adj_up ?l1 ?l2 - location)
    (adj_down ?l1 ?l2 - location)
  )

  (:action move_up_action
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at_agent ?a ?from)
      (adj_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box box_0 ?to))
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
      (not (at_box box_0 ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action push_up_action
    :parameters (?a - agent ?b - box ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (at_box ?b ?l_box)
      (adj_up ?l_agent ?l_box)
      (adj_up ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (at_box ?b ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (at_box ?b ?l_box))
      (at_box ?b ?l_target)
    )
  )

  (:action push_down_action
    :parameters (?a - agent ?b - box ?l_agent - location ?l_box - location ?l_target - location)
    :precondition (and
      (at_agent ?a ?l_agent)
      (at_box ?b ?l_box)
      (adj_down ?l_agent ?l_box)
      (adj_down ?l_box ?l_target)
      (not (is_wall ?l_target))
      (not (at_box ?b ?l_target))
    )
    :effect (and
      (not (at_agent ?a ?l_agent))
      (at_agent ?a ?l_box)
      (not (at_box ?b ?l_box))
      (at_box ?b ?l_target)
    )
  )
)