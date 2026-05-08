(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location agent box)

  (:predicates 
    (at ?obj - (either agent box) ?x - location ?y - location)
    (is_goal ?x - location ?y - location)
    (is_clear ?x - location ?y - location)
    (adjacent ?x1 - location ?y1 - location ?x2 - location ?y2 - location)
  )
  
  (:action move
    :parameters (?from_x ?from_y ?to_x ?to_y - location)
    :precondition (and (at player ?from_x ?from_y) 
                       (is_clear ?to_x ?to_y)
                       (adjacent ?from_x ?from_y ?to_x ?to_y))
    :effect (and (not (at player ?from_x ?from_y)) 
                 (at player ?to_x ?to_y))
  )

  (:action push
    :parameters (?player_x ?player_y ?box_x ?box_y ?to_x ?to_y - location)
    :precondition (and (at player ?player_x ?player_y) 
                       (at box ?box_x ?box_y) 
                       (adjacent ?player_x ?player_y ?box_x ?box_y)
                       (adjacent ?box_x ?box_y ?to_x ?to_y) 
                       (is_clear ?to_x ?to_y))
    :effect (and (not (at player ?player_x ?player_y))
                 (at player ?box_x ?box_y)
                 (not (at box ?box_x ?box_y))
                 (at box ?to_x ?to_y))
  )
)