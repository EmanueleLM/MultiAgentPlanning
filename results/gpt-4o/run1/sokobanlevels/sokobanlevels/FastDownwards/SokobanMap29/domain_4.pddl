(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type goal_type wall_type position_type)

  (:predicates 
    (player_at ?p - position_type)
    (box_at ?b - box_type ?p - position_type)
    (goal_at ?g - goal_type ?p - position_type)
    (wall_at ?p - position_type)
    (adjacent ?p1 ?p2 - position_type)
    (free ?p - position_type))

  (:action move_player
    :parameters (?from ?to - position_type)
    :precondition (and 
                   (player_at ?from)
                   (adjacent ?from ?to)
                   (free ?to)
                   (not (wall_at ?to)))
    :effect (and 
             (not (player_at ?from))
             (player_at ?to)
             (free ?from)
             (not (free ?to))))

  (:action push_box
    :parameters (?player_from ?box_from ?box_to - position_type ?b - box_type)
    :precondition (and 
                   (player_at ?player_from)
                   (adjacent ?player_from ?box_from)
                   (adjacent ?box_from ?box_to)
                   (box_at ?b ?box_from)
                   (free ?box_to)
                   (not (wall_at ?box_to)))
    :effect (and
             (not (player_at ?player_from))
             (player_at ?box_from)
             (not (box_at ?b ?box_from))
             (box_at ?b ?box_to)
             (not (free ?box_to))
             (free ?player_from)
             (free ?box_from)))
)