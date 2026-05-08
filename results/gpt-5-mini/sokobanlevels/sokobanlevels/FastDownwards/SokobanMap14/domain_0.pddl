(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)
  (:constants agent_player - agent box_1 - box)
  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (north ?from - cell ?to - cell)
    (south ?from - cell ?to - cell)
  )

  (:action move_north
    :parameters (?from - cell ?to - cell)
    :precondition (and (at_agent agent_player ?from) (north ?from ?to) (not (at_box box_1 ?to)))
    :effect (and (not (at_agent agent_player ?from)) (at_agent agent_player ?to))
  )

  (:action move_south
    :parameters (?from - cell ?to - cell)
    :precondition (and (at_agent agent_player ?from) (south ?from ?to) (not (at_box box_1 ?to)))
    :effect (and (not (at_agent agent_player ?from)) (at_agent agent_player ?to))
  )

  (:action push_north
    :parameters (?p - cell ?boxpos - cell ?dest - cell)
    :precondition (and
      (at_agent agent_player ?p)
      (north ?p ?boxpos)
      (at_box box_1 ?boxpos)
      (north ?boxpos ?dest)
      (not (at_box box_1 ?dest))
    )
    :effect (and
      (not (at_box box_1 ?boxpos))
      (at_box box_1 ?dest)
      (not (at_agent agent_player ?p))
      (at_agent agent_player ?boxpos)
    )
  )

  (:action push_south
    :parameters (?p - cell ?boxpos - cell ?dest - cell)
    :precondition (and
      (at_agent agent_player ?p)
      (south ?p ?boxpos)
      (at_box box_1 ?boxpos)
      (south ?boxpos ?dest)
      (not (at_box box_1 ?dest))
    )
    :effect (and
      (not (at_box box_1 ?boxpos))
      (at_box box_1 ?dest)
      (not (at_agent agent_player ?p))
      (at_agent agent_player ?boxpos)
    )
  )
)