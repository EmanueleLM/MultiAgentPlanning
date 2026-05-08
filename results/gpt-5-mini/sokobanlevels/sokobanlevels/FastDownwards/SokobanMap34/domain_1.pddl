(define (domain jack_of_all_trades_sokoban)
  (:requirements :typing :strips)
  (:types agent crate cell)

  (:predicates
    (player_at ?p - agent ?c - cell)
    (crate_at ?b - crate ?c - cell)
    (goal ?c - cell)
    (adjacent ?l - cell ?r - cell)
    (empty ?c - cell)
  )

  ;; move the player between adjacent empty cells
  (:action move
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

  ;; push a crate from b_pos to t_pos when player is at p_pos (adjacent to crate)
  ;; after push player occupies the crate's previous cell
  (:action push
    :parameters (?p - agent ?b - crate ?p_pos - cell ?b_pos - cell ?t_pos - cell)
    :precondition (and
      (player_at ?p ?p_pos)
      (crate_at ?b ?b_pos)
      (adjacent ?p_pos ?b_pos)
      (adjacent ?b_pos ?t_pos)
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