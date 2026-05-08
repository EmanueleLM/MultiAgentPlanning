(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type position)
  (:predicates
    (at_agent ?pos - position)
    (box_at ?b - box_type ?pos - position)
    (goal ?pos - position)
    (adj ?from - position ?to - position)
    (occupied ?pos - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_agent ?from)
      (adj ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_agent ?from))
      (at_agent ?to)
      (not (occupied ?from))
      (occupied ?to)
    )
  )

  (:action push
    :parameters (?from - position ?b - box_type ?bpos - position ?bto - position)
    :precondition (and
      (at_agent ?from)
      (adj ?from ?bpos)
      (box_at ?b ?bpos)
      (adj ?bpos ?bto)
      (not (occupied ?bto))
    )
    :effect (and
      (not (box_at ?b ?bpos))
      (box_at ?b ?bto)
      (not (at_agent ?from))
      (at_agent ?bpos)
      (not (occupied ?from))
      (occupied ?bto)
    )
  )
)