(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (goal_cell ?c - cell)
  )

  ; move the agent into an adjacent empty cell (destination must not contain any box)
  (:action move
    :parameters (?a - agent ?from - cell ?to - cell ?b - box)
    :precondition (and
      (at_agent ?a ?from)
      (adjacent ?from ?to)
      (not (at_box ?b ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  ; push the box from box_from to box_to; agent moves into box_from
  (:action push
    :parameters (?a - agent ?b - box ?agent_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_agent ?a ?agent_from)
      (at_box ?b ?box_from)
      (adjacent ?agent_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (at_box ?b ?box_to))
      (not (at_agent ?a ?box_to))
    )
    :effect (and
      (not (at_agent ?a ?agent_from))
      (at_agent ?a ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)