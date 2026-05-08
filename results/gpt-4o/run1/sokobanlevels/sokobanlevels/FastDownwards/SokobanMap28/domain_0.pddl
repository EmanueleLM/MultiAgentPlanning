(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_t box_t position_t)

  (:predicates
    (at_player ?p - position_t)
    (at_box ?b - box_t ?p - position_t)
    (is_goal ?p - position_t)
    (adjacent ?p1 ?p2 - position_t)
    (is_empty ?p - position_t)
    (is_wall ?p - position_t)
  )
  
  (:action move_player
    :parameters (?from ?to - position_t)
    :precondition (and (adjacent ?from ?to) (at_player ?from) (is_empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push_box
    :parameters (?b - box_t ?from ?to ?next - position_t)
    :precondition (and (at_box ?b ?from) (adjacent ?from ?to) 
                       (adjacent ?to ?next) (is_empty ?next) 
                       (at_player ?from))
    :effect (and (not (at_box ?b ?from)) (at_box ?b ?next) 
                 (at_player ?to) (not (at_player ?from)))
  )
)