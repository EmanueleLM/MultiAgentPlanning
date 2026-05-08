(define (domain sokoban_jackofalltrades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)

  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at player_agent ?from)
      (adjacent ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (at player_agent ?from))
      (at player_agent ?to)
    )
  )

  (:action push
    :parameters (?from - position ?boxpos - position ?topos - position)
    :precondition (and
      (at player_agent ?from)
      (box_at box1 ?boxpos)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?topos)
      (not (box_at box1 ?topos))
      (not (at player_agent ?topos))
    )
    :effect (and
      (not (box_at box1 ?boxpos))
      (box_at box1 ?topos)
      (not (at player_agent ?from))
      (at player_agent ?boxpos)
    )
  )
)