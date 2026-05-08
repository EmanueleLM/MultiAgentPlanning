(define (domain jack_of_all_trades_sokoban)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent crate cell)

  (:predicates
    (player_at ?p - agent ?c - cell)
    (crate_at ?b - crate ?c - cell)
    (goal ?c - cell)
    (adjacent ?l - cell ?r - cell)
    (empty ?c - cell)
  )

  (:action walk_left
    :parameters (?p - agent ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?to ?from)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action walk_right
    :parameters (?p - agent ?from - cell ?to - cell)
    :precondition (and
      (player_at ?p ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  (:action push_left
    :parameters (?p - agent ?b - crate ?p_pos - cell ?b_pos - cell ?t_pos - cell)
    :precondition (and
      (player_at ?p ?p_pos)
      (crate_at ?b ?b_pos)
      (adjacent ?b_pos ?p_pos)   ; crate is immediately left of player (player right of crate)
      (adjacent ?t_pos ?b_pos)   ; target is immediately left of crate
      (empty ?t_pos)
    )
    :effect (and
      (not (crate_at ?b ?b_pos))
      (crate_at ?b ?t_pos)
      (not (player_at ?p ?p_pos))
      (player_at ?p ?b_pos)
      (empty ?p_pos)
      (not (empty ?b_pos))
      (not (empty ?t_pos))
    )
  )

  (:action push_right
    :parameters (?p - agent ?b - crate ?p_pos - cell ?b_pos - cell ?t_pos - cell)
    :precondition (and
      (player_at ?p ?p_pos)
      (crate_at ?b ?b_pos)
      (adjacent ?p_pos ?b_pos)   ; player is immediately left of crate
      (adjacent ?b_pos ?t_pos)   ; target is immediately right of crate
      (empty ?t_pos)
    )
    :effect (and
      (not (crate_at ?b ?b_pos))
      (crate_at ?b ?t_pos)
      (not (player_at ?p ?p_pos))
      (player_at ?p ?b_pos)
      (empty ?p_pos)
      (not (empty ?b_pos))
      (not (empty ?t_pos))
    )
  )
)