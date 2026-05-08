(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location agent movable target)
  (:predicates 
    (at ?obj - object ?loc - location)
    (is_goal ?loc - location)
    (is_clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (wall ?loc - location)
  )
  
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at player ?from) (is_clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to))
  )

  (:action push
    :parameters (?from ?box_loc ?to - location)
    :precondition (and (at player ?from) (at box ?box_loc) (adjacent ?from ?box_loc) (adjacent ?box_loc ?to) (is_clear ?to))
    :effect (and (not (at player ?from)) (at player ?box_loc) (not (at box ?box_loc)) (at box ?to))
  )
)