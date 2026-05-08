(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell box player goal_token)
  (:predicates
    (adj ?from - cell ?to - cell)
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?g - goal_token ?c - cell)
    (free ?c - cell)
  )

  (:action move_right
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action move_left
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adj ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_from - cell ?box_at - cell ?box_to - cell)
    :precondition (and
      (player_at ?p ?player_from)
      (adj ?player_from ?box_at)
      (box_at ?b ?box_at)
      (adj ?box_at ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_at))
      (box_at ?b ?box_to)
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_at)
      (not (free ?box_to))
      (free ?player_from)
    )
  )

  (:action push_left
    :parameters (?p - player ?b - box ?player_from - cell ?box_at - cell ?box_to - cell)
    :precondition (and
      (player_at ?p ?player_from)
      (adj ?player_from ?box_at)
      (box_at ?b ?box_at)
      (adj ?box_at ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_at))
      (box_at ?b ?box_to)
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_at)
      (not (free ?box_to))
      (free ?player_from)
    )
  )
)