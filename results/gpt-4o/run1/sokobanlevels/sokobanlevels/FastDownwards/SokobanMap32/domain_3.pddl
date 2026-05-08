(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types position)
  (:predicates
    (at_player ?p - position)
    (at_box ?p - position)
    (is_goal ?p - position)
    (is_wall ?p - position)
    (adjacent ?p1 ?p2 - position)
  )
  
  (:action move
    :parameters (?from ?to - position)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (not (is_wall ?to))
      (not (at_box ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )
  
  (:action push
    :parameters (?player_pos ?box_pos ?new_box_pos - position)
    :precondition (and
      (at_player ?player_pos)
      (at_box ?box_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?new_box_pos)
      (not (is_wall ?new_box_pos))
      (not (at_box ?new_box_pos))
    )
    :effect (and
      (not (at_player ?player_pos))
      (at_player ?box_pos)
      (not (at_box ?box_pos))
      (at_box ?new_box_pos)
    )
  )
)