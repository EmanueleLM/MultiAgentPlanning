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
                   (not (wall_at ?to))
                   (free ?to))
    :effect (and 
             (not (player_at ?from))
             (player_at ?to)
             (free ?from)
             (not (free ?to))))

  (:action push_box
    :parameters (?player_from ?player_to ?box_from ?box_to - position_type)
    :precondition (and 
                   (player_at ?player_from)
                   (adjacent ?player_from ?player_to)
                   (adjacent ?player_to ?box_to)
                   (box_at ?b ?box_from)
                   (not (wall_at ?box_to))
                   (free ?box_to)
                   (not (free ?box_from))
                   (free ?player_to))
    :effect (and
             (not (player_at ?player_from))
             (player_at ?player_to)
             (not (free ?player_to))
             (free ?player_from)
             (box_at ?b ?box_to)
             (not (box_at ?b ?box_from))
             (free ?box_from)
             (not (free ?box_to))))
)