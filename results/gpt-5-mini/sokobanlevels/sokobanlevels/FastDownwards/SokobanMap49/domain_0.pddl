(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at_agent ?a - agent ?p - position)
    (at_box ?b - box ?p - position)
    (goal_pos ?p - position)
    (right_of ?right - position ?left - position)
    (occupied ?p - position)
  )

  (:action move-right
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_agent ?a ?from)
      (right_of ?to ?from)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
      (occupied ?to)
      (not (occupied ?from))
    )
  )

  (:action move-left
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and
      (at_agent ?a ?from)
      (right_of ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
      (occupied ?to)
      (not (occupied ?from))
    )
  )

  (:action push-right
    :parameters (?a - agent ?from - position ?b - box ?boxpos - position ?dest - position)
    :precondition (and
      (at_agent ?a ?from)
      (right_of ?boxpos ?from)
      (at_box ?b ?boxpos)
      (right_of ?dest ?boxpos)
      (not (occupied ?dest))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?boxpos)
      (not (at_box ?b ?boxpos))
      (at_box ?b ?dest)
      (occupied ?dest)
      (occupied ?boxpos)
      (not (occupied ?from))
    )
  )

  (:action push-left
    :parameters (?a - agent ?from - position ?b - box ?boxpos - position ?dest - position)
    :precondition (and
      (at_agent ?a ?from)
      (right_of ?from ?boxpos)
      (at_box ?b ?boxpos)
      (right_of ?boxpos ?dest)
      (not (occupied ?dest))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?boxpos)
      (not (at_box ?b ?boxpos))
      (at_box ?b ?dest)
      (occupied ?dest)
      (occupied ?boxpos)
      (not (occupied ?from))
    )
  )
)