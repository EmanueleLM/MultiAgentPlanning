(define (domain sokoban_one_row)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (next ?left - position ?right - position)
  )

  (:action move-right
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (next ?from ?to)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action move-left
    :parameters (?from - position ?to - position ?b - box)
    :precondition (and
      (player_at ?from)
      (next ?to ?from)
      (not (box_at ?b ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push-right
    :parameters (?p - position ?mid - position ?r - position ?b - box)
    :precondition (and
      (player_at ?p)
      (next ?p ?mid)
      (box_at ?b ?mid)
      (next ?mid ?r)
      (not (box_at ?b ?r))
    )
    :effect (and
      (not (player_at ?p))
      (not (box_at ?b ?mid))
      (player_at ?mid)
      (box_at ?b ?r)
    )
  )

  (:action push-left
    :parameters (?p - position ?mid - position ?l - position ?b - box)
    :precondition (and
      (player_at ?p)
      (next ?mid ?p)
      (box_at ?b ?mid)
      (next ?l ?mid)
      (not (box_at ?b ?l))
    )
    :effect (and
      (not (player_at ?p))
      (not (box_at ?b ?mid))
      (player_at ?mid)
      (box_at ?b ?l)
    )
  )
)