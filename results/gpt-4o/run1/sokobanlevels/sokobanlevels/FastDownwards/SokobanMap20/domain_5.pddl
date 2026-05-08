(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal tile)
  (:predicates 
    (at ?obj - (either player box) ?t - tile)
    (adjacent ?t1 - tile ?t2 - tile)
    (is_goal ?b - box ?g - goal)
    (is_goal_tile ?t - tile) ;; Additional predicate to use goals as tiles
  )
  (:action move
    :parameters (?p - player ?from - tile ?to - tile)
    :precondition (and 
        (at ?p ?from)
        (adjacent ?from ?to)
        (not (exists (?b - box) (at ?b ?to)))
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
        (not (exists (?b2 - box) (at ?b2 ?next)))
    )
    :effect (and
        (not (at ?p ?from))
        (at ?p ?to)
        (not (at ?b ?to))
        (at ?b ?next)
    )
  )
)