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

  ;; Move the player into an adjacent empty position.
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

  ;; Push a box from ?boxpos to ?topos. The player moves into the box's previous square.
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
      ;; After the push, the target (topos) is occupied by the box (not empty),
      ;; the player's previous cell becomes empty, and the box's old cell is occupied by the player (not empty).
      (not (empty ?topos))
      (empty ?from)
      (not (empty ?boxpos))
    )
  )
)