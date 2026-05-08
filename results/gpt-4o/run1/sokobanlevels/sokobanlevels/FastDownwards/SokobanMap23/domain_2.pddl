(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types object position)
  (:predicates
    (at ?obj - object ?pos - position)
    (goal_at ?pos - position)
    (free ?pos - position)
    (adjacent ?pos1 - position ?pos2 - position))

  (:action move_player
    :parameters (?from - position ?to - position)
    :precondition (and (at player ?from) (free ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to)))

  (:action push_box
    :parameters (?player_pos - position ?box_pos - position ?new_box_pos - position)
    :precondition (and (at player ?player_pos) (at box ?box_pos) (free ?new_box_pos)
                       (adjacent ?player_pos ?box_pos) (adjacent ?box_pos ?new_box_pos))
    :effect (and (not (at player ?player_pos)) (not (at box ?box_pos))
                 (at player ?box_pos) (at box ?new_box_pos) 
                 (not (free ?new_box_pos)) (free ?player_pos)))
)