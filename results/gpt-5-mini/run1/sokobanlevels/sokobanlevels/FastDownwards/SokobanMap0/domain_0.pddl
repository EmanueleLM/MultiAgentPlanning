(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box player)

  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent_up ?below ?above - position)
    (empty ?p - position)
  )

  (:action walk_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action walk_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent_up ?to ?from)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push_up
    :parameters (?pfrom - position ?pbox - position ?pto - position)
    :precondition (and
      (player_at ?pfrom)
      (box_at box1 ?pbox)
      (adjacent_up ?pfrom ?pbox)
      (adjacent_up ?pbox ?pto)
      (empty ?pto)
    )
    :effect (and
      (not (box_at box1 ?pbox))
      (box_at box1 ?pto)
      (not (player_at ?pfrom))
      (player_at ?pbox)
      (not (empty ?pto))
      (not (empty ?pbox))
      (empty ?pfrom)
    )
  )

  (:action push_down
    :parameters (?pfrom - position ?pbox - position ?pto - position)
    :precondition (and
      (player_at ?pfrom)
      (box_at box1 ?pbox)
      (adjacent_up ?pbox ?pfrom)
      (adjacent_up ?pto ?pbox)
      (empty ?pto)
    )
    :effect (and
      (not (box_at box1 ?pbox))
      (box_at box1 ?pto)
      (not (player_at ?pfrom))
      (player_at ?pbox)
      (not (empty ?pto))
      (not (empty ?pbox))
      (empty ?pfrom)
    )
  )
)