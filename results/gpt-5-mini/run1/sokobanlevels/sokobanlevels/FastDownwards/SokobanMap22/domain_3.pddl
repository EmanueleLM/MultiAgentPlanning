(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types position box player)

  (:predicates
    (at_player ?p - position)
    (box_at ?b - box ?p - position)
    (occupied ?p - position)
    (goal_pos ?p - position)
    (next_up ?from - position ?to - position)
    (next_down ?from - position ?to - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (next_up ?from ?to)
      (not (occupied ?to))
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
      (not (occupied ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push_up
    :parameters (?ppos - position ?b - box ?bpos - position ?t - position)
    :precondition (and
      (at_player ?ppos)
      (box_at ?b ?bpos)
      (next_up ?ppos ?bpos)
      (next_up ?bpos ?t)
      (not (occupied ?t))
    )
    :effect (and
      (not (box_at ?b ?bpos))
      (box_at ?b ?t)
      (not (occupied ?bpos))
      (occupied ?t)
      (not (at_player ?ppos))
      (at_player ?bpos)
    )
  )

  (:action push_down
    :parameters (?ppos - position ?b - box ?bpos - position ?t - position)
    :precondition (and
      (at_player ?ppos)
      (box_at ?b ?bpos)
      (next_down ?ppos ?bpos)
      (next_down ?bpos ?t)
      (not (occupied ?t))
    )
    :effect (and
      (not (box_at ?b ?bpos))
      (box_at ?b ?t)
      (not (occupied ?bpos))
      (occupied ?t)
      (not (at_player ?ppos))
      (at_player ?bpos)
    )
  )
)