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

  (:action move-up
    :parameters (?from - pos ?to - pos)
    :precondition (and (player_at ?from) (adj ?to ?from) (empty ?to))
    :effect (and (not (player_at ?from)) (player_at ?to) (empty ?from) (not (empty ?to)))
  )

  (:action move-down
    :parameters (?from - pos ?to - pos)
    :precondition (and (player_at ?from) (adj ?from ?to) (empty ?to))
    :effect (and (not (player_at ?from)) (player_at ?to) (empty ?from) (not (empty ?to)))
  )

  (:action push-up
    :parameters (?player_pos - pos ?box - box ?box_pos - pos ?box_target - pos)
    :precondition (and
                    (player_at ?player_pos)
                    (adj ?box_pos ?player_pos)
                    (box_at ?box ?box_pos)
                    (adj ?box_target ?box_pos)
                    (empty ?box_target)
                  )
    :effect (and
              (not (box_at ?box ?box_pos)) (box_at ?box ?box_target)
              (not (player_at ?player_pos)) (player_at ?box_pos)
              (empty ?player_pos)
              (not (empty ?box_pos))
              (not (empty ?box_target))
            )
  )

  (:action push-down
    :parameters (?player_pos - pos ?box - box ?box_pos - pos ?box_target - pos)
    :precondition (and
                    (player_at ?player_pos)
                    (adj ?player_pos ?box_pos)
                    (box_at ?box ?box_pos)
                    (adj ?box_pos ?box_target)
                    (empty ?box_target)
                  )
    :effect (and
              (not (box_at ?box ?box_pos)) (box_at ?box ?box_target)
              (not (player_at ?player_pos)) (player_at ?box_pos)
              (empty ?player_pos)
              (not (empty ?box_pos))
              (not (empty ?box_target))
            )
  )
)