(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location actor)
  (:predicates
    (at ?actor - actor ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (is_goal ?loc - location)
  )
  
  (:action move_player
    :parameters (?from - location ?to - location)
    :precondition (and (at player ?from) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to))
  )

  (:action push_box
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition 
      (and (at player ?player_from) 
           (at box ?box_from) 
           (adjacent ?player_from ?box_from) 
           (adjacent ?box_from ?box_to) 
           (not (at player ?box_to)))
    :effect 
      (and (not (at player ?player_from)) 
           (not (at box ?box_from)) 
           (at player ?box_from)
           (at box ?box_to))
  )
)