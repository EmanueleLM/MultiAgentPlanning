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
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (clear ?to))
    :effect (and
      (not (at player ?from))
      (at player ?to))
  )
  
  (:action push
    :parameters (?from - cell ?box-pos - cell ?to - cell)
    :precondition (and
      (at player ?from)
      (at box ?box-pos)
      (adjacent ?from ?box-pos)
      (adjacent ?box-pos ?to)
      (clear ?to))
    :effect (and
      (not (at box ?box-pos))
      (at box ?to)
      (not (at player ?from))
      (at player ?box-pos))
  )
)