(define (domain sokoban_vertical)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell box player)
  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (above ?higher - cell ?lower - cell)
    (goal_cell ?c - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (above ?to ?from)
      (not (box_at box1 ?to))
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (above ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (player_at ?to)
      (not (player_at ?from))
    )
  )

  (:action push_up
    :parameters (?p_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?p_from)
      (adjacent ?p_from ?box_from)
      (adjacent ?box_from ?box_to)
      (above ?box_to ?box_from)    ; box_to is above box_from (pushing up)
      (above ?box_from ?p_from)    ; player is below box_from
      (box_at box1 ?box_from)
      (not (box_at box1 ?box_to))
    )
    :effect (and
      (player_at ?box_from)
      (box_at box1 ?box_to)
      (not (player_at ?p_from))
      (not (box_at box1 ?box_from))
    )
  )

  (:action push_down
    :parameters (?p_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?p_from)
      (adjacent ?p_from ?box_from)
      (adjacent ?box_from ?box_to)
      (above ?box_from ?box_to)    ; box_to is below box_from (pushing down)
      (above ?p_from ?box_from)    ; player is above box_from
      (box_at box1 ?box_from)
      (not (box_at box1 ?box_to))
    )
    :effect (and
      (player_at ?box_from)
      (box_at box1 ?box_to)
      (not (player_at ?p_from))
      (not (box_at box1 ?box_from))
    )
  )
)