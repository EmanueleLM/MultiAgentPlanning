(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adj_left ?left - position ?right - position)
    (free ?p - position)
  )

  (:action move_left
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at ?a ?from)
      (adj_left ?to ?from)
      (free ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action move_right
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at ?a ?from)
      (adj_left ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action push_left
    :parameters (?a - agent ?b - box ?a_pos - position ?box_pos - position ?box_dest - position)
    :precondition (and
      (at ?a ?a_pos)
      (box_at ?b ?box_pos)
      (adj_left ?box_pos ?a_pos)
      (adj_left ?box_dest ?box_pos)
      (free ?box_dest)
    )
    :effect (and
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_dest)
      (not (at ?a ?a_pos))
      (at ?a ?box_pos)
      (not (free ?box_dest))
      (free ?box_pos)
    )
  )

  (:action push_right
    :parameters (?a - agent ?b - box ?a_pos - position ?box_pos - position ?box_dest - position)
    :precondition (and
      (at ?a ?a_pos)
      (box_at ?b ?box_pos)
      (adj_left ?a_pos ?box_pos)
      (adj_left ?box_pos ?box_dest)
      (free ?box_dest)
    )
    :effect (and
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_dest)
      (not (at ?a ?a_pos))
      (at ?a ?box_pos)
      (not (free ?box_dest))
      (free ?box_pos)
    )
  )
)