(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types position)
  (:predicates
    (player_at ?p - position)
    (box_at ?p - position)
    (empty ?p - position)
    (goal ?p - position)
    (neighbor ?a - position ?b - position)
  )

  ;; move left: player moves into an adjacent empty position to the left
  (:action move_left
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (neighbor ?to ?from)
      (empty ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; move right: player moves into an adjacent empty position to the right
  (:action move_right
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (neighbor ?from ?to)
      (empty ?to)
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; push left: player pushes a box from box_pos into target to the left of the box
  (:action push_left
    :parameters (?player_pos - position ?box_pos - position ?target - position)
    :precondition (and
      (player_at ?player_pos)
      (neighbor ?box_pos ?player_pos)  ;; box is immediately left of player_pos
      (box_at ?box_pos)
      (neighbor ?target ?box_pos)       ;; target is left of the box
      (empty ?target)
    )
    :effect (and
      (box_at ?target)
      (not (box_at ?box_pos))
      (player_at ?box_pos)
      (not (player_at ?player_pos))
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?target))
    )
  )

  ;; push right: player pushes a box from box_pos into target to the right of the box
  (:action push_right
    :parameters (?player_pos - position ?box_pos - position ?target - position)
    :precondition (and
      (player_at ?player_pos)
      (neighbor ?player_pos ?box_pos)  ;; box is immediately right of player_pos
      (box_at ?box_pos)
      (neighbor ?box_pos ?target)       ;; target is right of the box
      (empty ?target)
    )
    :effect (and
      (box_at ?target)
      (not (box_at ?box_pos))
      (player_at ?box_pos)
      (not (player_at ?player_pos))
      (empty ?player_pos)
      (not (empty ?box_pos))
      (not (empty ?target))
    )
  )
)