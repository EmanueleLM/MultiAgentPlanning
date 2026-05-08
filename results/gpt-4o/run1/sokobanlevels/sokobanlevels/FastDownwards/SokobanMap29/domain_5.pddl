(define (domain sokoban)
  (:requirements :strips :typing)
  (:types player_type box_type position_type)

  (:predicates 
    (player_at ?p - position_type)
    (box_at ?b - box_type ?p - position_type)
    (goal_at ?p - position_type)
    (adjacent ?p1 ?p2 - position_type)
    (free ?p - position_type))

  (:action move_player_right
    :parameters (?from ?to - position_type)
    :precondition (and 
                   (player_at ?from)
                   (adjacent ?from ?to)
                   (free ?to))
    :effect (and 
             (not (player_at ?from))
             (player_at ?to)
             (free ?from)
             (not (free ?to))))

  (:action push_box_right
    :parameters (?player_from ?box_from ?box_to - position_type ?b - box_type)
    :precondition (and 
                   (player_at ?player_from)
                   (adjacent ?player_from ?box_from)
                   (adjacent ?box_from ?box_to)
                   (box_at ?b ?box_from)
                   (free ?box_to))
    :effect (and
             (not (player_at ?player_from))
             (player_at ?box_from)
             (not (box_at ?b ?box_from))
             (box_at ?b ?box_to)
             (not (free ?box_to))
             (free ?player_from)
             (free ?box_from)))
)