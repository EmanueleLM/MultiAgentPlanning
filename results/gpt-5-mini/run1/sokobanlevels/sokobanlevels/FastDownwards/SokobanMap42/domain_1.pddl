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
      (adj_left ?to ?from)      ; ?to is immediately left of ?from
      (free ?to)                ; no box at ?to
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
      (adj_left ?from ?to)      ; ?to is immediately right of ?from
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
      (adj_left ?box_pos ?a_pos)   ; box is left of agent
      (adj_left ?box_dest ?box_pos) ; destination is left of box
      (free ?box_dest)              ; destination has no box
    )
    :effect (and
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_dest)
      (not (at ?a ?a_pos))
      (at ?a ?box_pos)
      (free ?box_pos)
      (not (free ?box_dest))
    )
  )

  (:action push_right
    :parameters (?a - agent ?b - box ?a_pos - position ?box_pos - position ?box_dest - position)
    :precondition (and
      (at ?a ?a_pos)
      (box_at ?b ?box_pos)
      (adj_left ?a_pos ?box_pos)    ; box is right of agent
      (adj_left ?box_pos ?box_dest)  ; destination is right of box
      (free ?box_dest)
    )
    :effect (and
      (not (box_at ?b ?box_pos))
      (box_at ?b ?box_dest)
      (not (at ?a ?a_pos))
      (at ?a ?box_pos)
      (free ?box_pos)
      (not (free ?box_dest))
    )
  )
)