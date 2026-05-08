(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate pos)
  (:predicates
    (at ?a - agent ?p - pos)
    (box_at ?b - crate ?p - pos)
    (goal ?p - pos)
    (adjacent ?p1 - pos ?p2 - pos)
    (clear ?p - pos)
  )

  (:action move
    :parameters (?agent - agent ?from - pos ?to - pos)
    :precondition (and
      (at ?agent ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at ?agent ?from))
      (at ?agent ?to)
    )
  )

  (:action push
    :parameters (?agent - agent ?box - crate ?agent_pos - pos ?box_pos - pos ?dest_pos - pos)
    :precondition (and
      (at ?agent ?agent_pos)
      (adjacent ?agent_pos ?box_pos)
      (adjacent ?box_pos ?dest_pos)
      (box_at ?box ?box_pos)
      (clear ?dest_pos)
    )
    :effect (and
      (not (at ?agent ?agent_pos))
      (at ?agent ?box_pos)
      (not (box_at ?box ?box_pos))
      (box_at ?box ?dest_pos)
      (clear ?box_pos)
      (not (clear ?dest_pos))
    )
  )
)