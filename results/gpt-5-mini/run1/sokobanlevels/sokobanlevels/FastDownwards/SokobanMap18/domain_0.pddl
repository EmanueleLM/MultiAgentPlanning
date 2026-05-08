(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell box agent)
  (:predicates
    (at_agent ?c - cell)
    (at_box ?c - cell)
    (goal ?c - cell)
    (north ?from ?to - cell)
    (south ?from ?to - cell)
  )

  (:action move_north
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at_agent ?from)
      (north ?from ?to)
      (not (at_box ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
    )
  )

  (:action move_south
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at_agent ?from)
      (south ?from ?to)
      (not (at_box ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
    )
  )

  (:action push_north
    :parameters (?a - cell ?b - cell ?c - cell)
    :precondition (and
      (at_agent ?a)
      (north ?a ?b)
      (at_box ?b)
      (north ?b ?c)
      (not (at_box ?c))
      (not (at_agent ?c))
    )
    :effect (and
      (not (at_box ?b))
      (at_box ?c)
      (not (at_agent ?a))
      (at_agent ?b)
    )
  )

  (:action push_south
    :parameters (?a - cell ?b - cell ?c - cell)
    :precondition (and
      (at_agent ?a)
      (south ?a ?b)
      (at_box ?b)
      (south ?b ?c)
      (not (at_box ?c))
      (not (at_agent ?c))
    )
    :effect (and
      (not (at_box ?b))
      (at_box ?c)
      (not (at_agent ?a))
      (at_agent ?b)
    )
  )
)