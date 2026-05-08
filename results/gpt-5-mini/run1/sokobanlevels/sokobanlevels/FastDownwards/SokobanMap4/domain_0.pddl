(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box position)
  (:predicates
    (at ?a - agent ?p - position)
    (box_at ?b - box ?p - position)
    (is_goal ?p - position)
    (empty ?p - position)
    (adj ?p1 - position ?p2 - position)
  )

  (:action move
    :parameters (?a - agent ?from - position ?to - position)
    :precondition (and (at ?a ?from) (adj ?from ?to) (empty ?to))
    :effect (and
             (not (at ?a ?from))
             (at ?a ?to)
             (empty ?from)
             (not (empty ?to))
            )
  )

  (:action push
    :parameters (?a - agent ?b - box ?agent_pos - position ?box_pos - position ?box_dest - position)
    :precondition (and
                    (at ?a ?agent_pos)
                    (box_at ?b ?box_pos)
                    (adj ?agent_pos ?box_pos)
                    (adj ?box_pos ?box_dest)
                    (empty ?box_dest)
                   )
    :effect (and
             (not (at ?a ?agent_pos))
             (at ?a ?box_pos)
             (not (box_at ?b ?box_pos))
             (box_at ?b ?box_dest)
             (empty ?agent_pos)
             (not (empty ?box_dest))
            )
  )
)