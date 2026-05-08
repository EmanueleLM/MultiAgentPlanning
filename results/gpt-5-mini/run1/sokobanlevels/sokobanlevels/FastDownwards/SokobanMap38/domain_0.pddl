(define (domain jack_of_all_trades_sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box agent)
  (:predicates
    (at_box ?b - box ?p - position)
    (at_player ?a - agent ?p - position)
    (goal ?p - position)
    (adj ?p - position ?q - position)
    (clear ?p - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_player ?a ?from)
      (adj ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?a ?from))
      (at_player ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?from - position ?boxpos - position ?topos - position)
    :precondition (and
      (at_player ?a ?from)
      (adj ?from ?boxpos)
      (at_box ?b ?boxpos)
      (adj ?boxpos ?topos)
      (clear ?topos)
    )
    :effect (and
      (not (at_box ?b ?boxpos))
      (at_box ?b ?topos)
      (not (at_player ?a ?from))
      (at_player ?a ?boxpos)
      (clear ?from)
      (not (clear ?boxpos))
      (not (clear ?topos))
    )
  )
)