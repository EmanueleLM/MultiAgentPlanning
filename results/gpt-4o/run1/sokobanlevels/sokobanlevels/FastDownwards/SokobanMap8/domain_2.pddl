(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (at ?e - (either player box) ?l - cell)
    (adjacent ?from - cell ?to - cell)
    (clear ?cell - cell)
    (goal ?cell - cell)
  )
  
  (:action move
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and
      (at ?p ?from)
      (clear ?to)
      (adjacent ?from ?to)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )
  
  (:action push
    :parameters (?p - player ?b - box ?from - cell ?to - cell ?new - cell)
    :precondition (and
      (at ?p ?from)
      (at ?b ?to)
      (clear ?new)
      (adjacent ?from ?to)
      (adjacent ?to ?new)
    )
    :effect (and
      (not (at ?b ?to))
      (not (at ?p ?from))
      (at ?b ?new)
      (at ?p ?to)
    )
  )
)