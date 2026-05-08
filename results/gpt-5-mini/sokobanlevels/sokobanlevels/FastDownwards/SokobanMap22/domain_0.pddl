(define (domain sokoban)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent box cell)
  (:constants player - agent box1 - box)
  (:predicates
    (at ?a - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (at player ?to)
      (not (at player ?from))
    )
  )

  (:action push
    :parameters (?p_from - cell ?b_from - cell ?b_to - cell)
    :precondition (and
      (at player ?p_from)
      (box_at box1 ?b_from)
      (adjacent ?p_from ?b_from)
      (adjacent ?b_from ?b_to)
      (not (box_at box1 ?b_to))
    )
    :effect (and
      (box_at box1 ?b_to)
      (not (box_at box1 ?b_from))
      (at player ?b_from)
      (not (at player ?p_from))
    )
  )
)