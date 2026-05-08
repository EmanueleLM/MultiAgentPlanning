(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box)

  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (occupied ?p - position) ;; true iff a box occupies this position
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
    :parameters (?p_player - position ?p_box - position ?p_target - position ?b - box)
    :precondition (and
      (player_at ?p_player)
      (box_at ?b ?p_box)
      (adj ?p_player ?p_box)
      (adj ?p_box ?p_target)
      (not (occupied ?p_target))
    )
    :effect (and
      (not (player_at ?p_player))
      (player_at ?p_box)
      (not (box_at ?b ?p_box))
      (box_at ?b ?p_target)
      (not (occupied ?p_box))
      (occupied ?p_target)
    )
  )
)