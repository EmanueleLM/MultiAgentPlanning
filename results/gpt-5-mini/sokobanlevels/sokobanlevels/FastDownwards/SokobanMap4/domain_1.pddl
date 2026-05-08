(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell box player)
  (:predicates
    (at_player ?p - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (north ?from - cell ?to - cell)
    (south ?from - cell ?to - cell)
    (goal ?c - cell)
    (clear ?c - cell)
  )

  (:action move_north
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and (at_player ?p ?from) (north ?from ?to) (clear ?to))
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_south
    :parameters (?p - player ?from - cell ?to - cell)
    :precondition (and (at_player ?p ?from) (south ?from ?to) (clear ?to))
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action push_north
    :parameters (?p - player ?b - box ?from - cell ?box_cell - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (north ?from ?box_cell)
      (at_box ?b ?box_cell)
      (north ?box_cell ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?to)
      (not (clear ?to))
      (clear ?box_cell)
      (not (at_player ?p ?from))
      (at_player ?p ?box_cell)
    )
  )

  (:action push_south
    :parameters (?p - player ?b - box ?from - cell ?box_cell - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (south ?from ?box_cell)
      (at_box ?b ?box_cell)
      (south ?box_cell ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_box ?b ?box_cell))
      (at_box ?b ?to)
      (not (clear ?to))
      (clear ?box_cell)
      (not (at_player ?p ?from))
      (at_player ?p ?box_cell)
    )
  )
)