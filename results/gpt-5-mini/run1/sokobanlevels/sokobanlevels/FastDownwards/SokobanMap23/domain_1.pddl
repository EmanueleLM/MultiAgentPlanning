(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (free ?c - cell)
    (adjacent_up ?c1 - cell ?c2 - cell)
    (adjacent_down ?c1 - cell ?c2 - cell)
  )

  (:action move_up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (adjacent_up ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action move_down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (adjacent_down ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?agent_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (at_agent ?a ?agent_cell)
      (at_box ?b ?box_cell)
      (adjacent_up ?agent_cell ?box_cell)    ; box is above agent
      (adjacent_up ?box_cell ?dest_cell)     ; destination above box
      (free ?dest_cell)
    )
    :effect (and
      ; move box up
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest_cell)
      (not (free ?dest_cell))
      ; agent moves into former box cell
      (not (at_agent ?a ?agent_cell))
      (at_agent ?a ?box_cell)
      (not (free ?box_cell))
      ; agent's former cell becomes free
      (free ?agent_cell)
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?agent_cell - cell ?box_cell - cell ?dest_cell - cell)
    :precondition (and
      (at_agent ?a ?agent_cell)
      (at_box ?b ?box_cell)
      (adjacent_down ?agent_cell ?box_cell)  ; box is below agent
      (adjacent_down ?box_cell ?dest_cell)   ; destination below box
      (free ?dest_cell)
    )
    :effect (and
      ; move box down
      (not (at_box ?b ?box_cell))
      (at_box ?b ?dest_cell)
      (not (free ?dest_cell))
      ; agent moves into former box cell
      (not (at_agent ?a ?agent_cell))
      (at_agent ?a ?box_cell)
      (not (free ?box_cell))
      ; agent's former cell becomes free
      (free ?agent_cell)
    )
  )
)