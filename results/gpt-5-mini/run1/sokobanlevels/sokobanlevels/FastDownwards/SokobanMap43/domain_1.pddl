(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)

  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (wall ?p - position)
    (goal ?p - position)
    (adj_right ?a - position ?b - position)
  )

  (:action move_right
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adj_right ?from ?to) (not (wall ?to)) (not (box_at ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_left
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adj_right ?to ?from) (not (wall ?to)) (not (box_at ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push_right
    :parameters (?p - position ?p_box - position ?p_target - position)
    :precondition (and
      (player_at ?p)
      (box_at ?p_box)
      (adj_right ?p ?p_box)
      (adj_right ?p_box ?p_target)
      (not (wall ?p_target))
      (not (box_at ?p_target))
    )
    :effect (and
      (not (box_at ?p_box))
      (box_at ?p_target)
      (not (player_at ?p))
      (player_at ?p_box)
    )
  )

  (:action push_left
    :parameters (?p - position ?p_box - position ?p_target - position)
    :precondition (and
      (player_at ?p)
      (box_at ?p_box)
      (adj_right ?p_box ?p)
      (adj_right ?p_target ?p_box)
      (not (wall ?p_target))
      (not (box_at ?p_target))
    )
    :effect (and
      (not (box_at ?p_box))
      (box_at ?p_target)
      (not (player_at ?p))
      (player_at ?p_box)
    )
  )
)