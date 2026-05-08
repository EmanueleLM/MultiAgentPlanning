(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal ?p - position)
    (adj ?p - position ?q - position)
  )

  (:action move-right
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move-left
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (box_at ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push-right
    :parameters (?p - position ?b - position ?t - position)
    :precondition (and
      (player_at ?p)
      (box_at ?b)
      (adj ?p ?b)
      (adj ?b ?t)
      (not (box_at ?t))
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?b)
      (not (box_at ?b))
      (box_at ?t)
    )
  )

  (:action push-left
    :parameters (?p - position ?b - position ?t - position)
    :precondition (and
      (player_at ?p)
      (box_at ?b)
      (adj ?p ?b)
      (adj ?b ?t)
      (not (box_at ?t))
    )
    :effect (and
      (not (player_at ?p))
      (player_at ?b)
      (not (box_at ?b))
      (box_at ?t)
    )
  )
)