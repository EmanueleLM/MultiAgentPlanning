(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity location)
  (:predicates
    (at ?entity - entity ?loc - location)
    (is_goal ?loc - location)
    (free ?loc - location)
    (adj ?loc1 - location ?loc2 - location)
  )
  
  (:action move
    :parameters (?agent - entity ?from - location ?to - location)
    :precondition (and (at ?agent ?from) (free ?to) (adj ?from ?to))
    :effect (and (at ?agent ?to) (not (at ?agent ?from)))
  )

  (:action push
    :parameters (?agent - entity ?box - entity ?from_agent - location ?from_box - location ?to_box - location)
    :precondition (and 
      (at ?agent ?from_agent) 
      (at ?box ?from_box) 
      (free ?to_box) 
      (adj ?from_agent ?from_box) 
      (adj ?from_box ?to_box)
    )
    :effect (and 
      (at ?box ?to_box)
      (not (at ?box ?from_box))
      (at ?agent ?from_box)
      (not (at ?agent ?from_agent))
    )
  )
)