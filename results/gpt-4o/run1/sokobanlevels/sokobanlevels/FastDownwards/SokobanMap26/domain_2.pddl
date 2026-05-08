(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location movable)
  (:predicates 
    (at ?entity - movable ?loc - location)
    (goal_at ?loc - location)
    (is_wall ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (box_at_goal ?loc - location)
  )
  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and
      (at player ?from)
      (adjacent ?from ?to)
      (not (is_wall ?to))
      (not (at box ?to))
    )
    :effect (and
      (not (at player ?from))
      (at player ?to)
    )
  )
  (:action push
    :parameters (?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at player ?player_from)
      (at box ?box_from)
      (adjacent ?player_from ?box_from)
      (adjacent ?box_from ?box_to)
      (not (is_wall ?box_to))
      (not (at box ?box_to))
    )
    :effect (and
      (not (at box ?box_from))
      (at box ?box_to)
      (not (at player ?player_from))
      (at player ?box_from)
    )
  )
  (:action check_goal
    :parameters (?loc - location)
    :precondition (and
      (goal_at ?loc)
      (at box ?loc)
    )
    :effect (box_at_goal ?loc)
  )
)