(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity grid_cell)
  (:predicates
    (at ?entity - entity ?cell - grid_cell)
    (is_free ?cell - grid_cell)
    (is_wall ?cell - grid_cell)
    (is_goal ?cell - grid_cell)
    (box_on_goal)
  )
  
  (:action move_player
    :parameters (?from - grid_cell ?to - grid_cell)
    :precondition (and (at player ?from) (is_free ?to))
    :effect (and (at player ?to) (not (at player ?from)))
  )
  
  (:action push_box_left
    :parameters (?player - grid_cell ?box_from - grid_cell ?box_to - grid_cell)
    :precondition (and
                    (at player ?player)
                    (at box1 ?box_from)
                    (is_free ?box_to)
                    (adjacent_left ?player ?box_from)
                    (adjacent_left ?box_from ?box_to))
    :effect (and
              (at box1 ?box_to)
              (not (at box1 ?box_from))
              (at player ?box_from)
              (not (at player ?player))
              (when (is_goal ?box_to) (box_on_goal)))
  )

  (:action push_box_right
    :parameters (?player - grid_cell ?box_from - grid_cell ?box_to - grid_cell)
    :precondition (and
                    (at player ?player)
                    (at box1 ?box_from)
                    (is_free ?box_to)
                    (adjacent_right ?player ?box_from)
                    (adjacent_right ?box_from ?box_to))
    :effect (and
              (at box1 ?box_to)
              (not (at box1 ?box_from))
              (at player ?box_from)
              (not (at player ?player))
              (when (is_goal ?box_to) (box_on_goal)))
  )
)