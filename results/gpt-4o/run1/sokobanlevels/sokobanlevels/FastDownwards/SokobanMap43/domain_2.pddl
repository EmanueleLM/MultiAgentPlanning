(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal location wall - entity)
  
  (:predicates
    (at_player ?loc - location)
    (at_box ?box - box ?loc - location)
    (at_goal ?loc - location)
    (player_on_goal ?loc - location)
    (box_on_goal ?box - box)
    (clear ?loc - location)
    (adjacent ?loc1 ?loc2 - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?box - box ?pfrom ?pto - location ?bfrom ?bto - location)
    :precondition (and 
      (at_player ?pfrom)
      (at_box ?box ?bfrom)
      (clear ?bto)
      (adjacent ?pfrom ?bfrom)
      (adjacent ?bfrom ?bto))
    :effect (and 
      (not (at_player ?pfrom)) 
      (not (at_box ?box ?bfrom))
      (at_player ?bfrom)
      (at_box ?box ?bto)
      (clear ?bfrom)
      (not (clear ?bto))
      (when (at_goal ?bto) (box_on_goal ?box)))
  )
)