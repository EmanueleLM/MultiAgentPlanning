(define (domain sokoban_jack_of_all_trades)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent box position)

  (:predicates
    (at_agent ?a - agent ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (above ?p1 - position ?p2 - position)
    (clear_path ?p1 - position ?p2 - position)
  )

  (:action push_box_to_goal_from_above
    :parameters (?a - agent ?b - box ?pa - position ?pb - position ?pg - position)
    :precondition (and
      (at_agent ?a ?pa)
      (at_box ?b ?pb)
      (goal ?pg)
      (above ?pa ?pb)
      (above ?pb ?pg)
      (clear_path ?pa ?pg)
    )
    :effect (and
      (not (at_box ?b ?pb))
      (at_box ?b ?pg)
      (not (at_agent ?a ?pa))
      (at_agent ?a ?pb)
    )
  )
)