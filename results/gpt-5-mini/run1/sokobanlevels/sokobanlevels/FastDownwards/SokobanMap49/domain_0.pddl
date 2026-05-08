(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type position)
  (:predicates
    (at_agent ?loc - position)
    (box_at ?box - box_type ?loc - position)
    (goal ?loc - position)
    (adj ?from - position ?to - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_agent ?from)
      (adj ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
    )
  )

  (:action push
    :parameters (?agent_from - position ?box_pos - position ?box_to - position)
    :precondition (and
      (at_agent ?agent_from)
      (box_at box1 ?box_pos)
      (adj ?agent_from ?box_pos)
      (adj ?box_pos ?box_to)
      (not (box_at box1 ?box_to))
    )
    :effect (and
      (not (box_at box1 ?box_pos))
      (box_at box1 ?box_to)
      (not (at_agent ?agent_from))
      (at_agent ?box_pos)
    )
  )
)