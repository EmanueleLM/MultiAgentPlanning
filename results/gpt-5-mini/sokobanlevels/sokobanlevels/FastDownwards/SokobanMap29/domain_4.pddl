(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types box position)
  (:constants box1 - box)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )
  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )
  (:action push
    :parameters (?p_from - position ?b_pos - position ?to - position)
    :precondition (and
      (player_at ?p_from)
      (adjacent ?p_from ?b_pos)
      (box_at box1 ?b_pos)
      (adjacent ?b_pos ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (box_at box1 ?b_pos))
      (box_at box1 ?to)
      (not (player_at ?p_from))
      (player_at ?b_pos)
    )
  )
)