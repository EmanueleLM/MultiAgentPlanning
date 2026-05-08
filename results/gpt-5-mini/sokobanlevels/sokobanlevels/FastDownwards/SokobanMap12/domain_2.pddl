(define (domain sokoban_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell box player)
  (:constants
    box1 - box
    player1 - player
  )
  (:predicates
    (at_box ?b - box ?c - cell)
    (at_player ?p - player ?c - cell)
    (north_of ?north - cell ?south - cell)
  )

  (:action move_up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at_player player1 ?from)
      (north_of ?to ?from)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player player1 ?from))
      (at_player player1 ?to)
    )
  )

  (:action move_down
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at_player player1 ?from)
      (north_of ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player player1 ?from))
      (at_player player1 ?to)
    )
  )

  (:action push_up
    :parameters (?south - cell ?middle - cell ?north - cell)
    :precondition (and
      (at_player player1 ?south)
      (at_box box1 ?middle)
      (north_of ?middle ?south)
      (north_of ?north ?middle)
      (not (at_box box1 ?north))
    )
    :effect (and
      (not (at_box box1 ?middle))
      (at_box box1 ?north)
      (not (at_player player1 ?south))
      (at_player player1 ?middle)
    )
  )

  (:action push_down
    :parameters (?north - cell ?middle - cell ?south - cell)
    :precondition (and
      (at_player player1 ?north)
      (at_box box1 ?middle)
      (north_of ?middle ?north)
      (north_of ?south ?middle)
      (not (at_box box1 ?south))
    )
    :effect (and
      (not (at_box box1 ?middle))
      (at_box box1 ?south)
      (not (at_player player1 ?north))
      (at_player player1 ?middle)
    )
  )
)