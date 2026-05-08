(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location agent box goal)
  (:predicates 
    (at ?obj - (either agent box) ?loc - location)
    (is_goal ?loc - location)
    (is_clear ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
  )
  
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at player ?from) (is_clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to))
  )

  (:action push
    :parameters (?player_loc ?box_loc ?to - location)
    :precondition (and (at player ?player_loc) (at box ?box_loc) 
                       (adjacent ?player_loc ?box_loc) (adjacent ?box_loc ?to) 
                       (is_clear ?to))
    :effect (and (not (at player ?player_loc)) (at player ?box_loc) 
                 (not (at box ?box_loc)) (at box ?to))
  )
)