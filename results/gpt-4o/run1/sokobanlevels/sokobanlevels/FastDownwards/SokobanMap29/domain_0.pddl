(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type goal_type wall_type position_type)

  (:predicates 
    (player_at ?p - position_type)
    (box_at ?b - box_type ?p - position_type)
    (goal_at ?g - goal_type ?p - position_type)
    (wall_at ?w - wall_type ?p - position_type)
    (adjacent ?p1 ?p2 - position_type))

  (:action move_player
    :parameters (?from ?to - position_type)
    :precondition (and 
                   (player_at ?from)
                   (adjacent ?from ?to)
                   (not (wall_at ?to))
                   (forall (?b - box_type) (not (box_at ?b ?to))))
    :effect (and 
             (not (player_at ?from))
             (player_at ?to)))

  (:action push_box
    :parameters (?player_from ?player_to ?box_to - position_type)
    :precondition (and 
                   (player_at ?player_from)
                   (adjacent ?player_from ?player_to)
                   (adjacent ?player_to ?box_to)
                   (not (wall_at ?box_to))
                   (exists (?b - box_type) (box_at ?b ?player_to)))
    :effect (and
             (not (player_at ?player_from))
             (player_at ?player_to)
             (forall (?b - box_type) 
                     (when (box_at ?b ?player_to)
                           (and 
                            (not (box_at ?b ?player_to))
                            (box_at ?b ?box_to))))))
)