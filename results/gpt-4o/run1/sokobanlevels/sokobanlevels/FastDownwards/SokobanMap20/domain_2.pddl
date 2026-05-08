(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal tile)
  (:predicates 
    (at ?obj - (either player box) ?t - tile)
    (adjacent ?t1 - tile ?t2 - tile)
    (is_goal ?b - box ?g - tile)
  )
  (:action move
    :parameters (?p - player ?from - tile ?to - tile)
    :precondition (and 
        (at ?p ?from)
        (adjacent ?from ?to)
        (not (at ?b - box ?to)) ; Ensure no box is at the destination
    )
    :effect (and
        (not (at ?p ?from))
        (at ?p ?to)
    )
  )
  (:action push
    :parameters (?p - player ?b - box ?from - tile ?to - tile ?next - tile)
    :precondition (and
        (at ?p ?from)
        (at ?b ?to)
        (adjacent ?from ?to)
        (adjacent ?to ?next)
        (not (at ?b - box ?next)) ; Next space must be empty
    )
    :effect (and
        (not (at ?p ?from))
        (at ?p ?to)
        (not (at ?b ?to))
        (at ?b ?next)
    )
  )
)