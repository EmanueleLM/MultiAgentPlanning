(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal tile wall)
  (:predicates 
    (at ?x - (either player box) ?t - tile)
    (is_goal ?t - tile)
    (adjacent ?t1 - tile ?t2 - tile)
    (empty ?t - tile)
  )
  (:action move
    :parameters (?p - player ?from - tile ?to - tile)
    :precondition (and 
        (at ?p ?from)
        (adjacent ?from ?to)
        (empty ?to)
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
        (empty ?next)
    )
    :effect (and
        (not (at ?p ?from))
        (at ?p ?to)
        (not (at ?b ?to))
        (at ?b ?next)
    )
  )
)