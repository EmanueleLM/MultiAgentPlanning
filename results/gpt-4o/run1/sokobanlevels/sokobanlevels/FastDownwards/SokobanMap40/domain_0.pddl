(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box goal wall location)

  (:predicates 
    (player_at ?l - location)
    (box_at ?b - box ?l - location)
    (goal_at ?g - goal ?l - location)
    (wall_at ?l - wall)
    (adjacent ?l1 ?l2 - location)
    (clear ?l - location)
    (box_on_goal ?b - box ?g - goal)
  )

  (:action move_up
    :parameters (?from ?to - location)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_down
    :parameters (?from ?to - location)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_left
    :parameters (?from ?to - location)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action move_right
    :parameters (?from ?to - location)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push_box
    :parameters (?b - box ?player_from ?player_to ?box_to - location)
    :precondition (and (player_at ?player_from) (box_at ?b ?player_to)
                       (adjacent ?player_from ?player_to) (adjacent ?player_to ?box_to)
                       (clear ?box_to))
    :effect (and (not (player_at ?player_from)) (not (box_at ?b ?player_to))
                 (player_at ?player_to) (box_at ?b ?box_to)
                 (when (goal_at goal1 ?box_to) (box_on_goal ?b goal1))
                 )
  )
)