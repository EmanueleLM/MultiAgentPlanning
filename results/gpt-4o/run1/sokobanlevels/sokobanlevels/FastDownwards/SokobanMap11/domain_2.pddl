(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types movable fixed cell)
  
  (:predicates
    (at ?m - movable ?c - cell)
    (goal ?c - cell)
    (adjacent ?c1 ?c2 - cell)
    (free ?c - cell)
  )
  
  (:action move_player
    :parameters (?from ?to - cell)
    :precondition (and (at p1 ?from) (free ?to) (adjacent ?from ?to))
    :effect (and (not (at p1 ?from)) (at p1 ?to))
  )
  
  (:action push_box
    :parameters (?pfrom ?pto ?bfrom ?bto - cell)
    :precondition (and (at p1 ?pfrom) (at b1 ?bfrom) (free ?bto)
                       (adjacent ?pfrom ?bfrom) (adjacent ?bfrom ?bto))
    :effect (and (not (at p1 ?pfrom)) (at p1 ?bfrom)
                 (not (at b1 ?bfrom)) (at b1 ?bto))
  )
)