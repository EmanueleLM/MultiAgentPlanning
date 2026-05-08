(define (domain sokoban_map9)
  (:requirements :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (empty ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (empty ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action push
    :parameters (?from - position ?boxpos - position ?topos - position ?b - box)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?boxpos)
      (box_at ?b ?boxpos)
      (adjacent ?boxpos ?topos)
      (empty ?topos)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?boxpos)
      (not (box_at ?b ?boxpos))
      (box_at ?b ?topos)
      (not (empty ?topos))
      (empty ?from)
      (not (empty ?boxpos))
    )
  )
)