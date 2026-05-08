(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_t box_t pos_t)

  (:predicates
    (at_player ?p - pos_t)
    (at_box ?b - box_t ?p - pos_t)
    (is_goal ?p - pos_t)
    (adjacent ?p1 ?p2 - pos_t)
    (is_empty ?p - pos_t)
  )
  
  (:action move_player
    :parameters (?from ?to - pos_t)
    :precondition (and (adjacent ?from ?to) (at_player ?from) (is_empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push_box
    :parameters (?b - box_t ?from ?to ?next - pos_t)
    :precondition (and (at_box ?b ?from) (adjacent ?from ?to) 
                       (adjacent ?to ?next) (is_empty ?next) 
                       (at_player ?to))
    :effect (and (not (at_box ?b ?from)) (at_box ?b ?next) 
                 (not (at_player ?to)) (is_empty ?from) (is_empty ?to) (at_player ?from))
  )
)