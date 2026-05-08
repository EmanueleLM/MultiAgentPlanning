(define (domain sokoban_line)
  (:requirements :strips :typing)
  (:types player box position)

  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adj ?p1 - position ?p2 - position)
    (free ?p - position)
  )

  ;; simple move along adjacency (cannot move into a non-free position)
  (:action move
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
      (not (free ?to))
      (free ?from)
    )
  )

  ;; push box from ?boxpos into ?topos while player moves into box's previous position
  (:action push
    :parameters (?pl - player ?b - box ?from - position ?boxpos - position ?topos - position)
    :precondition (and
      (player_at ?pl ?from)
      (box_at ?b ?boxpos)
      (adj ?from ?boxpos)
      (adj ?boxpos ?topos)
      (free ?topos)
    )
    :effect (and
      (not (box_at ?b ?boxpos))
      (box_at ?b ?topos)
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxpos)
      (free ?from)
      (not (free ?topos))
    )
  )
)