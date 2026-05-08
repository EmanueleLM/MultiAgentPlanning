(define (domain sokoban_map49)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at_agent ?a - agent ?p - position)
    (at_box ?b - box ?p - position)
    (goal_pos ?p - position)
    (right_of ?r - position ?l - position)
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
    :parameters (?a - agent ?apos - position ?b - box ?bpos - position ?dest - position)
    :precondition (and
      (at_agent ?a ?apos)
      (right_of ?bpos ?apos)     ; box is right of agent
      (at_box ?b ?bpos)
      (right_of ?dest ?bpos)     ; destination is right of box
      (not (occupied ?dest))
    )
    :effect (and
      (not (at_agent ?a ?apos))
      (at_agent ?a ?bpos)
      (not (at_box ?b ?bpos))
      (at_box ?b ?dest)
      (occupied ?dest)
      (occupied ?bpos)           ; agent occupies former box position after push
      (not (occupied ?apos))
    )
  )

  (:action push-left
    :parameters (?a - agent ?apos - position ?b - box ?bpos - position ?dest - position)
    :precondition (and
      (at_agent ?a ?apos)
      (right_of ?apos ?bpos)     ; box is left of agent
      (at_box ?b ?bpos)
      (right_of ?bpos ?dest)     ; destination is left of box (i.e. bpos right_of dest)
      (not (occupied ?dest))
    )
    :effect (and
      (not (at_agent ?a ?apos))
      (at_agent ?a ?bpos)
      (not (at_box ?b ?bpos))
      (at_box ?b ?dest)
      (occupied ?dest)
      (occupied ?bpos)           ; agent occupies former box position after push
      (not (occupied ?apos))
    )
  )
)