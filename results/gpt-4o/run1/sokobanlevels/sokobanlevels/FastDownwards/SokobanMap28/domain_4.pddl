(define (domain sokoban)
  (:requirements :strips :typing)

  (:types player_t box_t pos_t)

  (:predicates
    (at_player ?p - pos_t)
    (at_box ?b - box_t ?p - pos_t)
    (is_goal ?p - pos_t)
    (adjacent ?p1 ?p2 - pos_t)
    (empty ?p - pos_t)
  )
  
  (:action move_player
    :parameters (?from ?to - pos_t)
    :precondition (and (adjacent ?from ?to) (at_player ?from) (empty ?to))
    :effect (and (not (at_player ?from)) (at_player ?to) (empty ?from) (not (empty ?to)))
  )

  (:action push_box
    :parameters (?b - box_t ?player_from ?box_from ?box_to - pos_t)
    :precondition (and (at_box ?b ?box_from) (adjacent ?player_from ?box_from)
                       (adjacent ?box_from ?box_to) (empty ?box_to) 
                       (at_player ?player_from))
    :effect (and (not (at_box ?b ?box_from)) (at_box ?b ?box_to) 
                 (not (at_player ?player_from)) (at_player ?box_from)
                 (empty ?box_from) (not (empty ?box_to)) (empty ?player_from))
  )
)