(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate position)
  (:predicates
    (at ?a - agent ?p - position)
    (box-at ?b - crate ?p - position)
    (goal ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (clear ?p - position)
    (floor ?p - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at player1 ?from)
      (adjacent ?from ?to)
      (floor ?to)
      (clear ?to)
    )
    :effect (and
      (not (at player1 ?from))
      (at player1 ?to)
    )
  )

  (:action push
    :parameters (?player_pos - position ?box_pos - position ?dest_pos - position)
    :precondition (and
      (at player1 ?player_pos)
      (adjacent ?player_pos ?box_pos)
      (adjacent ?box_pos ?dest_pos)
      (floor ?dest_pos)
      (clear ?dest_pos)
      (box-at box1 ?box_pos)
    )
    :effect (and
      (not (at player1 ?player_pos))
      (at player1 ?box_pos)
      (not (box-at box1 ?box_pos))
      (box-at box1 ?dest_pos)
      (not (clear ?dest_pos))
      (clear ?box_pos)
    )
  )
)