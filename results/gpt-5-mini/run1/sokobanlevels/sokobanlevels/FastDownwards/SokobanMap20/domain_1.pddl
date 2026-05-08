(define (domain sokoban_line)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)

  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adj ?p1 - position ?p2 - position)
  )

  ;; simple move along adjacency (cannot move into a box)
  (:action move
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj ?from ?to)
      (not (box_at ?pl ?to)) ;; syntactic placeholder to ensure not using player_at in negation; will be false since players are distinct objects
      (not (box_at ?dummy ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; push box from ?to into ?target while player moves into box's previous position
  (:action push
    :parameters (?pl - player ?b - box ?from - position ?to - position ?target - position)
    :precondition (and
      (player_at ?pl ?from)
      (box_at ?b ?to)
      (adj ?from ?to)
      (adj ?to ?target)
      (not (box_at ?dummy ?target))
    )
    :effect (and
      (not (box_at ?b ?to))
      (box_at ?b ?target)
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )
)