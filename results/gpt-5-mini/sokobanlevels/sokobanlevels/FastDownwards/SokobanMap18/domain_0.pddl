(define (domain sokoban_corridor)
  (:requirements :typing :negative-preconditions :strips)
  (:types position box player)
  (:predicates
    (at-player ?pl - player ?p - position)
    (at-box ?b - box ?p - position)
    (goal ?p - position)
    (north ?p1 - position ?p2 - position)
  )

  (:action move-north
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at-player ?pl ?from)
      (north ?to ?from)
      (not (at-box box1 ?to))
    )
    :effect (and
      (not (at-player ?pl ?from))
      (at-player ?pl ?to)
    )
  )

  (:action move-south
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at-player ?pl ?from)
      (north ?from ?to)
      (not (at-box box1 ?to))
    )
    :effect (and
      (not (at-player ?pl ?from))
      (at-player ?pl ?to)
    )
  )

  (:action push-north
    :parameters (?pl - player ?player_pos - position ?box_pos - position ?box_target - position)
    :precondition (and
      (at-player ?pl ?player_pos)
      (north ?box_pos ?player_pos)
      (at-box box1 ?box_pos)
      (north ?box_target ?box_pos)
      (not (at-box box1 ?box_target))
    )
    :effect (and
      (not (at-player ?pl ?player_pos))
      (not (at-box box1 ?box_pos))
      (at-player ?pl ?box_pos)
      (at-box box1 ?box_target)
    )
  )

  (:action push-south
    :parameters (?pl - player ?player_pos - position ?box_pos - position ?box_target - position)
    :precondition (and
      (at-player ?pl ?player_pos)
      (north ?player_pos ?box_pos)
      (at-box box1 ?box_pos)
      (north ?box_pos ?box_target)
      (not (at-box box1 ?box_target))
    )
    :effect (and
      (not (at-player ?pl ?player_pos))
      (not (at-box box1 ?box_pos))
      (at-player ?pl ?box_pos)
      (at-box box1 ?box_target)
    )
  )
)