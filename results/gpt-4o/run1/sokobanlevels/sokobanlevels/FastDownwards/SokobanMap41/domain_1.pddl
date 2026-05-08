(define (domain sokoban)

  (:requirements :strips :typing :negative-preconditions)

  (:types player box grid_cell)

  (:predicates
    (at ?m - player ?l - grid_cell)
    (box-at ?b - box ?l - grid_cell)
    (adjacent ?l1 ?l2 - grid_cell)
    (free ?l - grid_cell)
    (goal-at ?l - grid_cell)
  )

  (:action move
    :parameters (?p - player ?from ?to - grid_cell)
    :precondition (and
      (at ?p ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?from ?to ?box_to - grid_cell)
    :precondition (and
      (at ?p ?from)
      (box-at ?b ?to)
      (adjacent ?from ?to)
      (adjacent ?to ?box_to)
      (free ?box_to)
    )
    :effect (and
      (not (box-at ?b ?to))
      (box-at ?b ?box_to)
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )
)