(define (domain sokoban_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types pos box player)
  (:predicates
    (adj ?a - pos ?b - pos)
    (empty ?p - pos)
    (player_at ?p - pos)
    (box_at ?b - box ?p - pos)
    (goal ?p - pos)
  )

  (:action move
    :parameters (?from - pos ?to - pos)
    :precondition (and (player_at ?from) (adj ?from ?to) (empty ?to))
    :effect (and
              (not (player_at ?from)) (player_at ?to)
              (empty ?from) (not (empty ?to))
            )
  )

  (:action push
    :parameters (?from - pos ?box - box ?boxpos - pos ?target - pos)
    :precondition (and
                    (player_at ?from)
                    (adj ?from ?boxpos)
                    (box_at ?box ?boxpos)
                    (adj ?boxpos ?target)
                    (empty ?target)
                  )
    :effect (and
              (not (box_at ?box ?boxpos)) (box_at ?box ?target)
              (not (player_at ?from)) (player_at ?boxpos)
              (empty ?from)
              (not (empty ?boxpos))
              (not (empty ?target))
            )
  )
)