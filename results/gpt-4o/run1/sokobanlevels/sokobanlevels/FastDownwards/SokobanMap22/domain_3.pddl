(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity cell)
  (:predicates
    (at ?entity - entity ?cell - cell)
    (adjacent ?from - cell ?to - cell)
    (clear ?cell - cell)
    (goal-cell ?cell - cell)
    (player ?entity - entity)
    (box ?entity - entity)
  )
  
  (:action move
    :parameters (?p - entity ?from - cell ?to - cell)
    :precondition (and
      (player ?p)
      (at ?p ?from)
      (adjacent ?from ?to)
      (clear ?to))
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to))
  )
  
  (:action push
    :parameters (?p - entity ?from - cell ?b - entity ?box-pos - cell ?to - cell)
    :precondition (and
      (player ?p)
      (box ?b)
      (at ?p ?from)
      (at ?b ?box-pos)
      (adjacent ?from ?box-pos)
      (adjacent ?box-pos ?to)
      (clear ?to))
    :effect (and
      (not (at ?b ?box-pos))
      (at ?b ?to)
      (not (at ?p ?from))
      (at ?p ?box-pos))
  )
)