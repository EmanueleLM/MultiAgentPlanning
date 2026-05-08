(define (domain sokoban-map11)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
    agent
    box
  )
  (:predicates
    (at_agent ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adjacent ?l1 - location ?l2 - location)
  )

  (:functions (total-cost))

  (:action move_agent)
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_agent ?from)
      (adjacent ?from ?to)
      (not (at_box ?to))
      (not (is_wall ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
      (increase (total-cost) 1)
    )

  (:action push_box)
    :parameters (?from_agent - location ?from_box - location ?to_box - location)
    :precondition (and
      (at_agent ?from_agent)
      (at_box ?from_box)
      (adjacent ?from_agent ?from_box)
      (adjacent ?from_box ?to_box)
      (not (at_box ?to_box))
      (not (is_wall ?to_box))
    )
    :effect (and
      (not (at_agent ?from_agent))
      (at_agent ?from_box)
      (not (at_box ?from_box))
      (at_box ?to_box)
      (increase (total-cost) 1)
    )
)