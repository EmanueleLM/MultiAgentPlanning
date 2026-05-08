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
      (at player-1 ?from)
      (adjacent ?from ?to)
      (clear ?to))
    :effect (and
      (not (at player-1 ?from))
      (at player-1 ?to))
  )
  
  (:action push
    :parameters (?from - cell ?box-pos - cell ?to - cell)
    :precondition (and
      (at player-1 ?from)
      (at box-1 ?box-pos)
      (adjacent ?from ?box-pos)
      (adjacent ?box-pos ?to)
      (clear ?to))
    :effect (and
      (not (at box-1 ?box-pos))
      (at box-1 ?to)
      (not (at player-1 ?from))
      (at player-1 ?box-pos))
  )
)