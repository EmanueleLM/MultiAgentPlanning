(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (empty ?p - position)
  )

  ;; player moves from ?from to adjacent empty ?to
  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; player pushes box ?b from ?box_pos into empty adjacent ?box_dest, player moves into box's former position
  (:action push
    :parameters (?player_pos - position ?box_pos - position ?box_dest - position ?b - box)
    :precondition (and
      (at_player ?player_pos)
      (at_box ?b ?box_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?box_dest)
      (empty ?box_dest)
    )
    :effect (and
      (not (at_player ?player_pos))
      (at_player ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?box_dest)
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?box_dest))
    )
  )
)