(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal position)
  
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (goal_at ?p - position)
    (wall_at ?p - position)
    (adjacent ?p1 ?p2 - position)
  )
  
  (:action move_player
    :parameters (?from ?to - position)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)) (not (box_at ?to)))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push_box
    :parameters (?player_pos ?box_from ?box_to - position)
    :precondition (and (player_at ?player_pos) 
                       (box_at ?box_from)
                       (adjacent ?player_pos ?box_from)
                       (adjacent ?box_from ?box_to)
                       (not (wall_at ?box_to))
                       (not (box_at ?box_to)))
    :effect (and (not (box_at ?box_from))
                 (box_at ?box_to)
                 (not (player_at ?player_pos))
                 (player_at ?box_from))
  )
)