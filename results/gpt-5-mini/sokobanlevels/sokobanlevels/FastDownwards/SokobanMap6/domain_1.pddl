(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at_agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (succ ?p1 - position ?p2 - position)
  )

  (:action move_forward
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (at_agent ?from)
      (succ ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
    )
  )

  (:action move_backward
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (at_agent ?from)
      (succ ?to ?from)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
    )
  )

  (:action push_forward
    :parameters (?agent_from - position ?box_pos - position ?box_to - position ?b - box)
    :precondition (and
      (at_agent ?agent_from)
      (succ ?agent_from ?box_pos)
      (box_at ?b ?box_pos)
      (succ ?box_pos ?box_to)
      (not (box_at ?b ?box_to))
    )
    :effect (and
      (not (at_agent ?agent_from))
      (at_agent ?box_pos)
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_to)
    )
  )

  (:action push_backward
    :parameters (?agent_from - position ?box_pos - position ?box_to - position ?b - box)
    :precondition (and
      (at_agent ?agent_from)
      (succ ?box_pos ?agent_from)
      (box_at ?b ?box_pos)
      (succ ?box_to ?box_pos)
      (not (box_at ?b ?box_to))
    )
    :effect (and
      (not (at_agent ?agent_from))
      (at_agent ?box_pos)
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_to)
    )
  )
)