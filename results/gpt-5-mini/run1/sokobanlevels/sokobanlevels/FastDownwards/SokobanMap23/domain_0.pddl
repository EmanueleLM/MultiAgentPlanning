(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell goal_marker)

  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal_cell ?g - goal_marker ?c - cell)
    (adjacent_up ?c1 - cell ?c2 - cell)
    (adjacent_down ?c1 - cell ?c2 - cell)
  )

  (:action move_up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (adjacent_up ?from ?to)
      (not (at_box ?to))
      (not (at_agent ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (adjacent_down ?from ?to)
      (not (at_box ?to))
      (not (at_agent ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?agent_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (at_agent ?a ?agent_cell)
      (at_box ?b ?box_cell)
      (adjacent_up ?agent_cell ?box_cell)    ; box is above agent
      (adjacent_up ?box_cell ?dest_cell)     ; destination above box
      (not (at_box ?dest_cell))
      (not (at_agent ?dest_cell))
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest_cell)
      (not (at_agent ?a ?agent_cell))
      (at_agent ?a ?box_cell)
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?agent_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (at_agent ?a ?agent_cell)
      (at_box ?b ?box_cell)
      (adjacent_down ?agent_cell ?box_cell)  ; box is below agent
      (adjacent_down ?box_cell ?dest_cell)   ; destination below box
      (not (at_box ?dest_cell))
      (not (at_agent ?dest_cell))
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest_cell)
      (not (at_agent ?a ?agent_cell))
      (at_agent ?a ?box_cell)
    )
  )
)