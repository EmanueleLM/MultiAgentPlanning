(define (domain sokoban_map38)
  (:requirements :strips :typing)
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
    :parameters (?a - agent ?b - box ?p - position ?q - position ?r - position)
    :precondition (and
      (at_player ?a ?p)
      (adj ?p ?q)
      (at_box ?b ?q)
      (adj ?q ?r)
      (clear ?r)
    )
    :effect (and
      (not (at_box ?b ?q))
      (at_box ?b ?r)
      (not (at_player ?a ?p))
      (at_player ?a ?q)
      (clear ?p)
      (not (clear ?q))
      (not (clear ?r))
    )
  )
)