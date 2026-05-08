(define (domain sokoban)
  (:requirements :strips :typing)
  (:types agent box goal wall location)

  (:predicates 
    (player_at ?l - location)
    (box_at ?b - box ?l - location)
    (goal_at ?g - goal ?l - location)
    (adjacent ?l1 ?l2 - location)
    (clear ?l - location)
    (box_on_goal ?b - box ?g - goal)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (clear ?to))
    :effect (and (not (player_at ?from)) (player_at ?to))
  )

  (:action push
    :parameters (?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and (player_at ?player_from) (box_at ?b ?box_from)
                       (adjacent ?player_from ?box_from) (adjacent ?box_from ?box_to)
                       (clear ?box_to))
    :effect (and (not (player_at ?player_from)) (not (box_at ?b ?box_from))
                 (player_at ?box_from) (box_at ?b ?box_to))
  )

  (:action push_to_goal
    :parameters (?b - box ?player_from ?box_from ?box_to - location ?g - goal)
    :precondition (and (player_at ?player_from) (box_at ?b ?box_from)
                       (goal_at ?g ?box_to)
                       (adjacent ?player_from ?box_from) (adjacent ?box_from ?box_to)
                       (clear ?box_to))
    :effect (and (not (player_at ?player_from)) (not (box_at ?b ?box_from))
                 (player_at ?box_from) (box_at ?b ?box_to) (box_on_goal ?b ?g))
  )
)