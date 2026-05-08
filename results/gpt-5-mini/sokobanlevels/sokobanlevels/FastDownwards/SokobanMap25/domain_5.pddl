(define (domain sokoban_map25)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box)

  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (occupied ?p - position)    ; true if a box occupies this position
    (goal ?p - position)
    (adj ?p - position ?q - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?player_from - position ?box_pos - position ?target - position ?b - box)
    :precondition (and
      (player_at ?player_from)
      (box_at ?b ?box_pos)
      (adj ?player_from ?box_pos)
      (adj ?box_pos ?target)
      (not (occupied ?target))
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_pos)
      (not (box_at ?b ?box_pos))
      (box_at ?b ?target)
      (not (occupied ?box_pos))
      (occupied ?target)
    )
  )
)