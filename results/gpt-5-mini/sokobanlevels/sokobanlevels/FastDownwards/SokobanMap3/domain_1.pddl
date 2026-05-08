(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types position agent box dir)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (adj ?p - position ?q - position ?d - dir)
    (free ?p - position)
  )

  ;; move: player steps into an adjacent position that has no box (free)
  (:action move
    :parameters (?from - position ?to - position ?d - dir)
    :precondition (and
      (player_at ?from)
      (adj ?from ?to ?d)
      (free ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  ;; push: player adjacent to box pushes it one cell further in same direction
  (:action push
    :parameters (?from - position ?boxpos - position ?to - position ?d - dir ?b - box)
    :precondition (and
      (player_at ?from)
      (box_at ?b ?boxpos)
      (adj ?from ?boxpos ?d)
      (adj ?boxpos ?to ?d)
      (free ?to)
    )
    :effect (and
      ;; player moves into the box's former position
      (not (player_at ?from))
      (player_at ?boxpos)
      ;; box moves forward
      (not (box_at ?b ?boxpos))
      (box_at ?b ?to)
      ;; update free flags: target becomes occupied by the box, box's former pos becomes free
      (not (free ?to))
      (free ?boxpos)
    )
  )
)