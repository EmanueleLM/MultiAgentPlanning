(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell entity player box)
  (:predicates 
    (at ?e - entity ?c - cell)
    (adjacent ?c1 ?c2 - cell)
    (is_goal ?c - cell)
    (is_empty ?c - cell)
  )
  (:action move
    :parameters (?player - player ?from - cell ?to - cell)
    :precondition (and
      (at ?player ?from)
      (adjacent ?from ?to)
      (is_empty ?to))
    :effect (and
      (not (at ?player ?from))
      (at ?player ?to)
      (is_empty ?from)
      (not (is_empty ?to)))
  )
  (:action push
    :parameters (?player - player ?from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at ?player ?from)
      (adjacent ?from ?box_from)
      (at box ?box_from)
      (adjacent ?box_from ?box_to)
      (is_empty ?box_to))
    :effect (and
      (not (at box ?box_from))
      (at box ?box_to)
      (is_empty ?box_from)
      (not (is_empty ?box_to))
      (not (at ?player ?from))
      (at ?player ?box_from))
  )
)