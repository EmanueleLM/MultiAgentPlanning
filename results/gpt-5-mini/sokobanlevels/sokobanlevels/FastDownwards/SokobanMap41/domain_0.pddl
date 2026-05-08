(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (left_of ?c_from - cell ?c_to - cell)
    (right_of ?c_from - cell ?c_to - cell)
    (empty ?c - cell)
  )

  (:action move_left
    :parameters (?p - player ?c - cell ?c_left - cell)
    :precondition (and (player_at ?p ?c) (left_of ?c ?c_left) (empty ?c_left))
    :effect (and (not (player_at ?p ?c)) (player_at ?p ?c_left))
  )

  (:action move_right
    :parameters (?p - player ?c - cell ?c_right - cell)
    :precondition (and (player_at ?p ?c) (right_of ?c ?c_right) (empty ?c_right))
    :effect (and (not (player_at ?p ?c)) (player_at ?p ?c_right))
  )

  ;; Placeholder vertical moves (no up/down adjacency will be declared in this instance).
  (:action move_up
    :parameters (?p - player ?c - cell ?c_up - cell)
    :precondition (and (player_at ?p ?c) (right_of ?c ?c_up) (empty ?c_up))
    :effect (and (not (player_at ?p ?c)) (player_at ?p ?c_up))
  )

  (:action move_down
    :parameters (?p - player ?c - cell ?c_down - cell)
    :precondition (and (player_at ?p ?c) (left_of ?c ?c_down) (empty ?c_down))
    :effect (and (not (player_at ?p ?c)) (player_at ?p ?c_down))
  )

  (:action push_left
    :parameters (?p - player ?b - box ?c - cell ?c_box - cell ?c_box_left - cell)
    :precondition (and
      (player_at ?p ?c)
      (left_of ?c ?c_box)
      (box_at ?b ?c_box)
      (left_of ?c_box ?c_box_left)
      (empty ?c_box_left)
    )
    :effect (and
      (not (box_at ?b ?c_box))
      (box_at ?b ?c_box_left)
      (not (player_at ?p ?c))
      (player_at ?p ?c_box)
      (empty ?c_box)
      (not (empty ?c_box_left))
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?c - cell ?c_box - cell ?c_box_right - cell)
    :precondition (and
      (player_at ?p ?c)
      (right_of ?c ?c_box)
      (box_at ?b ?c_box)
      (right_of ?c_box ?c_box_right)
      (empty ?c_box_right)
    )
    :effect (and
      (not (box_at ?b ?c_box))
      (box_at ?b ?c_box_right)
      (not (player_at ?p ?c))
      (player_at ?p ?c_box)
      (empty ?c_box)
      (not (empty ?c_box_right))
    )
  )

  ;; Placeholder vertical pushes (no up/down adjacency will be declared in this instance).
  (:action push_up
    :parameters (?p - player ?b - box ?c - cell ?c_box - cell ?c_box_up - cell)
    :precondition (and
      (player_at ?p ?c)
      (right_of ?c ?c_box)
      (box_at ?b ?c_box)
      (right_of ?c_box ?c_box_up)
      (empty ?c_box_up)
    )
    :effect (and
      (not (box_at ?b ?c_box))
      (box_at ?b ?c_box_up)
      (not (player_at ?p ?c))
      (player_at ?p ?c_box)
      (empty ?c_box)
      (not (empty ?c_box_up))
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?c - cell ?c_box - cell ?c_box_down - cell)
    :precondition (and
      (player_at ?p ?c)
      (left_of ?c ?c_box)
      (box_at ?b ?c_box)
      (left_of ?c_box ?c_box_down)
      (empty ?c_box_down)
    )
    :effect (and
      (not (box_at ?b ?c_box))
      (box_at ?b ?c_box_down)
      (not (player_at ?p ?c))
      (player_at ?p ?c_box)
      (empty ?c_box)
      (not (empty ?c_box_down))
    )
  )
)