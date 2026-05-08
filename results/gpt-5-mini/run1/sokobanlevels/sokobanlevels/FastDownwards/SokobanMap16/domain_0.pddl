(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types position agent box)
  (:predicates
    (player_at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (free ?p - position)
    (up ?from - position ?to - position)
    (goal_pos ?p - position)
  )

  (:action move_up
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and (player_at ?a ?from) (up ?from ?to) (free ?to))
    :effect (and (not (player_at ?a ?from)) (player_at ?a ?to))
  )

  (:action move_down
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and (player_at ?a ?from) (up ?to ?from) (free ?to))
    :effect (and (not (player_at ?a ?from)) (player_at ?a ?to))
  )

  (:action push_up
    :parameters (?a - agent ?b - box ?p_under - position ?p_box - position ?p_above - position)
    :precondition (and
      (player_at ?a ?p_under)
      (box_at ?b ?p_box)
      (up ?p_under ?p_box)
      (up ?p_box ?p_above)
      (free ?p_above)
    )
    :effect (and
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_above)
      (not (player_at ?a ?p_under))
      (player_at ?a ?p_box)
      (free ?p_box)
      (not (free ?p_above))
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?p_over - position ?p_box - position ?p_below - position)
    :precondition (and
      (player_at ?a ?p_over)
      (box_at ?b ?p_box)
      (up ?p_below ?p_box)
      (up ?p_box ?p_over)
      (free ?p_below)
    )
    :effect (and
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_below)
      (not (player_at ?a ?p_over))
      (player_at ?a ?p_box)
      (free ?p_box)
      (not (free ?p_below))
    )
  )
)