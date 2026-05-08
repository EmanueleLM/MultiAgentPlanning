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
              ;; move box
              (not (box_at ?box ?boxpos)) (box_at ?box ?target)
              ;; player moves into the box's former position
              (not (player_at ?from)) (player_at ?boxpos)
              ;; source of the player becomes empty
              (empty ?from)
              ;; target (where the box moves) becomes occupied (not empty)
              (not (empty ?target))
              ;; the box's former position is now occupied by the player (not empty)
              (not (empty ?boxpos))
            )
  )
)