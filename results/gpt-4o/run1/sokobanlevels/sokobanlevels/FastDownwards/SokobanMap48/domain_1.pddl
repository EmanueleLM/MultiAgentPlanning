(define (domain sokoban)

  (:requirements :strips :typing)

  (:types
    position entity
  )

  (:predicates
    (at ?e - entity ?p - position)
    (goal ?p - position)
    (clear ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:constants
    player - entity
    box - entity
  )

  (:action move
    :parameters (?from ?to - position)
    :precondition (and (at player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to) (clear ?from) (not (clear ?to)))
  )

  (:action push
    :parameters (?box_pos ?player_pos ?new_box_pos - position)
    :precondition (and (at player ?player_pos) (at box ?box_pos) (clear ?new_box_pos) 
                       (adjacent ?player_pos ?box_pos) (adjacent ?box_pos ?new_box_pos))
    :effect (and (not (at box ?box_pos)) (at box ?new_box_pos) 
                 (not (at player ?player_pos)) (at player ?box_pos)
                 (clear ?box_pos) (not (clear ?new_box_pos)))
  )
)