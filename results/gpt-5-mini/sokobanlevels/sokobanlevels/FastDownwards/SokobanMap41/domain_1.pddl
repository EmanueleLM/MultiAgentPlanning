(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)

  (:predicates
    (player_at ?p - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (empty ?c - cell)
    (right_of ?c_from - cell ?c_to - cell)
    (left_of ?c_from - cell ?c_to - cell)
  )

  ;; horizontal move actions
  (:action move_right
    :parameters (?p - player ?c - cell ?c_right - cell)
    :precondition (and (player_at ?p ?c) (right_of ?c ?c_right) (empty ?c_right))
    :effect (and
      (not (player_at ?p ?c))
      (player_at ?p ?c_right)
      (empty ?c)
      (not (empty ?c_right))
    )
  )

  (:action move_left
    :parameters (?p - player ?c - cell ?c_left - cell)
    :precondition (and (player_at ?p ?c) (left_of ?c ?c_left) (empty ?c_left))
    :effect (and
      (not (player_at ?p ?c))
      (player_at ?p ?c_left)
      (empty ?c)
      (not (empty ?c_left))
    )
  )

  ;; push actions (player pushes a box into adjacent empty cell)
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
      (empty ?c)
      (not (empty ?c_box_right))
    )
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
      (empty ?c)
      (not (empty ?c_box_left))
    )
  )
)