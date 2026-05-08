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
    :parameters (?a - agent ?b - box ?pa - position ?pb - position ?pc - position)
    :precondition (and
      (player_at ?a ?pa)
      (box_at ?b ?pb)
      (up ?pa ?pb)
      (up ?pb ?pc)
      (free ?pc)
    )
    :effect (and
      (not (box_at ?b ?pb))
      (box_at ?b ?pc)
      (not (player_at ?a ?pa))
      (player_at ?a ?pb)
      (free ?pb)
      (not (free ?pc))
    )
  )

  (:action push_down
    :parameters (?a - agent ?b - box ?pa - position ?pb - position ?pc - position)
    :precondition (and
      (player_at ?a ?pa)
      (box_at ?b ?pb)
      (up ?pb ?pa)
      (up ?pc ?pb)
      (free ?pc)
    )
    :effect (and
      (not (box_at ?b ?pb))
      (box_at ?b ?pc)
      (not (player_at ?a ?pa))
      (player_at ?a ?pb)
      (free ?pb)
      (not (free ?pc))
    )
  )
)