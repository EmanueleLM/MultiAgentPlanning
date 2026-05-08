(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location actor)
  (:predicates
    (at ?actor - actor ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (is_goal ?loc - location)
    (box_at ?loc - location)
    (player_at ?loc - location)
  )
  
  (:action move_player
    :parameters (?from - location ?to - location)
    :precondition 
      (and
        (player_at ?from)
        (adjacent ?from ?to)
        (not (box_at ?to))
      )
    :effect 
      (and 
        (not (player_at ?from)) 
        (player_at ?to)
      )
  )
  
  (:action push_box
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition 
      (and
        (player_at ?player_from)
        (box_at ?box_from)
        (adjacent ?player_from ?box_from)
        (adjacent ?box_from ?box_to)
        (not (box_at ?box_to))
        (not (player_at ?box_to))
      )
    :effect 
      (and
        (not (player_at ?player_from))
        (player_at ?box_from)
        (not (box_at ?box_from))
        (box_at ?box_to)
      )
  )
)