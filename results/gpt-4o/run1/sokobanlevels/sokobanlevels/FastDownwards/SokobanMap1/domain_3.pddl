(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player_type box_type goal_type cell_type)
  (:predicates 
    (player_at ?p - player_type ?c - cell_type)
    (box_at ?b - box_type ?c - cell_type)
    (goal_at ?g - goal_type ?c - cell_type)
    (empty ?c - cell_type)
    (adjacent ?c1 - cell_type ?c2 - cell_type)
  )
  (:action MovePlayer
    :parameters (?p - player_type ?from - cell_type ?to - cell_type)
    :precondition (and
      (player_at ?p ?from)
      (empty ?to)
      (adjacent ?from ?to)
    )
    :effect (and
      (not (player_at ?p ?from))
      (player_at ?p ?to)
    )
  )
  (:action PushBox
    :parameters (?p - player_type ?b - box_type ?from - cell_type ?box_dest - cell_type ?player_dest - cell_type)
    :precondition (and
      (player_at ?p ?from)
      (box_at ?b ?box_dest)
      (adjacent ?from ?box_dest)
      (adjacent ?box_dest ?player_dest)
      (empty ?player_dest)
    )
    :effect (and
      (not (box_at ?b ?box_dest))
      (box_at ?b ?player_dest)
      (not (player_at ?p ?from))
      (player_at ?p ?box_dest)
    )
  )
)