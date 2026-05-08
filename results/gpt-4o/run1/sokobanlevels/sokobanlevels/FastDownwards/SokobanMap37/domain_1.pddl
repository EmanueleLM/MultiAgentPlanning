(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type goal_type position)

  (:predicates
    (at ?p - player_type ?pos - position)
    (box_at ?b - box_type ?pos - position)
    (goal ?pos - position)
    (adjacent ?pos1 - position ?pos2 - position)
    (clear ?pos - position)
  )

  (:action move_player
    :parameters (?p - player_type ?from - position ?to - position)
    :precondition (and (at ?p ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action push_box
    :parameters (?p - player_type ?b - box_type ?from - position ?to1 - position ?to2 - position)
    :precondition (and (at ?p ?from) (box_at ?b ?to1) (clear ?to2) (adjacent ?from ?to1) (adjacent ?to1 ?to2))
    :effect (and (not (at ?p ?from)) (at ?p ?to1)
                 (not (box_at ?b ?to1)) (box_at ?b ?to2))
  )
)