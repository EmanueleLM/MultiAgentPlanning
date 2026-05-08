(define (domain jack_of_all_trades_sokoban)
  (:requirements :typing :negative-preconditions)
  (:types position box player)
  (:predicates
    (at_player ?p - position)
    (box_at ?b - box ?p - position)
    (goal_pos ?p - position)
    (next_up ?from - position ?to - position)
    (next_down ?from - position ?to - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (next_up ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (next_down ?from ?to)
      (not (box_at box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_up
    :parameters (?p - position ?bpos - position ?t - position)
    :precondition (and
      (at_player ?p)
      (box_at box1 ?bpos)
      (next_up ?p ?bpos)
      (next_up ?bpos ?t)
      (not (box_at box1 ?t))
    )
    :effect (and
      (not (box_at box1 ?bpos))
      (box_at box1 ?t)
      (not (at_player ?p))
      (at_player ?bpos)
    )
  )

  (:action push_down
    :parameters (?p - position ?bpos - position ?t - position)
    :precondition (and
      (at_player ?p)
      (box_at box1 ?bpos)
      (next_down ?p ?bpos)
      (next_down ?bpos ?t)
      (not (box_at box1 ?t))
    )
    :effect (and
      (not (box_at box1 ?bpos))
      (box_at box1 ?t)
      (not (at_player ?p))
      (at_player ?bpos)
    )
  )
)