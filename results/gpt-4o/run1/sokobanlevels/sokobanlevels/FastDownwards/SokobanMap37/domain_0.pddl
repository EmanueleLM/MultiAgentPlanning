(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type goal_type wall_type position)
  
  (:predicates
    (at ?p - player_type ?pos - position)
    (box_at ?b - box_type ?pos - position)
    (goal_at ?g - goal_type ?pos - position)
    (wall_at ?w - wall_type ?pos - position)
    (adjacent ?pos1 - position ?pos2 - position)
    (clear ?pos - position)
  )

  (:action move_player
    :parameters (?p - player_type ?from - position ?to - position)
    :precondition (and (at ?p ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action push_box
    :parameters (?p - player_type ?b - box_type ?from - position ?to - position ?b_to - position)
    :precondition (and (at ?p ?from) (box_at ?b ?to) (clear ?b_to) (adjacent ?from ?to) (adjacent ?to ?b_to))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (box_at ?b ?to)) (box_at ?b ?b_to))
  )
)